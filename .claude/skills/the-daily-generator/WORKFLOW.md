# The D-AI-LY Workflow

Detailed steps for generating statistical bulletins.

## CRITICAL: Data Integrity Requirement

**Every article MUST use real data from Statistics Canada.** Synthetic, placeholder, or made-up data is strictly prohibited.

Before generating any article:
1. Fetch data using `Rscript r-tools/fetch_cansim_enhanced.R <table-number> output`
2. Verify the JSON output contains real values
3. Use ONLY the fetched values in the article - no approximations or placeholders
4. If data fetch fails, do not generate the article

## Complete Workflow (Observable Framework)

```
1. DATA ACQUISITION
   └─ Rscript r-tools/fetch_cansim_enhanced.R <table-number> output
   └─ Output: output/data_<table>_enhanced.json
   └─ Includes: metadata, time series, subseries, provincial breakdowns

2. ARTICLE GENERATION (Markdown)
   └─ Create docs/en/<slug>/index.md (English article)
   └─ Create docs/fr/<slug-fr>/index.md (French article)
   └─ Uses Observable Plot for charts, markdown tables for data

3. UPDATE LANGUAGE MAPPING
   └─ Add EN/FR slug pair to src/lang-map.js
   └─ Format: 'en-slug': 'fr-slug'
   └─ This enables the language switcher in the header

4. UPDATE INDEX PAGES
   └─ Add article entry to docs/en/index.md
   └─ Add article entry to docs/fr/index.md
   └─ Include: title, date, table number, summary

5. QUALITY REVIEW
   └─ Run `npm run dev` to preview
   └─ Check: headline accuracy, data values, chart rendering
   └─ Verify language switcher works between EN/FR

6. PUBLISH (if requested)
   └─ git add docs/ src/
   └─ git commit -m "Add: <headline>"
   └─ git push
```

## Step 1: Data Acquisition

**Command:**
```bash
Rscript r-tools/fetch_cansim_enhanced.R <table-number> output
```

**What it does:**
- Downloads full CANSIM table from Statistics Canada
- Extracts metadata (table title, release date, survey code)
- Filters for relevant dimensions (Canada-level, key components)
- Calculates month-over-month and year-over-year changes
- Extracts subseries (e.g., CPI components) and provincial breakdowns
- Builds StatCan URLs for linking

**Output JSON structure:**
```json
{
  "metadata": { "table_number", "table_title", "series_name", ... },
  "urls": { "table_viewer", "csv_download" },
  "latest": { "value", "mom_pct_change", "yoy_pct_change" },
  "comparison": { "previous_period", "year_ago" },
  "time_series": [...],
  "subseries": { "category", "value", "yoy_pct_change" },
  "provincial": { "category", "value", "yoy_pct_change" }
}
```

## Step 2: Article Generation

**Command:**
```bash
python3 generate_article_enhanced.py <data.json> <output.html>
```

**Naming convention for slugs:**
- CPI: `cpi-<month>-<year>.html` (e.g., `cpi-november-2025.html`)
- Retail: `retail-<month>-<year>.html`
- Labour: `employment-<month>-<year>.html`
- Generic: `<short-title>-<month>-<year>.html`

**What it generates:**
1. **Headline** - Max 15 words, leads with key statistic
2. **Highlights** - 3-5 bullet points with key findings
3. **Narrative sections** - Lede, analysis, comparisons
4. **Main chart** - Time series line chart (last 24 months)
5. **Data tables** - Component and provincial breakdowns
6. **Bar chart** - YoY changes by component
7. **Source section** - StatCan links, release date, table number

## Step 3: Quality Review

**Open in browser:**
```bash
open output/articles/<slug>.html
# or use browser automation to display
```

**Checklist:**
- [ ] Headline is accurate and leads with key number
- [ ] Highlights capture the most newsworthy points
- [ ] YoY and MoM percentages match the data
- [ ] Charts render correctly
- [ ] Data tables are sorted and formatted properly
- [ ] Source links point to correct StatCan pages
- [ ] Voice is neutral (no "surged", "plummeted", etc.)

**If issues found:**
- Edit `generate_article_enhanced.py` for systematic fixes
- Or manually adjust the HTML for one-off corrections
- Regenerate if needed

## Step 4: Site Build

**Command:**
```bash
python3 build_site.py
```

**What it does:**
- Scans `output/articles/` for all HTML files
- Extracts metadata (title, date, table number) from each
- Generates `site/index.html` with latest 5 articles
- Generates `site/archive.html` with all articles by month
- Copies articles to `site/articles/`
- Saves `site/articles.json` with full metadata

## Step 5: Publish

**Commands:**
```bash
git add output/ site/
git commit -m "Add: <headline from article>"
git push
```

**Commit message format:**
```
Add: Consumer prices up 2.2% year over year in November 2025

- Source: CANSIM Table 18-10-0004
- Reference period: November 2025
```

## Common Issues

**R script fails to download:**
- Check internet connection
- Verify table number format (XX-XX-XXXX)
- Table may be deprecated; check StatCan for replacement

**Missing subseries data:**
- Table may not have component breakdowns
- Check `breakdown_dimension` in JSON output

**Charts not rendering:**
- Ensure browser has JavaScript enabled
- Check console for errors
- Verify `time_series` array has data points

**Wrong date extracted:**
- Check filename matches expected pattern
- Verify `REF_DATE` in JSON output
