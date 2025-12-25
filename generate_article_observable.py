#!/usr/bin/env python3
"""
The D-AI-LY Observable Markdown Article Generator

Generates Observable Framework-compatible markdown articles from Statistics Canada data.
Outputs to docs/en/ or docs/fr/ directories for the Observable site.
"""

import argparse
import json
import re
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Any, Optional
import logging
import sys

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(levelname)s: %(message)s'
)
logger = logging.getLogger(__name__)

# Global translations dictionary (loaded at runtime)
TRANSLATIONS: Dict[str, Any] = {}
LANG: str = "en"


# =============================================================================
# PRE-GENERATION VALIDATION
# =============================================================================

class ValidationError(Exception):
    """Raised when data validation fails critically."""
    pass


class ValidationResult:
    """Result of data validation with errors and warnings."""
    def __init__(self):
        self.errors: List[str] = []
        self.warnings: List[str] = []

    def add_error(self, msg: str):
        self.errors.append(msg)
        logger.error(msg)

    def add_warning(self, msg: str):
        self.warnings.append(msg)
        logger.warning(msg)

    @property
    def is_valid(self) -> bool:
        return len(self.errors) == 0

    def summary(self) -> str:
        if self.is_valid and not self.warnings:
            return "Validation passed with no issues"
        elif self.is_valid:
            return f"Validation passed with {len(self.warnings)} warning(s)"
        else:
            return f"Validation FAILED: {len(self.errors)} error(s), {len(self.warnings)} warning(s)"


def validate_data(data: Dict[str, Any], strict: bool = False) -> ValidationResult:
    """
    Validate JSON data before article generation.

    Args:
        data: The loaded JSON data from R script
        strict: If True, treat warnings as errors

    Returns:
        ValidationResult with errors and warnings
    """
    result = ValidationResult()

    # 1. Check required top-level fields
    required_fields = ["metadata", "latest", "time_series"]
    for field in required_fields:
        if field not in data:
            result.add_error(f"Missing required field: {field}")
        elif data[field] is None:
            result.add_error(f"Field '{field}' is null")

    if not result.is_valid:
        return result  # Can't continue without these fields

    # 2. Validate metadata
    metadata = data.get("metadata", {})
    required_metadata = ["table_number", "table_title", "reference_period"]
    for field in required_metadata:
        if not metadata.get(field):
            result.add_error(f"Missing metadata field: {field}")

    # 3. Validate latest data point
    latest = data.get("latest", {})
    if latest.get("value") is None:
        result.add_error("Latest value is missing or null")
    if latest.get("ref_date") is None:
        result.add_error("Latest ref_date is missing")

    if latest.get("mom_pct_change") is None:
        result.add_warning("Month-over-month change is missing")
    if latest.get("yoy_pct_change") is None:
        result.add_warning("Year-over-year change is missing")

    # 4. Validate date freshness
    if latest.get("ref_date"):
        try:
            ref_date = datetime.strptime(latest["ref_date"], "%Y-%m")
            age_days = (datetime.now() - ref_date).days
            age_months = age_days / 30

            if age_months > 6:
                result.add_error(f"Data is too old: {age_months:.1f} months (max 6)")
            elif age_months > 3:
                result.add_warning(f"Data is {age_months:.1f} months old")
        except ValueError:
            result.add_warning(f"Could not parse ref_date: {latest['ref_date']}")

    # 5. Validate time series length
    time_series = data.get("time_series", [])
    if isinstance(time_series, list):
        ts_length = len(time_series)
        if ts_length < 6:
            result.add_error(f"Time series too short: {ts_length} points (min 6)")
        elif ts_length < 12:
            result.add_warning(f"Time series has only {ts_length} points (recommend 12+)")
    else:
        result.add_error("Time series is not a list")

    # 6. Check for subseries and provincial data (optional but informative)
    if not data.get("subseries"):
        result.add_warning("No subseries breakdown data available")
    if not data.get("provincial"):
        result.add_warning("No provincial breakdown data available")

    # 7. Check R script validation results if present
    r_validation = data.get("validation", {})
    if r_validation:
        if not r_validation.get("passed", True):
            r_errors = r_validation.get("errors", {})
            for key, msg in r_errors.items() if isinstance(r_errors, dict) else []:
                result.add_error(f"R validation error ({key}): {msg}")

        r_warnings = r_validation.get("warnings", {})
        if isinstance(r_warnings, dict):
            for key, msg in r_warnings.items():
                result.add_warning(f"R validation warning ({key}): {msg}")
        elif isinstance(r_warnings, list):
            for msg in r_warnings:
                result.add_warning(f"R validation: {msg}")

    # 8. Sanity check values
    if latest.get("value") is not None:
        value = latest["value"]
        series_name = metadata.get("series_name", "")

        if series_name == "Consumer Price Index":
            if value < 50 or value > 300:
                result.add_error(f"CPI value {value:.1f} outside expected range (50-300)")

        if latest.get("mom_pct_change") is not None:
            mom = latest["mom_pct_change"]
            if abs(mom) > 15:
                result.add_warning(f"Large month-over-month change: {mom:.1f}%")

        if latest.get("yoy_pct_change") is not None:
            yoy = latest["yoy_pct_change"]
            if abs(yoy) > 50:
                result.add_warning(f"Large year-over-year change: {yoy:.1f}%")

    # Convert warnings to errors if strict mode
    if strict and result.warnings:
        for warning in result.warnings:
            result.errors.append(f"[strict] {warning}")
        result.warnings.clear()

    return result


