# The D-AI-LY - Project Context

An LLM-driven version of Statistics Canada's "The Daily" generating automated statistical bulletins from CANSIM data.

## CRITICAL: Data Integrity

**NEVER use synthetic, placeholder, or made-up data.** Every number in an article MUST come directly from Statistics Canada tables via the `cansim` R package.

- All data values must be fetched from real CANSIM tables
- All charts must use real time series data
- All percentages must be calculated from real values
- If data cannot be fetched, do not generate the article

This is non-negotiable. A statistical bulletin with fake data is misinformation.

## Architecture

**Observable Framework site** at `docs/`:
- `docs/en/{slug}/index.md` - English articles
- `docs/fr/{slug}/index.md` - French articles
- `docs/style.css` - Site styling (StatCan red: #AF3C43)
- `observablehq.config.js` - Framework config (sidebar/TOC disabled)

**Data pipeline:**
- `r-tools/fetch_cansim_enhanced.R` - Fetch data via cansim R package
- `generate_article_enhanced.py` - Generate HTML articles (legacy)
- `generate_article_observable.py` - Generate Observable markdown articles

**Language switching:**
- `src/lang-map.js` - Maps EN slugs to FR slugs for the language switcher
- When creating a new article pair, add the slug mapping here:
  ```js
  'en-slug': 'fr-slug'
  ```

## Commands

```bash
# Start dev server
npm run dev  # Port 3000

# Fetch data for a table
Rscript r-tools/fetch_cansim_enhanced.R <table-number> output

# Example: CPI data
Rscript r-tools/fetch_cansim_enhanced.R 18-10-0004 output
```

## Article Template Pattern

Each Observable markdown article needs:

1. **Frontmatter:**
   ```yaml
   ---
   title: Consumer prices up 2.2% year over year in November 2025
   toc: false
   ---
   ```

2. **Structure:**
   - `<p class="release-date">Released: December 22, 2025</p>` (EN) or `Diffusion : 22 décembre 2025` (FR)
   - `<div class="highlights">` with bullet points
   - Body paragraphs explaining the data
   - Observable Plot charts (single `import * as Plot` at top of first code block)
   - Data table (markdown table)
   - `<div class="note-to-readers">` section
   - `<div class="source-info">` section

3. **Charts:** Use Observable Plot with StatCan red (#AF3C43)
   ```js
   import * as Plot from "npm:@observablehq/plot";

   display(Plot.plot({
     title: "Chart title",
     marks: [
       Plot.lineY(data, {x: "date", y: "value", stroke: "#AF3C43"})
     ]
   }));
   ```

## Source References

Each article ends with a `<div class="source-info">` section containing linked references.

**URL patterns:**
- EN table viewer: `https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=XXXXXXXXXX`
- FR table viewer: `https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=XXXXXXXXXX`
- DOI: `https://doi.org/10.25318/XXXXXXXXXX-eng` (or `-fra` for French)

**PID construction:** Remove dashes from table number and add "01" suffix
- Example: Table 18-10-0004 → PID 1810000401

**English format:**
```markdown
<div class="source-info">

**Source:** Statistics Canada, [Table XX-XX-XXXX](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=XXXXXXXXXX)
**Survey:** Survey Name
**Reference period:** Month Year
**DOI:** [https://doi.org/10.25318/XXXXXXXXXX-eng](https://doi.org/10.25318/XXXXXXXXXX-eng)

</div>
```

**French format:**
```markdown
<div class="source-info">

**Source :** Statistique Canada, [Tableau XX-XX-XXXX](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=XXXXXXXXXX)
**Enquête :** Nom de l'enquête
**Période de référence :** Mois Année
**DOI :** [https://doi.org/10.25318/XXXXXXXXXX-fra](https://doi.org/10.25318/XXXXXXXXXX-fra)

</div>
```

## French Translation Notes

- Decimal separator: comma (2,2 % not 2.2%)
- Date format: "22 décembre 2025"
- Release label: "Diffusion :" not "Released:"
- Province names: Québec, Nouveau-Brunswick, Nouvelle-Écosse, Terre-Neuve-et-Labrador, Colombie-Britannique, Île-du-Prince-Édouard
- CPI components have official French translations (Aliments, Logement, Transports, etc.)

## Common StatCan Tables

| Table | Topic | Frequency | Notes |
|-------|-------|-----------|-------|
| 18-10-0004 | Consumer Price Index (CPI) | Monthly | |
| 14-10-0287 | Labour Force Survey | Monthly | |
| 20-10-0056 | Retail Trade | Monthly | Replaced 20-10-0008 |
| 36-10-0434 | GDP by Industry | Monthly | Filter: GEO=Canada, Seasonally adjusted |
| 12-10-0011 | International Merchandise Trade | Monthly | ~2 month lag |
| 34-10-0292 | Building Permits | Monthly | Replaced 34-10-0066 |

**Note:** Table numbers change over time. Use `search_cansim_cubes("keyword")` to find current tables.

## The Daily Voice

- **Neutral and clinical** - no emotional language
- **Inverted pyramid** - most important facts first
- **Plain language** - accessible to general audiences
- Headlines lead with the key number
- Always compare to previous period AND year-over-year
- Avoid: "surged", "plummeted", "skyrocketed" → Use: "increased", "decreased", "rose", "fell"

## Data Fetching with cansim

**IMPORTANT:** Always use the `cansim` R package for fetching Statistics Canada data. The package author is the project maintainer, and it provides the most reliable and feature-complete interface to CANSIM/NDM data. Do not use direct API calls or other methods.

### Caching (Recommended)

Set up persistent caching to avoid repeated downloads:

```r
library(cansim)

# Set cache path once (persists across sessions)
set_cansim_cache_path("~/Projects/the-daily/cache", install = TRUE)

# Check what's cached
list_cansim_cached_tables()

# Clear specific cached table if needed
remove_cansim_cached_tables("18-10-0004")
```

### Efficient Data Access

```r
# CONNECTION-BASED (best for large tables - uses parquet, lazy evaluation)
conn <- get_cansim_connection("36-10-0434", refresh = "auto")
gdp_data <- conn |>
  filter(GEO == "Canada") |>
  collect_and_normalize()

# DIRECT FETCH (simpler for small tables)
df <- get_cansim("18-10-0004")

# VECTOR-BASED (fastest for specific series)
# Get just the last 36 periods for specific vectors
cpi_recent <- get_cansim_vector_for_latest_periods(
  c("v41690973"),
  periods = 36
)
```

### Table Discovery

```r
# Search for tables by keyword
search_cansim_cubes("retail trade")
search_cansim_cubes("building permits")

# Get table metadata before fetching
info <- get_cansim_table_info("18-10-0004")
info$`Cube Title`
info$Frequency

# Check table dimensions and members
get_cansim_table_notes("18-10-0004")
```

### Refresh Modes

- `refresh = FALSE` - Use cache, warn if outdated
- `refresh = TRUE` - Force re-download from StatCan
- `refresh = "auto"` - Only refresh if StatCan has newer data (recommended)

Package docs: https://mountainmath.github.io/cansim/

## Skills

- `the-daily-generator` - Generate articles from CANSIM tables
- `the-daily-publish` - Build and publish the site
