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

## Step 2: Article Generation (Observable Framework)

Create markdown files directly in the Observable Framework structure:

**English article:** `docs/en/<slug>/index.md`
**French article:** `docs/fr/<slug-fr>/index.md`

**Naming convention for slugs:**

| Type | English Slug | French Slug |
|------|-------------|-------------|
| CPI | `cpi-november-2025` | `ipc-novembre-2025` |
| Retail | `retail-trade-october-2025` | `commerce-detail-octobre-2025` |
| Labour | `lfs-november-2025` | `epa-novembre-2025` |
| GDP | `gdp-october-2025` | `pib-octobre-2025` |
| Generic | `<indicator>-<month>-<year>` | `<indicateur>-<mois>-<année>` |

**Article template structure:**

```markdown
---
title: Consumer prices up 2.2% year over year in November 2025
toc: false
---

# Consumer prices up 2.2% year over year in November 2025

<p class="release-date">Released: December 22, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Key finding 1 with specific number
- Key finding 2 with comparison
- Regional highlight
- Secondary finding

</div>

[Body paragraphs with analysis]

\`\`\`js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table XX-XX-XXXX
const data = [...];

display(Plot.plot({...}));
\`\`\`

[More sections, charts, tables]

<div class="note-to-readers">

## Note to readers

[Methodology explanation]

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table XX-XX-XXXX](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=XXXXXXXXXX)
**Survey:** Survey Name
**Reference period:** Month Year
**DOI:** [https://doi.org/10.25318/XXXXXXXXXX-eng](https://doi.org/10.25318/XXXXXXXXXX-eng)

</div>
```

See [CHART-STYLE-GUIDE.md](/CHART-STYLE-GUIDE) for chart conventions.

## Step 3: Update Language Mapping

**Critical step!** The language switcher won't work without this.

**File:** `src/lang-map.js`

Add the EN/FR slug pair:

```js
export const slugMap = {
  // ... existing mappings
  'new-article-slug': 'nouvel-article-slug',
};
```

**Example mappings:**
```js
'cpi-november-2025': 'ipc-novembre-2025',
'lfs-november-2025': 'epa-novembre-2025',
'gdp-october-2025': 'pib-octobre-2025',
```

## Step 4: Update Index Pages

Add the new article to both feed pages:

**English:** `docs/en/index.md`
**French:** `docs/fr/index.md`

Entry format:
```markdown
### [Consumer prices up 2.2% year over year in November 2025](./cpi-november-2025/)

Released: 2025-12-22 · Table 18-10-0004

The Consumer Price Index rose 2.2% year over year in November 2025...
```

## Step 5: Quality Review

**Preview locally:**
```bash
npm run dev
# Opens at http://localhost:3000
```