def load_translations(lang: str = "en") -> Dict[str, Any]:
    """Load translations for the specified language."""
    global TRANSLATIONS, LANG
    LANG = lang
    translations_path = Path(__file__).parent / "templates" / "translations.json"
    with open(translations_path, "r", encoding="utf-8") as f:
        all_translations = json.load(f)
    TRANSLATIONS = all_translations.get(lang, all_translations["en"])
    return TRANSLATIONS


def t(key_path: str, default: str = "") -> str:
    """Get a translation by dot-notation path."""
    keys = key_path.split(".")
    value = TRANSLATIONS
    for key in keys:
        if isinstance(value, dict) and key in value:
            value = value[key]
        else:
            return default
    return value if isinstance(value, str) else default


def format_month_year(ref_date: str, lang: str = None) -> str:
    """Convert '2025-11' to 'November 2025' (or French equivalent)."""
    if lang is None:
        lang = LANG
    try:
        date = datetime.strptime(ref_date, "%Y-%m")
        month_en = date.strftime("%B")
        year = date.strftime("%Y")
        month_translated = t(f"months.{month_en}", month_en)
        return f"{month_translated} {year}"
    except ValueError:
        return ref_date


def generate_headline(data: Dict[str, Any]) -> str:
    """Generate a headline with key number first."""
    latest = data["latest"]
    metadata = data["metadata"]
    period = format_month_year(latest["ref_date"])
    series_name = metadata.get("series_name", "")

    mom_change = latest.get("mom_pct_change", 0)
    yoy_change = latest.get("yoy_pct_change", 0)

    if series_name == "Consumer Price Index":
        if LANG == "fr":
            if yoy_change > 0:
                return f"Les prix à la consommation en hausse de {yoy_change:.1f} % d'une année à l'autre en {period}"
            elif yoy_change < 0:
                return f"Les prix à la consommation en baisse de {abs(yoy_change):.1f} % d'une année à l'autre en {period}"
            else:
                return f"Les prix à la consommation inchangés en {period}"
        else:
            if yoy_change > 0:
                return f"Consumer prices up {yoy_change:.1f}% year over year in {period}"
            elif yoy_change < 0:
                return f"Consumer prices down {abs(yoy_change):.1f}% year over year in {period}"
            else:
                return f"Consumer prices unchanged in {period}"

    elif series_name == "Retail Sales":
        if LANG == "fr":
            if mom_change > 0:
                return f"Les ventes au détail en hausse de {mom_change:.1f} % en {period}"
            elif mom_change < 0:
                return f"Les ventes au détail en baisse de {abs(mom_change):.1f} % en {period}"
            else:
                return f"Les ventes au détail inchangées en {period}"
        else:
            if mom_change > 0:
                return f"Retail sales up {mom_change:.1f}% in {period}"
            elif mom_change < 0:
                return f"Retail sales down {abs(mom_change):.1f}% in {period}"
            else:
                return f"Retail sales unchanged in {period}"

    elif series_name == "Manufacturing Sales":
        if LANG == "fr":
            if mom_change > 0:
                return f"Les ventes du secteur de la fabrication en hausse de {mom_change:.1f} % en {period}"
            elif mom_change < 0:
                return f"Les ventes du secteur de la fabrication en baisse de {abs(mom_change):.1f} % en {period}"
            else:
                return f"Les ventes du secteur de la fabrication inchangées en {period}"
        else:
            if mom_change > 0:
                return f"Manufacturing sales up {mom_change:.1f}% in {period}"
            elif mom_change < 0:
                return f"Manufacturing sales down {abs(mom_change):.1f}% in {period}"
            else:
                return f"Manufacturing sales unchanged in {period}"

    else:
        title_short = metadata["table_title"].split(",")[0]
        if mom_change != 0:
            direction = "up" if mom_change > 0 else "down"
            if LANG == "fr":
                direction = "en hausse de" if mom_change > 0 else "en baisse de"
                return f"{title_short} {direction} {abs(mom_change):.1f} % en {period}"
            return f"{title_short} {direction} {abs(mom_change):.1f}% in {period}"
        return f"{title_short}: {period}"


