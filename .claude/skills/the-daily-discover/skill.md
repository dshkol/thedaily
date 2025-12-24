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

## Integration with Generator

After discovery, hand off to the generator skill:

```
/the-daily-generator 23-10-0079 --slug airline-passengers-october-2025
```
