#!/usr/bin/env python3
"""
The D-AI-LY Enhanced Article Generator

Generates richer Statistics Canada "The Daily"-style articles with:
- Data tables for component/regional breakdowns
- Multiple charts
- Expanded narrative sections
- Bilingual support (English/French)
"""

import argparse
import json
import re
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Any, Optional

# Global translations dictionary (loaded at runtime)
TRANSLATIONS: Dict[str, Any] = {}
LANG: str = "en"


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
    """Get a translation by dot-notation path (e.g., 'article.highlights')."""
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
        # Translate month name
        month_translated = t(f"months.{month_en}", month_en)
        if lang == "fr":
            return f"{month_translated} {year}"
        return f"{month_translated} {year}"
    except ValueError:
        return ref_date


def format_value(value: float, series_name: str) -> str:
    """Format a value based on the series type."""
    if series_name == "Retail Sales":
        return f"${value/1000:.1f} billion"
    elif series_name == "Consumer Price Index":
        return f"{value:.1f}"
    else:
        if value >= 1000000:
            return f"{value/1000000:.1f} million"
        elif value >= 1000:
            return f"{value/1000:.1f} thousand"
        else:
            return f"{value:.1f}"


def generate_headline(data: Dict[str, Any]) -> str:
    """Generate a headline (max 15 words) with key number first."""
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

    else:
        title_short = metadata["table_title"].split(",")[0]
        if mom_change != 0:
            direction = "up" if mom_change > 0 else "down"
            if LANG == "fr":
                direction = "en hausse de" if mom_change > 0 else "en baisse de"
                return f"{title_short} {direction} {abs(mom_change):.1f} % en {period}"
            return f"{title_short} {direction} {abs(mom_change):.1f}% in {period}"
        return f"{title_short}: {period}"