def generate_slug(data: Dict[str, Any]) -> str:
    """Generate a URL-friendly slug from the data."""
    series_name = data["metadata"].get("series_name", "")
    ref_date = data["latest"]["ref_date"]

    try:
        date = datetime.strptime(ref_date, "%Y-%m")
        month = date.strftime("%B").lower()
        year = date.strftime("%Y")
    except ValueError:
        month = "unknown"
        year = ref_date

    if series_name == "Consumer Price Index":
        if LANG == "fr":
            return f"ipc-{month}-{year}"
        return f"cpi-{month}-{year}"
    elif series_name == "Retail Sales":
        if LANG == "fr":
            return f"ventes-detail-{month}-{year}"
        return f"retail-sales-{month}-{year}"
    elif series_name == "Manufacturing Sales":
        if LANG == "fr":
            return f"fabrication-{month}-{year}"
        return f"manufacturing-{month}-{year}"
    else:
        slug = series_name.lower().replace(" ", "-")
        return f"{slug}-{month}-{year}"


def generate_metric_value(data: Dict[str, Any]) -> str:
    """Generate the big metric value for the metric box."""
    latest = data["latest"]
    series_name = data["metadata"].get("series_name", "")
    yoy_change = latest.get("yoy_pct_change", 0)
    mom_change = latest.get("mom_pct_change", 0)

    if series_name == "Consumer Price Index":
        sign = "+" if yoy_change >= 0 else ""
        return f"{sign}{yoy_change:.1f}%"
    elif series_name == "Retail Sales":
        sign = "+" if mom_change >= 0 else ""
        return f"{sign}{mom_change:.1f}%"
    else:
        return f"{latest['value']:.1f}"


def generate_metric_label(data: Dict[str, Any]) -> str:
    """Generate the label for the metric box."""
    period = format_month_year(data["latest"]["ref_date"])
    series_name = data["metadata"].get("series_name", "")

    if series_name == "Consumer Price Index":
        if LANG == "fr":
            return f"Variation d'une année à l'autre de l'Indice des prix à la consommation, {period}"
        return f"Year-over-year change in Consumer Price Index, {period}"
    elif series_name == "Retail Sales":
        if LANG == "fr":
            return f"Variation mensuelle des ventes au détail, {period}"
        return f"Month-over-month change in retail sales, {period}"
    else:
        return f"{series_name}, {period}"


