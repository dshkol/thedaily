---
name: the-daily-generator
description: Generate Statistics Canada Daily-style articles from CANSIM tables. Use when asked to create a Daily article, analyze StatCan data, run the D-AI-LY pipeline, or generate a statistical bulletin.
---

# The D-AI-LY Article Generator

Generate StatCan "The Daily"-style statistical bulletins from CANSIM data tables.

## ⚠️ CRITICAL: Data Integrity

**NEVER use synthetic, made-up, or placeholder data.**

Every number in every article MUST come from real Statistics Canada data fetched via the `cansim` R package. A statistical bulletin with fake data is misinformation.

See [DATA-WORKFLOW.md](DATA-WORKFLOW.md) for the required data pipeline.

## Quick Start

To generate an article for a specific CANSIM table:

```bash
# 1. Fetch data
Rscript r-tools/fetch_cansim_enhanced.R <table-number> output

# 2. Generate article
python3 generate_article_enhanced.py output/data_<table>_enhanced.json output/articles/<slug>.html

# 3. Rebuild site
python3 build_site.py
```

**Example for CPI (table 18-10-0004):**
```bash
Rscript r-tools/fetch_cansim_enhanced.R 18-10-0004 output
python3 generate_article_enhanced.py output/data_18_10_0004_enhanced.json output/articles/cpi-november-2025.html
python3 build_site.py
```

## Workflow Steps

See [WORKFLOW.md](WORKFLOW.md) for detailed step-by-step instructions.

## Voice and Style

See [VOICE-GUIDE.md](VOICE-GUIDE.md) for The Daily voice rules.

**Key principles:**
- Neutral, clinical, non-partisan tone
- Inverted pyramid structure (most important first)
- Lead with the key number in headlines
- Always include year-over-year AND month-over-month comparisons
- No emotional language ("surged" → "increased")

## Supported Table Types

The pipeline auto-detects table structure:

| Type | Example Tables | Key Dimensions |
|------|----------------|----------------|
| **CPI** | 18-10-0004 | Products and product groups, GEO |
| **Retail** | 20-10-0067 | NAICS sectors, Sales type |
| **Labour** | 14-10-0287 | Labour force characteristics |
| **Generic** | Any | GEO filtering for Canada |

## Output Files

- `output/data_<table>_enhanced.json` - Processed data with metadata
- `output/articles/<slug>.html` - Generated article HTML
- `site/index.html` - Updated homepage
- `site/archive.html` - Updated archive

## Quality Checklist

Before publishing, verify:
- [ ] **DATA SOURCE**: JSON file exists with real fetched data
- [ ] **DATA MATCH**: All article values match JSON exactly
- [ ] Headline leads with key statistic from JSON
- [ ] YoY and MoM changes match JSON calculations
- [ ] Chart data points match JSON time_series
- [ ] Data tables match JSON subseries/provincial
- [ ] Charts render properly
- [ ] Source links work (StatCan table viewer)
- [ ] Voice is neutral and clinical

## Review Mode

If the user requests "review mode", pause after generating the article and ask for approval before rebuilding the site or publishing.
