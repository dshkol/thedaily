# Common StatCan Tables

Quick reference for frequently used CANSIM tables.

## Core Monthly Indicators

| Table | Topic | Notes |
|-------|-------|-------|
| 18-10-0004 | Consumer Price Index (CPI) | Primary inflation measure |
| 14-10-0287 | Labour Force Survey | Employment, unemployment |
| 20-10-0056 | Retail Trade | Replaced 20-10-0008 |
| 36-10-0434 | GDP by Industry | Filter: GEO=Canada, Seasonally adjusted |
| 12-10-0011 | International Merchandise Trade | ~2 month lag |
| 34-10-0292 | Building Permits | Replaced 34-10-0066 |

## Housing & Construction

| Table | Topic | Notes |
|-------|-------|-------|
| 34-10-0158 | Housing Starts | CMHC data |
| 18-10-0205 | New Housing Price Index | Current NHPI table |
| 34-10-0175 | Investment in Building Construction | |

## Prices & Inflation

| Table | Topic | Notes |
|-------|-------|-------|
| 18-10-0265 | Industrial Product Price Index (IPPI) | Current active table (replaced 18-10-0029) |
| 18-10-0001 | Gasoline Prices | By city |

## Energy & Resources

| Table | Topic | Notes |
|-------|-------|-------|
| 25-10-0015 | Electric Power Generation | By source type |

## Trade & Manufacturing

| Table | Topic | Notes |
|-------|-------|-------|
| 20-10-0074 | Wholesale Trade | |
| 16-10-0048 | Monthly Survey of Manufacturing | |

## Table Number Changes

Tables are periodically replaced. Always verify with:

```r
search_cansim_cubes("keyword")
```

Known replacements:
- 20-10-0008 → 20-10-0056 (Retail Trade)
- 34-10-0066 → 34-10-0292 (Building Permits)
- 18-10-0052 → 18-10-0205 (NHPI)
- 18-10-0029 → 18-10-0265 (IPPI)

**CRITICAL:** When given a table number, always verify it's active:
```r
cubes <- search_cansim_cubes("topic keyword")
cubes_sorted <- cubes[order(-as.numeric(cubes$cubeEndDate)), ]
# Use the table with most recent cubeEndDate
```

## URL Construction

**PID format:** Remove dashes, add "01" suffix
- Table 18-10-0004 → PID 1810000401

**URLs:**
- EN viewer: `https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810000401`
- FR viewer: `https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810000401`
- DOI: `https://doi.org/10.25318/1810000401-eng`

## Table Discovery

```r
library(cansim)

# Search by keyword
search_cansim_cubes("housing starts")

# Get table metadata
info <- get_cansim_table_info("18-10-0004")
info$`Cube Title`
info$Frequency

# List all cubes
all_cubes <- list_cansim_cubes()

# Filter for recent monthly
recent <- all_cubes %>%
  filter(frequencyCode == "6") %>%
  filter(cubeEndDate >= Sys.Date() - 60)
```

## Frequency Codes

| Code | Frequency |
|------|-----------|
| 6 | Monthly |
| 9 | Quarterly |
| 12 | Annual |