def generate_lede(data: Dict[str, Any]) -> str:
    """Generate the opening paragraph."""
    latest = data["latest"]
    comparison = data["comparison"]
    series_name = data["metadata"].get("series_name", "")
    period = format_month_year(latest["ref_date"])
    value = latest["value"]
    yoy = latest.get("yoy_pct_change", 0)
    mom = latest.get("mom_pct_change", 0)

    if series_name == "Consumer Price Index":
        if LANG == "fr":
            lede = f"L'Indice des prix à la consommation (IPC) a augmenté de {yoy:.1f} % en {period} par rapport au même mois un an plus tôt."
            lede += f" L'indice s'établissait à {value:.1f}"
            if comparison.get("year_ago"):
                year_ago_value = comparison["year_ago"]["value"]
                year_ago_period = format_month_year(comparison["year_ago"]["ref_date"])
                lede += f", en hausse par rapport à {year_ago_value:.1f} en {year_ago_period}"
            lede += "."
            if mom is not None and mom != 0:
                prev_period = format_month_year(comparison["previous_period"]["ref_date"])
                direction = "augmenté" if mom > 0 else "diminué"
                lede += f" Sur une base mensuelle, les prix ont {direction} de {abs(mom):.1f} % par rapport à {prev_period}."
        else:
            lede = f"The Consumer Price Index (CPI) rose {yoy:.1f}% in {period} compared with the same month a year earlier."
            lede += f" The index stood at {value:.1f}"
            if comparison.get("year_ago"):
                year_ago_value = comparison["year_ago"]["value"]
                year_ago_period = format_month_year(comparison["year_ago"]["ref_date"])
                lede += f", up from {year_ago_value:.1f} in {year_ago_period}"
            lede += "."
            if mom is not None and mom != 0:
                prev_period = format_month_year(comparison["previous_period"]["ref_date"])
                direction = "increased" if mom > 0 else "decreased"
                lede += f" On a monthly basis, prices {direction} {abs(mom):.1f}% from {prev_period}."
        return lede

    elif series_name == "Retail Sales":
        value_str = f"${value/1000:.1f} billion"
        if LANG == "fr":
            return f"Les ventes au détail ont totalisé {value_str} en {period}."
        return f"Retail sales totalled {value_str} in {period}."

    elif series_name == "Manufacturing Sales":
        value_str = f"${value/1000:.1f} billion"
        if LANG == "fr":
            direction = "augmenté" if mom > 0 else "diminué"
            lede = f"Les ventes du secteur de la fabrication ont {direction} de {abs(mom):.1f} % en {period}"
            lede += f", totalisant {value_str}."
            if yoy is not None and yoy != 0:
                lede += f" Par rapport au même mois un an plus tôt, les ventes ont augmenté de {yoy:.1f} %."
            return lede
        else:
            direction = "increased" if mom > 0 else "decreased"
            lede = f"Manufacturing sales {direction} {abs(mom):.1f}% in {period}"
            lede += f", totalling {value_str}."
            if yoy is not None and yoy != 0:
                lede += f" Compared with the same month a year earlier, sales were up {yoy:.1f}%."
            return lede

    return ""