def generate_highlights(data: Dict[str, Any]) -> List[str]:
    """Generate 3-5 highlight bullets."""
    latest = data["latest"]
    comparison = data["comparison"]
    time_series = data["time_series"]
    metadata = data["metadata"]
    series_name = metadata.get("series_name", "")
    subseries = data.get("subseries")
    provincial = data.get("provincial")

    highlights = []
    period = format_month_year(latest["ref_date"])
    value = latest["value"]
    yoy = latest.get("yoy_pct_change", 0)
    mom = latest.get("mom_pct_change", 0)

    if series_name == "Consumer Price Index":
        # Main YoY finding
        if yoy is not None:
            if LANG == "fr":
                if yoy > 0:
                    highlights.append(
                        f"L'Indice des prix à la consommation a augmenté de {yoy:.1f} % d'une année à l'autre en {period}."
                    )
                elif yoy < 0:
                    highlights.append(
                        f"L'Indice des prix à la consommation a diminué de {abs(yoy):.1f} % d'une année à l'autre en {period}."
                    )
                else:
                    highlights.append(
                        f"L'Indice des prix à la consommation est demeuré inchangé d'une année à l'autre en {period}."
                    )
            else:
                if yoy > 0:
                    highlights.append(
                        f"The Consumer Price Index rose {yoy:.1f}% on a year-over-year basis in {period}."
                    )
                elif yoy < 0:
                    highlights.append(
                        f"The Consumer Price Index fell {abs(yoy):.1f}% on a year-over-year basis in {period}."
                    )
                else:
                    highlights.append(
                        f"The Consumer Price Index was unchanged on a year-over-year basis in {period}."
                    )

        # Leading contributor from subseries
        if subseries and "category" in subseries and len(subseries["category"]) > 0:
            max_idx = 0
            max_yoy = subseries["yoy_pct_change"][0] if subseries["yoy_pct_change"] else 0
            for i, yoy_val in enumerate(subseries.get("yoy_pct_change", [])):
                if yoy_val and yoy_val > max_yoy:
                    max_yoy = yoy_val
                    max_idx = i
            if max_yoy > 0:
                cat = subseries['category'][max_idx]
                if LANG == "fr":
                    highlights.append(
                        f"Les prix de la catégorie {cat.lower()} ont augmenté de {max_yoy:.1f} %, la plus forte hausse parmi les principales composantes."
                    )
                else:
                    highlights.append(
                        f"{cat} prices rose {max_yoy:.1f}%, the largest increase among major components."
                    )

        # Month-over-month
        if mom is not None:
            prev_period = format_month_year(comparison["previous_period"]["ref_date"])
            if LANG == "fr":
                if mom > 0:
                    highlights.append(
                        f"D'un mois à l'autre, l'IPC a augmenté de {mom:.1f} % par rapport à {prev_period}."
                    )
                elif mom < 0:
                    highlights.append(
                        f"D'un mois à l'autre, l'IPC a diminué de {abs(mom):.1f} % par rapport à {prev_period}."
                    )
            else:
                if mom > 0:
                    highlights.append(
                        f"On a monthly basis, the CPI increased {mom:.1f}% from {prev_period}."
                    )
                elif mom < 0:
                    highlights.append(
                        f"On a monthly basis, the CPI decreased {abs(mom):.1f}% from {prev_period}."
                    )

        # Provincial highlight
        if provincial and "category" in provincial and len(provincial["category"]) > 0:
            max_idx = 0
            max_yoy = provincial["yoy_pct_change"][0] if provincial["yoy_pct_change"] else 0
            for i, yoy_val in enumerate(provincial.get("yoy_pct_change", [])):
                if yoy_val and yoy_val > max_yoy:
                    max_yoy = yoy_val
                    max_idx = i
            if max_yoy > 0:
                prov = provincial['category'][max_idx]
                if LANG == "fr":
                    highlights.append(
                        f"{prov} a enregistré la hausse annuelle la plus élevée, soit {max_yoy:.1f} %."
                    )
                else:
                    highlights.append(
                        f"{prov} recorded the highest year-over-year increase at {max_yoy:.1f}%."
                    )

    elif series_name == "Retail Sales":
        value_str = format_value(value, series_name)
        if LANG == "fr":
            if mom is not None and mom != 0:
                direction = "ont augmenté" if mom > 0 else "ont diminué"
                highlights.append(
                    f"Les ventes au détail {direction} de {abs(mom):.1f} % pour atteindre {value_str} en {period}."
                )
            else:
                highlights.append(f"Les ventes au détail ont totalisé {value_str} en {period}.")

            if yoy is not None and yoy != 0:
                direction = "supérieures" if yoy > 0 else "inférieures"
                highlights.append(
                    f"Les ventes étaient {direction} de {abs(yoy):.1f} % par rapport au même mois l'an dernier."
                )
        else:
            if mom is not None and mom != 0:
                direction = "increased" if mom > 0 else "decreased"
                highlights.append(
                    f"Retail sales {direction} {abs(mom):.1f}% to {value_str} in {period}."
                )
            else:
                highlights.append(f"Retail sales were {value_str} in {period}.")

            if yoy is not None and yoy != 0:
                direction = "up" if yoy > 0 else "down"
                highlights.append(
                    f"Sales were {direction} {abs(yoy):.1f}% compared with {period.split()[0]} of last year."
                )

    else:
        # Generic highlights
        if yoy is not None and yoy != 0:
            if LANG == "fr":
                direction = "a augmenté" if yoy > 0 else "a diminué"
                highlights.append(f"L'indicateur {direction} de {abs(yoy):.1f} % d'une année à l'autre en {period}.")
            else:
                direction = "increased" if yoy > 0 else "decreased"
                highlights.append(f"The indicator {direction} {abs(yoy):.1f}% year over year in {period}.")

    return highlights[:5]