**Checklist:**
- [ ] Headline leads with key statistic
- [ ] Highlights capture most newsworthy points
- [ ] YoY and MoM percentages match JSON data
- [ ] Charts render with correct colors (#AF3C43)
- [ ] Data tables are sorted and formatted properly
- [ ] Source links point to correct StatCan pages
- [ ] Language switcher toggles between EN/FR versions
- [ ] Voice is neutral (no "surged", "plummeted", etc.)
- [ ] French uses comma decimals (2,2 % not 2.2%)

## Step 6: Build and Deploy

**Build the site:**
```bash
npm run build
```

This runs Observable Framework build plus the Safari path fix script.

**Commit and push:**
```bash
git add docs/ src/
git commit -m "Add: <headline from article>"
git push
```

GitHub Actions will auto-deploy to Netlify.

**Commit message format:**
```
Add: Consumer prices up 2.2% year over year in November 2025

- Source: CANSIM Table 18-10-0004
- Reference period: November 2025
```

## Dataset Discovery with cansim Package

The `cansim` R package provides powerful functions for discovering and exploring StatCan data tables.

### Finding Tables by Keyword

```r
library(cansim)

# Search for tables by keyword
search_cansim_cubes("housing price")
search_cansim_cubes("consumer price index")
search_cansim_cubes("employment")
```

### Listing All Available Cubes

```r
# Get all 8000+ available cubes with metadata
all_cubes <- list_cansim_cubes()

# Filter for recent monthly data
recent_monthly <- all_cubes %>%
  filter(frequencyCode == "6") %>%           # 6 = Monthly
  filter(cubeEndDate >= "2025-10-01") %>%    # Data through Oct 2025+
  arrange(desc(cubeEndDate))
```

### Frequency Codes

| Code | Frequency |
|------|-----------|
| 6 | Monthly |
| 9 | Quarterly |
| 12 | Annual |

### Table Discovery Workflow

1. **Search by topic** using `search_cansim_cubes("keyword")`
2. **Filter results** by frequencyCode (monthly = 6) and cubeEndDate (recent data)
3. **Fetch sample data** with `get_cansim("XX-XX-XXXX")` to verify structure
4. **Check column names** - varies by table (e.g., "Products and product groups" vs "Operating statistic")
5. **Verify data coverage** - some tables deprecated, check cubeEndDate

### Common Pitfalls

- **Deprecated tables**: Table 18-10-0052 (NHPI) only has data to 2016. Current table is 18-10-0205.
- **Column name variations**: Always check `names(df)` after fetching
- **Regional vs National**: Some tables only have CMA-level data (e.g., manufacturing)

### Cross-Validation

Always verify fetched data against:
1. StatCan table viewer (web interface)
2. Recent StatCan Daily releases (via web search)
3. Third-party sources when available (CMHC, industry reports)

## Troubleshooting

### R Script Issues

**R script fails to download:**
- Check internet connection
- Verify table number format (XX-XX-XXXX)
- Table may be deprecated; check StatCan for replacement
- Try `--refresh` flag to force re-download: `Rscript r-tools/fetch_cansim_enhanced.R 18-10-0004 output --refresh`

**"Error: object 'X' not found":**
- Column name may differ from expected
- Run `names(df)` in R to see actual column names
- Table structure may have changed; update detection logic

**Missing subseries data:**
- Table may not have component breakdowns
- Check `breakdown_dimension` in JSON output
- Some tables only have Canada-level aggregates

### Observable Framework Issues

**Charts not rendering:**
- Check browser console for JavaScript errors
- Verify import statement is at top of first code block only
- Ensure data array has values (not empty)
- Check for syntax errors in Plot.plot() call

**CSS not loading (Safari):**
- Run `npm run build` - the post-build script fixes paths
- Clear browser cache
- Check that paths start with `/thedaily/` not `./`

**Language switcher broken:**
- Verify slug is added to `src/lang-map.js`
- Check slug spelling matches folder name exactly
- Rebuild with `npm run build`

**"Module not found" error:**
- Run `npm install` to ensure dependencies installed
- Check import path is `"npm:@observablehq/plot"` not a file path

### Article Content Issues

**Wrong date extracted:**
- Check REF_DATE in JSON output
- Verify date format is YYYY-MM
- Some tables have different date granularity

**Numbers don't match StatCan website:**
- Check if data is seasonally adjusted vs not
- Verify you're comparing same reference period
- Some tables have revisions; refetch with `--refresh`

**French decimals showing period instead of comma:**
- Use `.replace(".", ",")` on formatted numbers
- Check CHART-STYLE-GUIDE.md for French formatting

### Build/Deploy Issues

**Build fails:**
- Run `npm run clean` then `npm run build`
- Check for syntax errors in markdown files
- Verify all Observable code blocks are valid JS

**Changes not appearing on live site:**
- Wait 1-2 minutes for Netlify deploy
- Check GitHub Actions for deploy status
- Hard refresh browser (Cmd+Shift+R)

**Tests failing:**
- Run `npm test` to see specific failures
- Check that fix-paths.js hasn't been modified incorrectly