def generate_highlights(data: Dict[str, Any]) -> List[str]:
    """Generate 3-5 highlight bullets."""
    latest = data["latest"]
    series_name = data["metadata"].get("series_name", "")
    period = format_month_year(latest["ref_date"])
    yoy = latest.get("yoy_pct_change", 0)
    subseries = data.get("subseries")
    provincial = data.get("provincial")

    highlights = []

    if series_name == "Consumer Price Index":
        # Main YoY finding
        if LANG == "fr":
            highlights.append(f"L'Indice des prix à la consommation a augmenté de {yoy:.1f} % d'une année à l'autre en {period}")
        else:
            highlights.append(f"The Consumer Price Index rose {yoy:.1f}% year over year in {period}")

        # Leading contributors from subseries
        if subseries and "category" in subseries:
            categories = subseries["category"]
            yoy_changes = subseries.get("yoy_pct_change", [])
            if categories and yoy_changes:
                # Sort by yoy change descending
                sorted_items = sorted(zip(categories, yoy_changes), key=lambda x: x[1] or 0, reverse=True)
                if sorted_items:
                    top_cat, top_yoy = sorted_items[0]
                    if LANG == "fr":
                        highlights.append(f"Les coûts du {top_cat.lower()} ont augmenté de {top_yoy:.1f} %, la plus forte hausse")
                    else:
                        highlights.append(f"{top_cat} costs increased {top_yoy:.1f}%, the largest contributor to inflation")

                    if len(sorted_items) > 1:
                        second_cat, second_yoy = sorted_items[1]
                        if LANG == "fr":
                            highlights.append(f"Les prix des {second_cat.lower()} ont augmenté de {second_yoy:.1f} % par rapport à {period.split()[0]} l'an dernier")
                        else:
                            highlights.append(f"{second_cat} prices rose {second_yoy:.1f}% compared to {period.split()[0]} last year")

        # Provincial highlight
        if provincial and "category" in provincial:
            categories = provincial["category"]
            yoy_changes = provincial.get("yoy_pct_change", [])
            if categories and yoy_changes:
                sorted_items = sorted(zip(categories, yoy_changes), key=lambda x: x[1] or 0, reverse=True)
                if sorted_items:
                    top_prov, top_yoy = sorted_items[0]
                    if LANG == "fr":
                        highlights.append(f"{top_prov} a enregistré la hausse la plus élevée à {top_yoy:.1f} %")
                    else:
                        highlights.append(f"{top_prov} recorded the highest increase at {top_yoy:.1f}%")

    return highlights[:5]


def generate_trend_chart_js(data: Dict[str, Any]) -> str:
    """Generate Observable Plot code for the trend chart."""
    time_series = data["time_series"]
    series_name = data["metadata"].get("series_name", "")

    # Get last 6 months for recent trend
    recent = time_series[-6:] if len(time_series) >= 6 else time_series

    if series_name == "Consumer Price Index":
        data_points = []
        for item in recent:
            ref_date = item["ref_date"]
            yoy = item.get("yoy_pct_change")
            if yoy is not None:
                data_points.append(f'  {{date: new Date("{ref_date}"), rate: {yoy:.1f}}}')

        data_js = ",\n".join(data_points)

        if LANG == "fr":
            title = "Taux d'inflation d'une année à l'autre (%)"
            y_label = "Pourcentage"
        else:
            title = "Year-over-year inflation rate (%)"
            y_label = "Percent"

        return f'''```js
import * as Plot from "npm:@observablehq/plot";

const inflationData = [
{data_js}
];

display(Plot.plot({{
  title: "{title}",
  width: 640,
  height: 280,
  y: {{domain: [0, 4], grid: true, label: "{y_label}"}},
  x: {{type: "utc", label: null}},
  marks: [
    Plot.ruleY([0]),
    Plot.ruleY([1, 3], {{stroke: "#ddd", strokeDasharray: "4,4"}}),
    Plot.lineY(inflationData, {{x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}}),
    Plot.dot(inflationData, {{x: "date", y: "rate", fill: "#AF3C43", r: 4}})
  ]
}}));
```'''

    return ""