def generate_sections(data: Dict[str, Any]) -> List[str]:
    """Generate article body sections."""
    latest = data["latest"]
    comparison = data["comparison"]
    metadata = data["metadata"]
    time_series = data["time_series"]
    series_name = metadata.get("series_name", "")

    sections = []
    period = format_month_year(latest["ref_date"])
    value = latest["value"]
    yoy = latest.get("yoy_pct_change", 0)
    mom = latest.get("mom_pct_change", 0)

    if series_name == "Consumer Price Index":
        if LANG == "fr":
            # Lede (French)
            lede = f"L'Indice des prix à la consommation (IPC) s'établissait à {value:.1f} en {period}"
            if yoy is not None and yoy != 0:
                direction = "en hausse de" if yoy > 0 else "en baisse de"
                lede += f", {direction} {abs(yoy):.1f} % par rapport au même mois un an plus tôt"
            lede += "."
            if comparison.get("year_ago"):
                year_ago_value = comparison["year_ago"]["value"]
                lede += f" Il y a un an, l'indice s'établissait à {year_ago_value:.1f}."
            sections.append(lede)

            # Month-over-month (French)
            if mom is not None:
                prev_value = comparison["previous_period"]["value"]
                prev_period = format_month_year(comparison["previous_period"]["ref_date"])
                if mom != 0:
                    direction = "a augmenté" if mom > 0 else "a diminué"
                    sections.append(
                        f"D'un mois à l'autre, l'indice {direction} de {abs(mom):.2f} %, "
                        f"passant de {prev_value:.1f} en {prev_period} à {value:.1f} en {period}."
                    )

            # Historical context (French)
            if len(time_series) >= 12:
                yoy_rates = [d["yoy_pct_change"] for d in time_series if d.get("yoy_pct_change") is not None]
                if yoy_rates:
                    max_yoy = max(yoy_rates)
                    min_yoy = min(yoy_rates)
                    if max_yoy != min_yoy:
                        sections.append(
                            f"Au cours des deux dernières années, le taux d'inflation d'une année à l'autre "
                            f"a varié entre {min_yoy:.1f} % et {max_yoy:.1f} %."
                        )
        else:
            # Lede (English)
            lede = f"The Consumer Price Index (CPI) stood at {value:.1f} in {period}"
            if yoy is not None and yoy != 0:
                direction = "up" if yoy > 0 else "down"
                lede += f", {direction} {abs(yoy):.1f}% compared with the same month a year earlier"
            lede += "."
            if comparison.get("year_ago"):
                year_ago_value = comparison["year_ago"]["value"]
                lede += f" A year ago, the index was {year_ago_value:.1f}."
            sections.append(lede)

            # Month-over-month (English)
            if mom is not None:
                prev_value = comparison["previous_period"]["value"]
                prev_period = format_month_year(comparison["previous_period"]["ref_date"])
                if mom != 0:
                    direction = "increased" if mom > 0 else "decreased"
                    sections.append(
                        f"On a month-over-month basis, the index {direction} {abs(mom):.2f}% "
                        f"from {prev_value:.1f} in {prev_period} to {value:.1f} in {period}."
                    )

            # Historical context (English)
            if len(time_series) >= 12:
                yoy_rates = [d["yoy_pct_change"] for d in time_series if d.get("yoy_pct_change") is not None]
                if yoy_rates:
                    max_yoy = max(yoy_rates)
                    min_yoy = min(yoy_rates)
                    if max_yoy != min_yoy:
                        sections.append(
                            f"Over the past two years, the year-over-year inflation rate has ranged "
                            f"from {min_yoy:.1f}% to {max_yoy:.1f}%."
                        )

    elif series_name == "Retail Sales":
        value_str = format_value(value, series_name)
        if LANG == "fr":
            lede = f"Les ventes au détail ont totalisé {value_str} en {period}"
            if mom is not None and mom != 0:
                direction = "en hausse de" if mom > 0 else "en baisse de"
                lede += f", {direction} {abs(mom):.1f} % par rapport au mois précédent"
            lede += "."
            if yoy is not None and yoy != 0:
                direction = "supérieures" if yoy > 0 else "inférieures"
                lede += f" Les ventes étaient {direction} de {abs(yoy):.1f} % par rapport au même mois l'an dernier."
            sections.append(lede)

            if comparison.get("previous_period"):
                prev_value = comparison["previous_period"]["value"]
                prev_value_str = format_value(prev_value, series_name)
                prev_period = format_month_year(comparison["previous_period"]["ref_date"])
                if mom != 0:
                    direction = "ont augmenté" if mom > 0 else "ont diminué"
                    sections.append(
                        f"D'un mois à l'autre, les ventes au détail {direction} par rapport à "
                        f"{prev_value_str} en {prev_period}."
                    )
        else:
            lede = f"Retail sales totalled {value_str} in {period}"
            if mom is not None and mom != 0:
                direction = "up" if mom > 0 else "down"
                lede += f", {direction} {abs(mom):.1f}% from the previous month"
            lede += "."
            if yoy is not None and yoy != 0:
                direction = "higher" if yoy > 0 else "lower"
                lede += f" Sales were {abs(yoy):.1f}% {direction} than in the same month last year."
            sections.append(lede)

            if comparison.get("previous_period"):
                prev_value = comparison["previous_period"]["value"]
                prev_value_str = format_value(prev_value, series_name)
                prev_period = format_month_year(comparison["previous_period"]["ref_date"])
                if mom != 0:
                    direction = "increased" if mom > 0 else "decreased"
                    sections.append(
                        f"On a month-over-month basis, retail sales {direction} from "
                        f"{prev_value_str} in {prev_period}."
                    )

    return sections


