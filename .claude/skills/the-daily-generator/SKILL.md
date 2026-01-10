---
name: the-daily-generator
description: Generate Statistics Canada Daily-style articles from CANSIM tables. Use when asked to create a Daily article, analyze StatCan data, run the D-AI-LY pipeline, generate a statistical bulletin, write about Canadian economic indicators, or cover a CANSIM table release.
---

# The D-AI-LY Article Generator

Generate StatCan "The Daily"-style statistical bulletins from CANSIM data tables.

## Critical Rule

**NEVER use synthetic, made-up, or placeholder data.** Every number must come from real Statistics Canada data fetched via the `cansim` R package. If data fetch fails, do not generate the article.

## How to Use Fetched Data

Every number in the article MUST come from the JSON file:

| Article Element | JSON Source |
|-----------------|-------------|
| Headline percentage | `latest.yoy_pct_change` or `latest.mom_pct_change` |
| Headline value | `latest.value` |
| Chart data array | `time_series[]` - copy date and value exactly |
| Component breakdown | `subseries[]` |
| Provincial table | `provincial[]` |
| Reference period | `metadata.reference_period` |

**Forbidden patterns:**
- ❌ Writing a number from memory
- ❌ Estimating values not in JSON
- ❌ Using "plausible" numbers to fill gaps
- ❌ Confusing similar terms (e.g., "Bank Rate" vs "Policy Rate")

**If a value isn't in the JSON, don't include it in the article.**

## Fabrication Prevention Checklist

Before finalizing ANY article, verify all checks pass.

### 1. Provenance (every number has a source)

**Principle:** Don't ask "does this look like real data?" — ask "can I trace every number to a verified source?"

- [ ] Headline figure: cite JSON path (e.g., `latest.yoy_pct_change = 2.2`)
- [ ] Each chart data point: from `time_series[N].value`
- [ ] Each table cell: from `subseries[N]` or `provincial[N]`
- [ ] **If you cannot cite the source → DO NOT include the number**

### 2. Arithmetic Verification (math must be exact)

- [ ] Recalculate YoY from time_series: `(current - year_ago) / year_ago × 100`
- [ ] Recalculate MoM from time_series: `(current - previous) / previous × 100`
- [ ] If trade data: verify `balance = exports - imports` exactly
- [ ] If components shown: verify they sum to total correctly
- [ ] **If calculated value differs from claimed by >0.1pp → STOP and investigate**

### 3. Period Match (critical)

- [ ] Article reference period ≤ JSON `metadata.reference_period`
- [ ] **If article period > JSON period → STOP, data doesn't exist yet**

**Example of failure:** Trade October 2025 article generated from September 2025 JSON → all figures fabricated.

### 4. Variation Check (for batch generation)

- [ ] Component values DIFFER across months generated
- [ ] Provincial values DIFFER across months generated
- [ ] **If values identical across months → you're copying stale data**

### 5. Subseries/Provincial Data Exists

- [ ] Does `subseries[]` array exist and have entries? If empty → omit breakdown
- [ ] Does `provincial[]` array exist and have entries? If empty → omit provincial table
- [ ] Can you cite exact JSON path for EACH breakdown value?

## Workflow

```
1. FETCH DATA
   Rscript r-tools/fetch_cansim_enhanced.R <table-number> output
   → output/data_<table>_enhanced.json

2. READ AND CONFIRM DATA (MANDATORY)
   Before writing ANY article content:
   - Read the JSON file completely
   - State the headline value: "latest.yoy_pct_change is X.X%"
   - State the reference period: "metadata.reference_period is YYYY-MM"
   - If JSON doesn't exist or is stale, STOP - do not proceed

3. CREATE ENGLISH ARTICLE
   docs/en/<slug>/index.md

4. CREATE FRENCH ARTICLE
   docs/fr/<slug-fr>/index.md

5. UPDATE LANGUAGE MAP
   Add slug pair to src/lang-map.js

6. UPDATE INDEX PAGES
   Add entry to docs/en/index.md and docs/fr/index.md

7. PREVIEW AND VERIFY
   npm run dev → http://localhost:3000
```