def generate_component_chart_js(data: Dict[str, Any]) -> str:
    """Generate Observable Plot code for the component breakdown chart."""
    subseries = data.get("subseries")
    if not subseries or "category" not in subseries:
        return ""

    categories = subseries["category"]
    yoy_changes = subseries.get("yoy_pct_change", [])

    if not categories or not yoy_changes:
        return ""

    # Build data array
    data_points = []
    for cat, yoy in zip(categories, yoy_changes):
        if yoy is not None:
            data_points.append(f'  {{name: "{cat}", change: {yoy:.1f}}}')

    data_js = ",\n".join(data_points)

    if LANG == "fr":
        title = "Variation annuelle selon la composante (%)"
        x_label = "Variation en pourcentage"
    else:
        title = "Year-over-year change by component (%)"
        x_label = "Percent change"

    return f'''```js
const components = [
{data_js}
];

display(Plot.plot({{
  title: "{title}",
  width: 640,
  height: 320,
  marginLeft: 140,
  x: {{domain: [-1, 5], grid: true, label: "{x_label}"}},
  y: {{label: null}},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(components, {{
      y: "name",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {{y: "-x"}}
    }}),
    Plot.text(components, {{
      y: "name",
      x: "change",
      text: d => d.change.toFixed(1) + "%",
      dx: 20,
      fill: "currentColor"
    }})
  ]
}}));
```'''


def generate_provincial_table(data: Dict[str, Any]) -> str:
    """Generate markdown table for provincial data."""
    provincial = data.get("provincial")
    if not provincial or "category" not in provincial:
        return ""

    categories = provincial["category"]
    yoy_changes = provincial.get("yoy_pct_change", [])

    if not categories or not yoy_changes:
        return ""

    # Sort by yoy descending
    sorted_items = sorted(zip(categories, yoy_changes), key=lambda x: x[1] or 0, reverse=True)

    if LANG == "fr":
        header = "| Province | Variation annuelle |"
    else:
        header = "| Province | Year-over-year change |"

    separator = "|----------|----------------------|"

    rows = []
    for prov, yoy in sorted_items:
        sign = "+" if yoy >= 0 else ""
        rows.append(f"| {prov} | {sign}{yoy:.1f}% |")

    return "\n".join([header, separator] + rows)


def generate_note_to_readers(data: Dict[str, Any]) -> str:
    """Generate the note to readers section."""
    series_name = data["metadata"].get("series_name", "")

    if series_name == "Consumer Price Index":
        if LANG == "fr":
            p1 = "L'Indice des prix à la consommation mesure le taux de variation des prix que subissent les consommateurs canadiens. Il est calculé en comparant le coût d'un panier fixe de biens et de services achetés par les consommateurs au fil du temps."
            p2 = "L'IPC n'est pas désaisonnalisé. Les variations d'un mois à l'autre peuvent refléter des tendances saisonnières en plus des tendances de prix sous-jacentes."
        else:
            p1 = "The Consumer Price Index measures the rate of price change experienced by Canadian consumers. It is calculated by comparing the cost of a fixed basket of goods and services purchased by consumers over time."
            p2 = "The CPI is not seasonally adjusted. Month-to-month movements can reflect seasonal patterns in addition to underlying price trends."
        return f"{p1}\n\n{p2}"

    elif series_name == "Retail Sales":
        if LANG == "fr":
            return "Les ventes au détail représentent la valeur de toutes les ventes effectuées par l'intermédiaire des canaux de vente au détail. Les données sont désaisonnalisées."
        return "Retail sales represent the value of all sales made through retail channels. Data are seasonally adjusted."

    elif series_name == "Manufacturing Sales":
        if LANG == "fr":
            p1 = "L'enquête mensuelle sur les industries manufacturières mesure les ventes de biens fabriqués, les stocks et les commandes dans le secteur de la fabrication."
            p2 = "Les données sont désaisonnalisées pour tenir compte des variations saisonnières régulières."
            return f"{p1}\n\n{p2}"
        else:
            p1 = "The Monthly Survey of Manufacturing measures sales of goods manufactured, inventories and orders in the manufacturing sector."
            p2 = "Data are seasonally adjusted to account for regular seasonal variations."
            return f"{p1}\n\n{p2}"

    return ""