def generate_subseries_narrative(data: Dict[str, Any]) -> str:
    """Generate narrative about subseries/component breakdown."""
    subseries = data.get("subseries")
    series_name = data["metadata"].get("series_name", "")
    period = format_month_year(data["latest"]["ref_date"])

    if not subseries or "category" not in subseries:
        return ""

    categories = subseries["category"]
    yoy_changes = subseries.get("yoy_pct_change", [])

    if not categories or not yoy_changes:
        return ""

    # Find highest and lowest
    sorted_indices = sorted(range(len(yoy_changes)), key=lambda i: yoy_changes[i] or 0, reverse=True)

    if series_name == "Consumer Price Index":
        top_cat = categories[sorted_indices[0]]
        top_yoy = yoy_changes[sorted_indices[0]]
        bottom_cat = categories[sorted_indices[-1]]
        bottom_yoy = yoy_changes[sorted_indices[-1]]

        if LANG == "fr":
            narrative = f"<p>Parmi les principales composantes, les prix de la catégorie {top_cat.lower()} ont enregistré la plus forte hausse annuelle, soit {top_yoy:.1f} %"
            if len(sorted_indices) > 1 and sorted_indices[1] < len(categories):
                second_cat = categories[sorted_indices[1]]
                second_yoy = yoy_changes[sorted_indices[1]]
                narrative += f", suivie de la catégorie {second_cat.lower()} ({second_yoy:.1f} %)"
            narrative += ".</p>"
            narrative += f"<p>Les prix de la catégorie {bottom_cat.lower()} ont affiché la plus faible hausse, soit {bottom_yoy:.1f} %.</p>"
        else:
            narrative = f"<p>Among major components, {top_cat.lower()} prices recorded the largest year-over-year increase at {top_yoy:.1f}%"
            if len(sorted_indices) > 1 and sorted_indices[1] < len(categories):
                second_cat = categories[sorted_indices[1]]
                second_yoy = yoy_changes[sorted_indices[1]]
                narrative += f", followed by {second_cat.lower()} ({second_yoy:.1f}%)"
            narrative += ".</p>"
            narrative += f"<p>{bottom_cat} prices showed the smallest increase at {bottom_yoy:.1f}%.</p>"
        return narrative

    return ""


