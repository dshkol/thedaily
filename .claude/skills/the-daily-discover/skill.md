---
name: the-daily-discover
description: Discover and rank StatCan CANSIM tables for Daily article generation. Use when asked to find new topics, scan for recent releases, identify coverage gaps, or prioritize which tables to cover.
---

# The D-AI-LY Topic Discovery

Discover and prioritize StatCan CANSIM tables for Daily article generation.

## Quick Start

```bash
# Run discovery scan for recent monthly tables
Rscript r-tools/discover_topics.R

# Output: ranked list of candidate topics with scores
```

## When to Use This Skill

- Finding new article topics beyond the standard rotation
- Identifying timely releases with strong narrative potential
- Ensuring diverse sector coverage across the site
- Prioritizing which tables to cover when multiple releases drop

## Discovery Workflow

### Step 1: Scan Available Data

```r
library(cansim)
library(dplyr)

# Get all cubes with metadata
cubes <- list_cansim_cubes()

# Filter for recent monthly releases
candidates <- cubes %>%
  filter(frequencyCode == "6") %>%
  filter(cubeEndDate >= Sys.Date() - 60) %>%
  arrange(desc(cubeEndDate))
```

### Step 2: Score Candidates

Each candidate table is scored on multiple dimensions:

| Dimension | Weight | Scoring Criteria |
|-----------|--------|------------------|
| **Recency** | 25% | Days since data release (fresher = higher) |
| **Diversity** | 25% | Sector coverage gap from existing articles |
| **Narrative** | 25% | Regional variation, component breakdowns, trend reversals |
| **Public Interest** | 15% | Topic relevance to general audiences |
| **Data Quality** | 10% | Complete coverage, verified table, national totals available |

### Step 3: Validate Top Candidates

Before committing to a topic:

1. **Fetch sample data** to verify structure and coverage
2. **Check for StatCan Daily release** to confirm official narrative
3. **Verify national totals exist** (not just CMA/regional data)
4. **Confirm table is current** (not deprecated)

## Sector Categories

For diversity scoring, tables are categorized:

| Sector | Example Tables | Notes |
|--------|----------------|-------|
| **Prices** | 18-10-0004 (CPI), 18-10-0001 (Gas), 18-10-0205 (NHPI) | High public interest |
| **Labour** | 14-10-0287 (LFS), 14-10-0355 (SEPH) | Core economic indicator |
| **Trade** | 20-10-0008 (Retail), 20-10-0003 (Wholesale), 12-10-0011 (Intl) | Supply chain coverage |
| **Housing** | 34-10-0158 (Starts), 34-10-0066 (Permits) | Housing market health |
| **Production** | 36-10-0434 (GDP), 16-10-0048 (Manufacturing) | Output indicators |
| **Transport** | 23-10-0079 (Aviation), 23-10-0253 (Rail) | Mobility/logistics |
| **Finance** | 10-10-0006 (Credit), 36-10-0580 (Investment) | Financial conditions |
| **Demographics** | 17-10-0009 (Population), 17-10-0014 (Migration) | Social indicators |

## Narrative Potential Indicators

High-scoring narratives typically have:

- **Trend reversals**: "First increase since...", "Ended X-month streak"
- **Regional divergence**: Provinces moving in opposite directions
- **Component splits**: House vs. land, goods vs. services, domestic vs. international
- **Milestone crossings**: Index hits new high/low, crosses round number
- **Seasonal anomalies**: Unexpected pattern vs. typical seasonality

## Existing Coverage Check

Before selecting a topic, verify it doesn't overlap with recent articles:

```bash
# List existing articles
ls docs/en/*/index.md | head -20
```

Map tables to avoid redundancy:
- If CPI (18-10-0004) was just published, deprioritize other price indices
- If Retail Trade covered, Wholesale Trade adds value (upstream perspective)
- Housing Starts and Building Permits complement each other (units vs. dollars)

## Output Format

The discovery process outputs a ranked list:

```
TOPIC DISCOVERY RESULTS - 2025-12-24
=====================================

RANK  SCORE  TABLE        SECTOR      TITLE
----  -----  -----------  ----------  ----------------------------------
1     87     23-10-0079   Transport   Airline operating statistics
2     82     18-10-0205   Prices      New Housing Price Index
3     78     20-10-0003   Trade       Wholesale trade
4     71     34-10-0158   Housing     Housing starts
5     68     18-10-0001   Prices      Gasoline prices

Top recommendation: 23-10-0079 (Airline operating statistics)
- Last release: 2025-12-23
- Narrative hook: Transborder traffic down 9th consecutive month
- Sector gap: No transport coverage in last 30 days
```

## Regional Story Discovery

Beyond national aggregates, sub-national data offers rich story potential:

### Geographic Levels in CANSIM

| Level | Description | Story Potential |
|-------|-------------|-----------------|
| **Canada** | National totals | Headline indicators |
| **Provincial/Territorial** | 13 jurisdictions | Regional divergence, provincial spotlight |
| **CMA** | Census Metropolitan Areas | City comparisons, metro-specific trends |
| **Economic Region** | Sub-provincial regions | Local economic conditions |

### Regional Story Types

**1. Divergence Stories**
When regions move in opposite directions:
```r
# Find tables with high provincial variance
provincial_data %>%
  group_by(REF_DATE) %>%
  summarise(
    range = max(yoy_change) - min(yoy_change),
    leader = GEO[which.max(yoy_change)],
    laggard = GEO[which.min(yoy_change)]
  ) %>%
  filter(range > 5)  # >5 percentage points spread
```

**2. Metro Spotlight**
Deep-dive on a specific CMA:
- Toronto housing market dynamics
- Vancouver cost of living
- Calgary energy sector employment
- Montreal manufacturing

**3. Provincial Rankings**
League tables comparing provinces:
- Unemployment rates by province
- Housing affordability index
- Retail sales per capita

**4. Regional Outliers**
One region bucking the national trend:
- "Saskatchewan leads provincial gains..."
- "Atlantic Canada bucks national decline..."

### Identifying Regional Stories

```r
# Check if table has sub-national data
check_geo_coverage <- function(table_number) {
  df <- get_cansim(table_number)
  geos <- unique(df$GEO)

  list(
    has_provinces = any(geos %in% c("Ontario", "Quebec", "British Columbia")),
    has_cmas = any(grepl("CMA|Toronto|Vancouver|Montreal", geos)),
    geo_count = length(geos),
    geo_list = head(geos, 10)
  )
}
```

### Regional Story Scoring

Add to candidate scoring:

| Factor | Score Boost | Condition |
|--------|-------------|-----------|
| High provincial variance | +15 | Range > 5 pp |
| Clear leader/laggard | +10 | One province dominates |
| CMA data available | +5 | Metro-level granularity |
| Regional trend reversal | +20 | Province bucks national trend |

### Example Regional Articles

- "Toronto housing starts surge while Vancouver stalls"
- "Prairie provinces lead employment gains in November"
- "Quebec inflation outpaces national average for 6th month"
- "Atlantic Canada gasoline prices hit 18-month low"

## Integration with Generator

After discovery, hand off to the generator skill:

```
/the-daily-generator 23-10-0079 --slug airline-passengers-october-2025
```

For regional stories, specify the geographic focus:

```
/the-daily-generator 34-10-0158 --slug ontario-housing-starts-november-2025 --geo Ontario
```
