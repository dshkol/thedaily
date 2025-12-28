# Sector Categories and Regional Stories

Reference material for topic discovery scoring.

## Sector Categories

For diversity scoring, tables are categorized:

| Sector | Example Tables | Notes |
|--------|----------------|-------|
| **Prices** | 18-10-0004 (CPI), 18-10-0001 (Gas), 18-10-0205 (NHPI) | High public interest |
| **Labour** | 14-10-0287 (LFS), 14-10-0355 (SEPH) | Core economic indicator |
| **Trade** | 20-10-0056 (Retail), 20-10-0003 (Wholesale), 12-10-0011 (Intl) | Supply chain coverage |
| **Housing** | 34-10-0158 (Starts), 34-10-0292 (Permits) | Housing market health |
| **Production** | 36-10-0434 (GDP), 16-10-0048 (Manufacturing) | Output indicators |
| **Transport** | 23-10-0079 (Aviation), 23-10-0253 (Rail) | Mobility/logistics |
| **Finance** | 10-10-0006 (Credit), 36-10-0580 (Investment) | Financial conditions |
| **Demographics** | 17-10-0009 (Population), 17-10-0014 (Migration) | Social indicators |
| **Energy** | 25-10-0015 (Electricity), 25-10-0063 (Oil & Gas) | Resource production |

## Narrative Potential Indicators

High-scoring narratives typically have:

- **Trend reversals**: "First increase since...", "Ended X-month streak"
- **Regional divergence**: Provinces moving in opposite directions
- **Component splits**: House vs. land, goods vs. services, domestic vs. international
- **Milestone crossings**: Index hits new high/low, crosses round number
- **Seasonal anomalies**: Unexpected pattern vs. typical seasonality

## Geographic Levels in CANSIM

| Level | Description | Story Potential |
|-------|-------------|-----------------|
| **Canada** | National totals | Headline indicators |
| **Provincial/Territorial** | 13 jurisdictions | Regional divergence, provincial spotlight |
| **CMA** | Census Metropolitan Areas | City comparisons, metro-specific trends |
| **Economic Region** | Sub-provincial regions | Local economic conditions |

## Regional Story Types

### 1. Divergence Stories
When regions move in opposite directions:
```r
provincial_data %>%
  group_by(REF_DATE) %>%
  summarise(
    range = max(yoy_change) - min(yoy_change),
    leader = GEO[which.max(yoy_change)],
    laggard = GEO[which.min(yoy_change)]
  ) %>%
  filter(range > 5)  # >5 percentage points spread
```

### 2. Metro Spotlight
Deep-dive on a specific CMA:
- Toronto housing market dynamics
- Vancouver cost of living
- Calgary energy sector employment
- Montreal manufacturing

### 3. Provincial Rankings
League tables comparing provinces:
- Unemployment rates by province
- Housing affordability index
- Retail sales per capita

### 4. Regional Outliers
One region bucking the national trend:
- "Saskatchewan leads provincial gains..."
- "Atlantic Canada bucks national decline..."

## Regional Story Scoring

| Factor | Score Boost | Condition |
|--------|-------------|-----------|
| High provincial variance | +15 | Range > 5 pp |
| Clear leader/laggard | +10 | One province dominates |
| CMA data available | +5 | Metro-level granularity |
| Regional trend reversal | +20 | Province bucks national trend |

## Checking Geographic Coverage

```r
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

## Example Regional Headlines

- "Toronto housing starts surge while Vancouver stalls"
- "Prairie provinces lead employment gains in November"
- "Quebec inflation outpaces national average for 6th month"
- "Atlantic Canada gasoline prices hit 18-month low"