## Article Structure

```markdown
---
title: Consumer prices up 2.2% year over year in November 2025
toc: false
---

# Consumer prices up 2.2% year over year in November 2025

<p class="release-date">Data released: December 5, 2025 | Published: December 22, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**
- Key finding with number
- Secondary finding
- Regional highlight

</div>

[Body paragraphs with Observable Plot charts]

<div class="note-to-readers">

## Note to readers
[Methodology]

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch data
df <- get_cansim("XX-XX-XXXX")

# Filter and calculate changes
# [Table-specific code here]
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table XX-XX-XXXX](url)
**DOI:** [https://doi.org/...](url)

</div>
```

## Date Handling

**For new releases** (covering the most recent data period):
- Extract `release_time` from the fetched JSON metadata (e.g., `"2025-12-05 08:30:00"`)
- Format both dates in the release-date line:
  ```html
  <p class="release-date">Data released: December 5, 2025 | Published: December 22, 2025 <span class="article-type-tag release">New Release</span></p>
  ```
- "Data released" = when StatCan published the data (`metadata.release_time`)
- "Published" = when the article is being generated (today's date)

**For backfill articles** (covering historical periods):
- **Omit the release-date paragraph entirely**
- The `<span class="article-type-tag backfill">Backfill</span>` tag (placed elsewhere) indicates this is historical coverage

## R Code Reproducibility Section

**Always include** a collapsible R code section showing how to extract the data used in the article.

**Structure:**
```markdown
<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch [indicator] data
df <- get_cansim("XX-XX-XXXX")

# National time series
national <- df %>%
  filter(GEO == "Canada", ...) %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Calculate changes (month-over-month, year-over-year)
current <- national %>% filter(REF_DATE == "YYYY-MM") %>% pull(VALUE)
previous <- national %>% filter(REF_DATE == "YYYY-MM") %>% pull(VALUE)
change <- (current - previous) / previous * 100

# Subsector/component breakdown
# Provincial variation
```

</details>
```

**Code should demonstrate:**
1. Fetching data with `get_cansim()`
2. Filtering to relevant dimensions (GEO, product groups, adjustments)
3. Calculating the key metrics shown in the article (MoM, YoY changes)
4. Extracting subsector and provincial breakdowns if present

**French articles:** Use the same R code (package names and functions stay in English).

## Reference Files

Load these as needed:

| Reference | When to Use |
|-----------|-------------|
| [voice.md](references/voice.md) | Tone, headline rules, language guidelines |
| [chart-styles.md](references/chart-styles.md) | Observable Plot patterns, color palette |
| [french.md](references/french.md) | French formatting, translations, province names |
| [tables.md](references/tables.md) | Common CANSIM tables, URL construction |
| [data-workflow.md](references/data-workflow.md) | JSON structure, data validation |
| [content-strategy.md](references/content-strategy.md) | Release-driven vs story-driven approaches |
| [troubleshooting.md](references/troubleshooting.md) | Common errors and solutions |

## Quick Reference

**StatCan red:** `#AF3C43`

**Headline format:** "[Indicator] [up/down] X.X% [comparison] in [Month Year]"

**Chart import:** (once per article, first code block only)
```js
import * as Plot from "npm:@observablehq/plot";
```

**PID from table:** Remove dashes, add "01" → 18-10-0004 becomes 1810000401

## Quality Checklist

Before publishing:
- [ ] All values from fetched JSON (no made-up data)
- [ ] Headline leads with key statistic
- [ ] Charts render with #AF3C43 color
- [ ] Language switcher works (slug in lang-map.js)
- [ ] Voice is neutral (no "surged", "plummeted")
- [ ] French uses comma decimals (2,2 %)
- [ ] R code reproducibility section included with correct table number

## Review Mode

If user requests "review mode", pause after generating and ask for approval before publishing.