def generate_component_narrative(data: Dict[str, Any]) -> str:
    """Generate narrative for the component breakdown section."""
    subseries = data.get("subseries")
    series_name = data["metadata"].get("series_name", "")

    if not subseries or "category" not in subseries:
        return ""

    categories = subseries["category"]
    yoy_changes = subseries.get("yoy_pct_change", [])

    if not categories or not yoy_changes or series_name != "Consumer Price Index":
        return ""

    # Find top contributors
    sorted_items = sorted(zip(categories, yoy_changes), key=lambda x: x[1] or 0, reverse=True)

    if len(sorted_items) < 2:
        return ""

    top_cat, top_yoy = sorted_items[0]

    if LANG == "fr":
        narrative = f"Parmi les huit principales composantes de l'IPC, les prix du {top_cat.lower()} ont affiché la plus forte hausse annuelle, soit {top_yoy:.1f} %."
        narrative += " Les coûts hypothécaires et les loyers ont continué d'exercer une pression à la hausse sur cette catégorie."
    else:
        narrative = f"Among the eight major components of the CPI, {top_cat.lower()} prices showed the largest year-over-year increase at {top_yoy:.1f}%."
        narrative += " Mortgage interest costs and rent continued to put upward pressure on this category."

    # Add food narrative if available
    food_items = [(cat, yoy) for cat, yoy in sorted_items if "food" in cat.lower() or "aliment" in cat.lower()]
    if food_items:
        food_cat, food_yoy = food_items[0]
        if LANG == "fr":
            narrative += f"\n\nLes prix des {food_cat.lower()} ont augmenté de {food_yoy:.1f} %."
        else:
            narrative += f"\n\n{food_cat} prices rose {food_yoy:.1f}%."

    return narrative


def generate_provincial_narrative(data: Dict[str, Any]) -> str:
    """Generate narrative for provincial variation section."""
    provincial = data.get("provincial")

    if not provincial or "category" not in provincial:
        return ""

    categories = provincial["category"]
    yoy_changes = provincial.get("yoy_pct_change", [])

    if not categories or not yoy_changes:
        return ""

    sorted_items = sorted(zip(categories, yoy_changes), key=lambda x: x[1] or 0, reverse=True)

    if len(sorted_items) < 2:
        return ""

    top_prov, top_yoy = sorted_items[0]
    bottom_prov, bottom_yoy = sorted_items[-1]

    if LANG == "fr":
        return f"Les hausses de prix ont varié d'une province à l'autre. {top_prov} a enregistré la hausse annuelle la plus élevée, soit {top_yoy:.1f} %, en raison de la hausse des coûts du logement et du transport. {bottom_prov} a affiché la plus faible hausse, soit {bottom_yoy:.1f} %."
    else:
        return f"Price increases varied across provinces and territories. {top_prov} recorded the highest year-over-year increase at {top_yoy:.1f}%, driven by rising shelter and transportation costs. {bottom_prov} showed the lowest increase at {bottom_yoy:.1f}%."