def generate_provincial_narrative(data: Dict[str, Any]) -> str:
    """Generate narrative about provincial breakdown."""
    provincial = data.get("provincial")
    series_name = data["metadata"].get("series_name", "")
    period = format_month_year(data["latest"]["ref_date"])

    if not provincial or "category" not in provincial:
        return ""

    categories = provincial["category"]
    yoy_changes = provincial.get("yoy_pct_change", [])

    if not categories or not yoy_changes:
        return ""

    sorted_indices = sorted(range(len(yoy_changes)), key=lambda i: yoy_changes[i] or 0, reverse=True)

    if series_name == "Consumer Price Index":
        top_prov = categories[sorted_indices[0]]
        top_yoy = yoy_changes[sorted_indices[0]]
        bottom_prov = categories[sorted_indices[-1]]
        bottom_yoy = yoy_changes[sorted_indices[-1]]

        if LANG == "fr":
            narrative = f"<p>Les hausses de prix d'une année à l'autre ont varié d'une province à l'autre. "
            narrative += f"{top_prov} a enregistré la hausse la plus élevée, soit {top_yoy:.1f} %, "
            narrative += f"tandis que {bottom_prov} a affiché la plus faible, soit {bottom_yoy:.1f} %.</p>"
        else:
            narrative = f"<p>Year-over-year price increases varied across provinces. {top_prov} recorded the highest increase at {top_yoy:.1f}%, "
            narrative += f"while {bottom_prov} had the lowest at {bottom_yoy:.1f}%.</p>"
        return narrative

    return ""


def generate_note_to_readers(data: Dict[str, Any]) -> str:
    """Generate the methodology/notes section."""
    series_name = data["metadata"].get("series_name", "")

    if series_name == "Retail Sales":
        return t("retail.note_methodology",
            "Retail trade sales represent the value of all sales made through retail channels, "
            "including both in-store and online transactions. Data are seasonally adjusted to "
            "account for regular seasonal patterns. Values are expressed in current dollars. "
            "For more information, consult Statistics Canada's retail trade portal."
        )
    else:
        return t("cpi.note_methodology",
            "The Consumer Price Index (CPI) measures the rate of price change experienced by "
            "Canadian consumers. It is calculated by comparing the cost of a fixed basket of "
            "goods and services purchased by consumers over time. The CPI is not seasonally adjusted. "
            "For more information, consult Statistics Canada's Consumer Price Index portal."
        )


