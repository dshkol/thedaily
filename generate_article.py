#!/usr/bin/env python3
"""
The D-AI-LY Article Generator

Generates Statistics Canada "The Daily"-style articles from CANSIM data.
Uses The Daily voice: neutral, clinical, inverted pyramid structure.
"""

import json
import re
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Any


def format_month_year(ref_date: str) -> str:
    """Convert '2025-11' to 'November 2025'."""
    try:
        date = datetime.strptime(ref_date, "%Y-%m")
        return date.strftime("%B %Y")
    except ValueError:
        return ref_date


def format_change(value: float, is_percentage: bool = False) -> str:
    """Format a change value with appropriate direction language."""
    if value > 0:
        direction = "increased"
    elif value < 0:
        direction = "decreased"
        value = abs(value)
    else:
        direction = "remained unchanged"
        return direction

    if is_percentage:
        return f"{direction} {value:.1f}%"
    else:
        return f"{direction} {value:.1f}"


def generate_headline(data: Dict[str, Any]) -> str:
    """Generate a headline (max 15 words) with key number first."""
    latest = data["latest"]
    metadata = data["metadata"]
    period = format_month_year(latest["ref_date"])
    series_name = metadata.get("series_name", "")

    mom_change = latest.get("mom_pct_change", 0)
    yoy_change = latest.get("yoy_pct_change", 0)

    if "Consumer Price Index" in metadata["table_title"] or series_name == "Consumer Price Index":
        if yoy_change > 0:
            return f"Consumer prices up {yoy_change:.1f}% year over year in {period}"
        elif yoy_change < 0:
            return f"Consumer prices down {abs(yoy_change):.1f}% year over year in {period}"
        else:
            return f"Consumer prices unchanged in {period}"

    elif "Retail" in metadata["table_title"] or series_name == "Retail Sales":
        # Retail uses month-over-month as the lead
        if mom_change > 0:
            return f"Retail sales up {mom_change:.1f}% in {period}"
        elif mom_change < 0:
            return f"Retail sales down {abs(mom_change):.1f}% in {period}"
        else:
            return f"Retail sales unchanged in {period}"

    elif "Labour" in metadata["table_title"] or "Employment" in metadata["table_title"]:
        return f"Employment update for {period}"

    else:
        # Generic headline
        title_short = metadata["table_title"].split(",")[0]
        if mom_change != 0:
            direction = "up" if mom_change > 0 else "down"
            return f"{title_short} {direction} {abs(mom_change):.1f}% in {period}"
        return f"{title_short}: {period}"


def format_value(value: float, series_name: str) -> str:
    """Format a value based on the series type."""
    if series_name == "Retail Sales":
        # Value is in millions, convert to billions
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


def generate_highlights(data: Dict[str, Any]) -> List[str]:
    """Generate 3-5 highlight bullets."""
    latest = data["latest"]
    comparison = data["comparison"]
    time_series = data["time_series"]
    metadata = data["metadata"]
    series_name = metadata.get("series_name", "")

    highlights = []

    # Main finding
    period = format_month_year(latest["ref_date"])
    value = latest["value"]
    yoy = latest.get("yoy_pct_change", 0)
    mom = latest.get("mom_pct_change", 0)

    if series_name == "Retail Sales":
        # Retail sales highlights
        value_str = format_value(value, series_name)
        if mom is not None and mom != 0:
            direction = "increased" if mom > 0 else "decreased"
            highlights.append(
                f"Retail sales {direction} {abs(mom):.1f}% to {value_str} in {period}."
            )
        else:
            highlights.append(
                f"Retail sales were {value_str} in {period}."
            )

        if yoy is not None and yoy != 0:
            direction = "up" if yoy > 0 else "down"
            highlights.append(
                f"Sales were {direction} {abs(yoy):.1f}% compared with {period.split()[0]} of last year."
            )

    else:
        # CPI / default highlights
        if yoy is not None:
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

        # Month-over-month comparison
        if mom is not None:
            prev_period = format_month_year(comparison["previous_period"]["ref_date"])
            if mom > 0:
                highlights.append(
                    f"On a monthly basis, the CPI increased {mom:.2f}% from {prev_period}."
                )
            elif mom < 0:
                highlights.append(
                    f"On a monthly basis, the CPI decreased {abs(mom):.2f}% from {prev_period}."
                )
            else:
                highlights.append(
                    f"The index was unchanged from {prev_period}."
                )

    # Trend context (compare to 3 months ago)
    if len(time_series) >= 4:
        three_months_ago = time_series[-4]
        three_month_yoy = three_months_ago.get("yoy_pct_change")
        if three_month_yoy is not None and yoy is not None:
            diff = yoy - three_month_yoy
            period_3m = format_month_year(three_months_ago["ref_date"])
            if abs(diff) >= 0.1:
                direction = "higher" if diff > 0 else "lower"
                highlights.append(
                    f"The year-over-year rate was {abs(diff):.1f} percentage points {direction} than in {period_3m}."
                )

    return highlights[:5]  # Max 5 highlights