def generate_article(data_path: str, output_dir: str, lang: str = "en",
                     strict: bool = False, skip_validation: bool = False) -> str:
    """
    Generate a complete Observable markdown article from data JSON.

    Args:
        data_path: Path to the JSON data file
        output_dir: Output directory for Observable site
        lang: Language for article generation ('en' or 'fr')
        strict: Treat validation warnings as errors
        skip_validation: Skip validation (not recommended)

    Returns:
        Path to the generated article

    Raises:
        ValidationError: If data validation fails
    """
    load_translations(lang)

    # Load data
    with open(data_path, "r") as f:
        data = json.load(f)

    # Run pre-generation validation
    if not skip_validation:
        logger.info(f"Validating data from {data_path}...")
        validation = validate_data(data, strict=strict)
        logger.info(validation.summary())

        if not validation.is_valid:
            raise ValidationError(
                f"Data validation failed: {validation.errors}\n"
                "Use --skip-validation to bypass (not recommended)"
            )

    # Generate content
    headline = generate_headline(data)
    slug = generate_slug(data)
    metric_value = generate_metric_value(data)
    metric_label = generate_metric_label(data)
    lede = generate_lede(data)
    highlights = generate_highlights(data)
    trend_chart = generate_trend_chart_js(data)
    component_chart = generate_component_chart_js(data)
    provincial_table = generate_provincial_table(data)
    note = generate_note_to_readers(data)
    component_narrative = generate_component_narrative(data)
    provincial_narrative = generate_provincial_narrative(data)

    # Get metadata
    table_number = data["metadata"]["table_number"]
    period = format_month_year(data["latest"]["ref_date"])
    series_name = data["metadata"].get("series_name", "")
    release_date = datetime.now().strftime("%Y-%m-%d")

    # Build section titles
    if series_name == "Consumer Price Index":
        if lang == "fr":
            trend_title = "Tendance de l'inflation d'une année à l'autre"
            component_title = "Prix selon les principales composantes"
            provincial_title = "Variation provinciale"
            note_title = "Note aux lecteurs"
            survey_name = "Indice des prix à la consommation"
        else:
            trend_title = "Year-over-year inflation trend"
            component_title = "Prices by major component"
            provincial_title = "Provincial variation"
            note_title = "Note to readers"
            survey_name = "Consumer Price Index"
    else:
        trend_title = "Trend"
        component_title = "Breakdown"
        provincial_title = "Regional variation"
        note_title = "Note to readers"
        survey_name = series_name

    # Build highlights markdown
    highlights_md = "\n".join(f"- {h}" for h in highlights)

    if lang == "fr":
        highlights_label = "Faits saillants"
        source_label = "Source"
        survey_label = "Enquête"
        period_label = "Période de référence"
    else:
        highlights_label = "Highlights"
        source_label = "Source"
        survey_label = "Survey"
        period_label = "Reference period"

    # Build the markdown document
    md = f"""---
title: {headline}
---

# {headline}

<p class="release-date">Released: {release_date}</p>

<div class="metric-box">
  <div class="value">{metric_value}</div>
  <div class="label">{metric_label}</div>
</div>

{lede}

<div class="highlights">

**{highlights_label}**

{highlights_md}

</div>

## {trend_title}

{trend_chart}

## {component_title}

{component_narrative}

{component_chart}
"""

    # Add provincial section if data exists
    if provincial_table:
        md += f"""
## {provincial_title}

{provincial_narrative}

{provincial_table}
"""

    # Add note to readers and source info
    md += f"""
<div class="note-to-readers">

## {note_title}

{note}

</div>

<div class="source-info">

**{source_label}:** Statistics Canada, Table {table_number}
**{survey_label}:** {survey_name}
**{period_label}:** {period}

</div>
"""

    # Write output
    output_path = Path(output_dir) / lang / slug / "index.md"
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with open(output_path, "w") as f:
        f.write(md)

    print(f"Observable article generated: {output_path}")
    print(f"Headline: {headline}")
    print(f"Slug: {slug}")

    return str(output_path)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate Observable markdown articles from Statistics Canada data"
    )
    parser.add_argument("data_path", help="Path to the data JSON file")
    parser.add_argument("--output-dir", default="docs",
                        help="Output directory for Observable site (default: docs)")
    parser.add_argument("--lang", choices=["en", "fr"], default="en",
                        help="Language for article generation (default: en)")
    parser.add_argument("--strict", action="store_true",
                        help="Treat validation warnings as errors")
    parser.add_argument("--skip-validation", action="store_true",
                        help="Skip data validation (not recommended)")
    parser.add_argument("--validate-only", action="store_true",
                        help="Only validate data, don't generate article")

    args = parser.parse_args()

    # Validate-only mode
    if args.validate_only:
        with open(args.data_path, "r") as f:
            data = json.load(f)
        result = validate_data(data, strict=args.strict)
        print(result.summary())
        if result.warnings:
            print("\nWarnings:")
            for w in result.warnings:
                print(f"  - {w}")
        if result.errors:
            print("\nErrors:")
            for e in result.errors:
                print(f"  - {e}")
        sys.exit(0 if result.is_valid else 1)

    try:
        generate_article(
            args.data_path,
            args.output_dir,
            lang=args.lang,
            strict=args.strict,
            skip_validation=args.skip_validation
        )
    except ValidationError as e:
        logger.error(str(e))
        sys.exit(1)