def generate_article(data_path: str, output_path: str, lang: str = "en") -> str:
    """Generate a complete enhanced article from data JSON."""
    # Load translations for the specified language
    load_translations(lang)

    # Load data
    with open(data_path, "r") as f:
        data = json.load(f)

    # Generate content
    headline = generate_headline(data)
    highlights = generate_highlights(data)
    sections = generate_sections(data)
    note = generate_note_to_readers(data)
    series_name = data["metadata"].get("series_name", "")
    period = format_month_year(data['latest']['ref_date'])
    start_period = format_month_year(data['time_series'][0]['ref_date'])

    # Chart configuration (bilingual)
    if series_name == "Retail Sales":
        if lang == "fr":
            chart_title = f"Ventes au détail, {start_period} à {period}"
            chart_y_label = t("retail.sales_label", "Ventes (en millions de dollars)")
            subseries_title = t("sections.sales_by_subsector", "Ventes selon le sous-secteur du commerce de détail")
            subseries_column_header = t("tables.subsector", "Sous-secteur")
            subseries_table_caption = f"Ventes au détail selon le sous-secteur, {period}"
            subseries_chart_title = t("sections.yoy_by_subsector", "Variation annuelle selon le sous-secteur")
        else:
            chart_title = f"Retail Sales, {start_period} to {period}"
            chart_y_label = "Sales ($ millions)"
            subseries_title = "Sales by retail subsector"
            subseries_column_header = "Subsector"
            subseries_table_caption = f"Retail sales by subsector, {period}"
            subseries_chart_title = "Year-over-year change by subsector"
    else:
        if lang == "fr":
            chart_title = f"Indice des prix à la consommation, {start_period} à {period}"
            chart_y_label = t("cpi.index_label", "Indice (2002=100)")
            subseries_title = t("sections.prices_by_component", "Prix selon les principales composantes")
            subseries_column_header = t("tables.component", "Composante")
            subseries_table_caption = f"Indice des prix à la consommation selon la composante principale, {period}"
            subseries_chart_title = t("sections.yoy_by_component", "Variation annuelle selon la composante")
        else:
            chart_title = f"Consumer Price Index, {start_period} to {period}"
            chart_y_label = "Index (2002=100)"
            subseries_title = "Prices by major component"
            subseries_column_header = "Component"
            subseries_table_caption = f"Consumer Price Index by major component, {period}"
            subseries_chart_title = "Year-over-year change by component"

    # Check for subseries and provincial data
    has_subseries = data.get("subseries") and "category" in data.get("subseries", {}) and len(data["subseries"]["category"]) > 0
    has_provincial = data.get("provincial") and "category" in data.get("provincial", {}) and len(data["provincial"]["category"]) > 0

    # Generate subseries and provincial narratives
    subseries_narrative = generate_subseries_narrative(data) if has_subseries else ""
    provincial_narrative = generate_provincial_narrative(data) if has_provincial else ""

    # Load template
    template_path = Path(__file__).parent / "templates" / "article_enhanced.html"
    with open(template_path, "r") as f:
        template = f.read()

    # Prepare JSON data for embedding
    time_series_json = json.dumps(data["time_series"])
    subseries_json = json.dumps(data.get("subseries", {}))
    provincial_json = json.dumps(data.get("provincial", {}))

    # Format release date bilingually
    now = datetime.now()
    if lang == "fr":
        month_en = now.strftime("%B")
        month_fr = t(f"months.{month_en}", month_en)
        release_date_display = f"{now.day} {month_fr} {now.year}"
    else:
        release_date_display = now.strftime("%B %d, %Y")

    # Template substitution
    html = template
    html = html.replace("{{headline}}", headline)
    html = html.replace("{{release_date}}", release_date_display)
    html = html.replace("{{chart_title}}", chart_title)
    html = html.replace("{{chart_y_label}}", chart_y_label)
    html = html.replace("{{series_name}}", series_name)
    html = html.replace("{{note_to_readers}}", note)
    html = html.replace("{{table_number}}", data["metadata"]["table_number"])
    html = html.replace("{{reference_period}}", period)

    # StatCan metadata and URLs
    urls = data.get("urls", {})
    metadata = data["metadata"]
    html = html.replace("{{table_viewer_url}}", urls.get("table_viewer", ""))
    html = html.replace("{{csv_download_url}}", urls.get("csv_download", ""))

    # Legacy CANSIM ID (conditional)
    cansim_id = metadata.get("cansim_id", "")
    if cansim_id:
        html = re.sub(r'\{\{#cansim_id\}\}', '', html)
        html = re.sub(r'\{\{/cansim_id\}\}', '', html)
        html = html.replace("{{cansim_id}}", cansim_id)
    else:
        html = re.sub(r'\{\{#cansim_id\}\}.*?\{\{/cansim_id\}\}', '', html, flags=re.DOTALL)

    # Survey info
    survey_code = metadata.get("survey_code", "")
    html = html.replace("{{survey_code}}", survey_code)

    # Map survey codes to survey names (bilingual)
    if lang == "fr":
        survey_names = {
            "2301": "Indice des prix à la consommation",
            "2406": "Enquête mensuelle sur le commerce de détail",
            "3701": "Enquête sur la population active",
        }
        default_survey = "Enquête de Statistique Canada"
    else:
        survey_names = {
            "2301": "Consumer Price Index",
            "2406": "Monthly Retail Trade Survey",
            "3701": "Labour Force Survey",
        }
        default_survey = "Statistics Canada survey"
    survey_name = survey_names.get(survey_code, default_survey)
    html = html.replace("{{survey_name}}", survey_name)

    # Release date from metadata (bilingual)
    release_time = metadata.get("release_time", "")
    if release_time:
        try:
            release_dt = datetime.strptime(release_time[:10], "%Y-%m-%d")
            if lang == "fr":
                src_month_en = release_dt.strftime("%B")
                src_month_fr = t(f"months.{src_month_en}", src_month_en)
                release_date_source = f"{release_dt.day} {src_month_fr} {release_dt.year}"
            else:
                release_date_source = release_dt.strftime("%B %d, %Y")
            html = html.replace("{{release_date_source}}", release_date_source)
        except ValueError:
            html = html.replace("{{release_date_source}}", release_time)
    else:
        not_available = "Non disponible" if lang == "fr" else "Not available"
        html = html.replace("{{release_date_source}}", not_available)
    html = html.replace("{{time_series_json}}", time_series_json)
    html = html.replace("{{subseries_json}}", subseries_json)
    html = html.replace("{{provincial_json}}", provincial_json)

    # Subseries configuration
    html = html.replace("{{subseries_title}}", subseries_title)
    html = html.replace("{{subseries_column_header}}", subseries_column_header)
    html = html.replace("{{subseries_table_caption}}", subseries_table_caption)
    html = html.replace("{{subseries_chart_title}}", subseries_chart_title)
    html = html.replace("{{subseries_narrative}}", subseries_narrative)

    # Provincial configuration (bilingual)
    if lang == "fr":
        provincial_table_caption = f"Indice des prix à la consommation selon la province, {period}"
    else:
        provincial_table_caption = f"Consumer Price Index by province, {period}"
    html = html.replace("{{provincial_table_caption}}", provincial_table_caption)
    html = html.replace("{{provincial_narrative}}", provincial_narrative)

    # Handle conditional sections
    if has_subseries:
        html = re.sub(r'\{\{#has_subseries\}\}', '', html)
        html = re.sub(r'\{\{/has_subseries\}\}', '', html)
    else:
        html = re.sub(r'\{\{#has_subseries\}\}.*?\{\{/has_subseries\}\}', '', html, flags=re.DOTALL)

    if has_provincial:
        html = re.sub(r'\{\{#has_provincial\}\}', '', html)
        html = re.sub(r'\{\{/has_provincial\}\}', '', html)
    else:
        html = re.sub(r'\{\{#has_provincial\}\}.*?\{\{/has_provincial\}\}', '', html, flags=re.DOTALL)

    # Handle definitions (simplified - not in enhanced data yet)
    html = re.sub(r'\{\{#has_definitions\}\}.*?\{\{/has_definitions\}\}', '', html, flags=re.DOTALL)

    # Handle highlights (mustache-style list)
    highlights_html = "\n".join(f"      <li>{h}</li>" for h in highlights)
    html = re.sub(
        r'\{\{#highlights\}\}.*?\{\{/highlights\}\}',
        highlights_html,
        html,
        flags=re.DOTALL
    )

    # Handle sections
    sections_html = "\n".join(f"    <p>{s}</p>" for s in sections)
    html = re.sub(
        r'\{\{#sections\}\}.*?\{\{/sections\}\}',
        sections_html,
        html,
        flags=re.DOTALL
    )

    # Write output
    Path(output_path).parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w") as f:
        f.write(html)

    print(f"Enhanced article generated: {output_path}")
    print(f"Headline: {headline}")
    print(f"Highlights: {len(highlights)}")
    print(f"Sections: {len(sections)}")
    print(f"Has subseries table: {has_subseries}")
    print(f"Has provincial table: {has_provincial}")

    return output_path


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate Statistics Canada Daily-style articles from CANSIM data"
    )
    parser.add_argument("data_path", help="Path to the data JSON file")
    parser.add_argument("output_path", nargs="?", default="output/article_enhanced.html",
                        help="Output HTML file path (default: output/article_enhanced.html)")
    parser.add_argument("--lang", choices=["en", "fr"], default="en",
                        help="Language for article generation (default: en)")

    args = parser.parse_args()

    generate_article(args.data_path, args.output_path, lang=args.lang)