def generate_sections(data: Dict[str, Any]) -> List[str]:
    """Generate article body sections."""
    latest = data["latest"]
    comparison = data["comparison"]
    metadata = data["metadata"]
    time_series = data["time_series"]
    series_name = metadata.get("series_name", "")

    sections = []

    # Lede paragraph
    period = format_month_year(latest["ref_date"])
    value = latest["value"]
    yoy = latest.get("yoy_pct_change", 0)
    mom = latest.get("mom_pct_change", 0)

    if series_name == "Retail Sales":
        value_str = format_value(value, series_name)
        lede = f"Retail sales totalled {value_str} in {period}"
        if mom is not None and mom != 0:
            direction = "up" if mom > 0 else "down"
            lede += f", {direction} {abs(mom):.1f}% from the previous month"
        lede += "."
        if yoy is not None and yoy != 0:
            direction = "higher" if yoy > 0 else "lower"
            lede += f" Sales were {abs(yoy):.1f}% {direction} than in the same month last year."
        sections.append(lede)

        # Month-over-month detail
        if comparison.get("previous_period"):
            prev_value = comparison["previous_period"]["value"]
            prev_value_str = format_value(prev_value, series_name)
            prev_period = format_month_year(comparison["previous_period"]["ref_date"])
            if mom != 0:
                direction = "increased" if mom > 0 else "decreased"
                mom_section = (
                    f"On a month-over-month basis, retail sales {direction} from "
                    f"{prev_value_str} in {prev_period}."
                )
            else:
                mom_section = f"Sales were unchanged from {prev_period}."
            sections.append(mom_section)

        # Historical context for retail
        if len(time_series) >= 12:
            yoy_rates = [d["yoy_pct_change"] for d in time_series if d.get("yoy_pct_change") is not None]
            if yoy_rates:
                max_yoy = max(yoy_rates)
                min_yoy = min(yoy_rates)
                if max_yoy != min_yoy:
                    context = (
                        f"Over the past two years, year-over-year retail sales growth has ranged "
                        f"from {min_yoy:.1f}% to {max_yoy:.1f}%."
                    )
                    sections.append(context)

    else:
        # CPI / default sections
        lede = (
            f"The Consumer Price Index (CPI) stood at {value:.1f} in {period}, "
        )
        if yoy is not None and yoy != 0:
            direction = "up" if yoy > 0 else "down"
            lede += f"{direction} {abs(yoy):.1f}% compared with the same month a year earlier. "
        if comparison.get("year_ago"):
            year_ago_value = comparison["year_ago"]["value"]
            lede += f"A year ago, the index was {year_ago_value:.1f}."

        sections.append(lede)

        # Month-over-month context
        if mom is not None:
            prev_value = comparison["previous_period"]["value"]
            prev_period = format_month_year(comparison["previous_period"]["ref_date"])
            if mom != 0:
                direction = "increased" if mom > 0 else "decreased"
                mom_section = (
                    f"On a month-over-month basis, the index {direction} {abs(mom):.2f}% "
                    f"from {prev_value:.1f} in {prev_period} to {value:.1f} in {period}."
                )
            else:
                mom_section = (
                    f"The index was unchanged from {prev_period}, remaining at {value:.1f}."
                )
            sections.append(mom_section)

        # Historical context
        if len(time_series) >= 12:
            yoy_rates = [d["yoy_pct_change"] for d in time_series if d.get("yoy_pct_change") is not None]

            if yoy_rates:
                max_yoy = max(yoy_rates)
                min_yoy = min(yoy_rates)

                if max_yoy != min_yoy:
                    context = (
                        f"Over the past two years, the year-over-year inflation rate has ranged "
                        f"from {min_yoy:.1f}% to {max_yoy:.1f}%."
                    )
                    sections.append(context)

    return sections


