# Content Generation Strategy

Two approaches for generating new D-AI-LY articles.

## Approach 1: Release-Driven (like real Daily)

Follow Statistics Canada's release calendar to generate articles when data is updated.

### Discovery Command
```bash
Rscript r-tools/discover_stories.R schedule output
```

This outputs `output/discovery_schedule.json` with upcoming releases and their table numbers.

### Key Release Schedule Tables

| Release Title | Table Number | Frequency |
|--------------|--------------|-----------|
| Consumer Price Index | 18-10-0004 | Monthly |
| Labour Force Survey | 14-10-0287 | Monthly |
| Retail trade | 20-10-0008 | Monthly |
| Gross domestic product by industry | 36-10-0434 | Monthly |
| Canadian international merchandise trade | 12-10-0011 | Monthly |
| Building permits | 34-10-0066 | Monthly |
| Monthly Survey of Manufacturing | 16-10-0048 | Monthly |
| Wholesale trade | 20-10-0074 | Monthly |
| Investment in building construction | 34-10-0175 | Monthly |
| Housing starts | 34-10-0143 | Monthly |
| Job vacancies | 14-10-0325 | Quarterly |

### Check Recently Updated Tables
```bash
Rscript r-tools/discover_stories.R changed output
```

This outputs `output/discovery_changed.json` with tables updated in the last day.

## Approach 2: Story-Driven

Find interesting patterns in data that warrant coverage.

### Story Types

1. **Extreme Values**
   - Record highs/lows
   - Largest monthly changes
   - Biggest year-over-year shifts

2. **Regional Divergence**
   - Provinces moving in opposite directions
   - Urban vs. rural patterns
   - Regional outliers

3. **Sector Breakdowns**
   - Which industries leading/lagging
   - Component analysis (CPI basket items)
   - Employment by sector

4. **Multi-Indicator Stories**
   - CPI vs. wage growth (real wages)
   - Employment vs. job vacancies (labour market tightness)
   - Housing starts vs. building permits (construction pipeline)
   - Trade balance trends

### Table Search
```r
library(cansim)
search_cansim_cubes("housing starts")
search_cansim_cubes("job vacancies")
search_cansim_cubes("average hourly earnings")
```

## Workflow for New Content

### Option A: Follow the Calendar
1. Run `Rscript r-tools/discover_stories.R schedule output`
2. Identify tables with upcoming releases
3. When release date arrives, fetch fresh data and generate article

### Option B: React to Updates
1. Run `Rscript r-tools/discover_stories.R changed output`
2. Identify which key tables were just updated
3. Generate articles for those tables

### Option C: Find Stories
1. Identify an interesting angle (e.g., "housing affordability")
2. Search for relevant tables: `search_cansim_cubes("housing")`
3. Fetch data and look for newsworthy patterns
4. Generate article highlighting the story

## Table Number to PID Mapping

For StatCan URLs, convert table number to PID:
- Remove dashes from table number
- Add "01" suffix

Example: `18-10-0004` → `1810000401`

URLs:
- Table viewer: `https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810000401`
- DOI: `https://doi.org/10.25318/1810000401-eng`
