---
name: the-daily-discover
description: Discover and rank StatCan CANSIM tables for Daily article generation. Use when asked to find new topics, scan for recent releases, identify coverage gaps, prioritize which tables to cover, or explore what data is available.
---

# The D-AI-LY Topic Discovery

Discover and prioritize StatCan CANSIM tables for article generation.

## Quick Start

```bash
# Run discovery scan
Rscript r-tools/discover_topics.R

# Check recently updated tables
Rscript r-tools/discover_stories.R
```

## Discovery Workflow

### 1. Scan Available Data

```r
library(cansim)
library(dplyr)

cubes <- list_cansim_cubes()

# Filter for recent monthly releases
candidates <- cubes %>%
  filter(frequencyCode == "6") %>%
  filter(cubeEndDate >= Sys.Date() - 60) %>%
  arrange(desc(cubeEndDate))
```

### 2. Score Candidates

| Dimension | Weight | Criteria |
|-----------|--------|----------|
| Recency | 25% | Days since release (fresher = higher) |
| Diversity | 25% | Sector gap from existing articles |
| Narrative | 25% | Regional variation, trend reversals |
| Public Interest | 15% | Topic relevance to general audiences |
| Data Quality | 10% | Complete coverage, national totals |

### 3. Validate Top Candidates

Before committing:
1. Fetch sample data to verify structure
2. Check for StatCan Daily release
3. Verify national totals exist
4. Confirm table is current (not deprecated)

## Check Existing Coverage

```bash
ls docs/en/*/index.md | head -20
```

Avoid redundancy:
- If CPI just published, deprioritize other price indices
- Retail Trade + Wholesale Trade complement each other
- Housing Starts + Building Permits complement each other

## Output Format

```
TOPIC DISCOVERY RESULTS - 2025-12-24
=====================================

RANK  SCORE  TABLE        SECTOR      TITLE
----  -----  -----------  ----------  ----------------------------------
1     87     23-10-0079   Transport   Airline operating statistics
2     82     18-10-0205   Prices      New Housing Price Index
3     78     20-10-0003   Trade       Wholesale trade

Top recommendation: 23-10-0079
- Last release: 2025-12-23
- Narrative hook: Transborder traffic down 9th consecutive month
- Sector gap: No transport coverage in last 30 days
```

## Reference Files

| Reference | When to Use |
|-----------|-------------|
| [sectors.md](references/sectors.md) | Sector categories, regional story patterns, scoring boosts |

## Handoff to Generator

After discovery, generate the article:

```
/the-daily-generator 23-10-0079 --slug airline-passengers-october-2025
```

For regional stories:
```
/the-daily-generator 34-10-0158 --slug ontario-housing-starts-november-2025 --geo Ontario
```