def generate_note_to_readers(data: Dict[str, Any]) -> str:
    """Generate the methodology/notes section."""
    metadata = data["metadata"]
    series_name = metadata.get("series_name", "")

    if series_name == "Retail Sales":
        return (
            "Retail trade sales represent the value of all sales made through retail channels, "
            "including both in-store and online transactions. Data are seasonally adjusted to "
            "account for regular seasonal patterns. Values are expressed in current dollars. "
            "For more information, consult Statistics Canada's retail trade portal."
        )
    else:
        return (
            "The Consumer Price Index (CPI) measures the rate of price change experienced by "
            "Canadian consumers. It is calculated by comparing the cost of a fixed basket of "
            "goods and services purchased by consumers over time. The CPI is not seasonally adjusted. "
            "For more information, consult Statistics Canada's Consumer Price Index portal."
        )


def generate_article(data_path: str, output_path: str) -> str:
    """Generate a complete article from data JSON."""
    # Load data
    with open(data_path, "r") as f:
        data = json.load(f)

    # Generate content
    headline = generate_headline(data)
    highlights = generate_highlights(data)
    sections = generate_sections(data)
    note = generate_note_to_readers(data)
    series_name = data["metadata"].get("series_name", "")

    # Chart title and y-axis based on series type
    if series_name == "Retail Sales":
        chart_title = f"Retail Sales, {format_month_year(data['time_series'][0]['ref_date'])} to {format_month_year(data['latest']['ref_date'])}"
        chart_y_label = "Sales ($ millions)"
    else:
        chart_title = f"Consumer Price Index, {format_month_year(data['time_series'][0]['ref_date'])} to {format_month_year(data['latest']['ref_date'])}"
        chart_y_label = "Index (2002=100)"

    # Load template
    template_path = Path(__file__).parent / "templates" / "article.html"
    with open(template_path, "r") as f:
        template = f.read()

    # Replace placeholders
    # Convert time series to JSON for embedding
    time_series_json = json.dumps(data["time_series"])

    # Simple template substitution
    html = template
    html = html.replace("{{headline}}", headline)
    html = html.replace("{{release_date}}", datetime.now().strftime("%B %d, %Y"))
    html = html.replace("{{chart_title}}", chart_title)
    html = html.replace("{{chart_y_label}}", chart_y_label)
    html = html.replace("{{note_to_readers}}", note)
    html = html.replace("{{table_number}}", data["metadata"]["table_number"])
    html = html.replace("{{reference_period}}", format_month_year(data["latest"]["ref_date"]))
    html = html.replace("{{time_series_json}}", time_series_json)

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

    print(f"Article generated: {output_path}")
    print(f"Headline: {headline}")
    print(f"Highlights: {len(highlights)}")
    print(f"Sections: {len(sections)}")

    return output_path


if __name__ == "__main__":
    import sys

    if len(sys.argv) < 2:
        print("Usage: python generate_article.py <data.json> [output.html]")
        print("Example: python generate_article.py output/data_18_10_0004.json output/article.html")
        sys.exit(1)

    data_path = sys.argv[1]
    output_path = sys.argv[2] if len(sys.argv) > 2 else "output/article.html"

    generate_article(data_path, output_path)
