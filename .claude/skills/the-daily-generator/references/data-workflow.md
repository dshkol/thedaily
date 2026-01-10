# Data Workflow

How data flows from Statistics Canada to published articles.

## Explore Before Generating

**Always query the table's dimensions before writing.** Don't assume you know what's available.

```r
library(cansim)

# Fetch and inspect
df <- get_cansim("25-10-0015")

# What dimensions exist?
names(df)
unique(df$GEO)                    # Geographic coverage
unique(df$`Type of electricity`)  # Category breakdowns
range(df$REF_DATE)                # Time coverage
```

This exploration reveals story angles you'd otherwise miss:
- Provincial data enables regional comparisons
- Component breakdowns show what drove the headline
- Time depth enables trend analysis

## Data Dimension Checklist

Before generating, verify coverage of ALL available dimensions:

| Dimension | Check | Use In Article |
|-----------|-------|----------------|
| **Time series** | `time_series[]` in JSON | Trend chart |
| **Composition** | Category/type breakdowns | Stacked area, waffle chart |
| **Provincial** | `provincial[]` in JSON | Regional comparison table |
| **YoY by subcategory** | Calculate for each component | Diverging bar chart |

**Don't stop at Canada-level totals.** If the table has provincial data, include it. If it has component breakdowns, show YoY by component.

## The Golden Rule

**Every number in an article must trace back to a real StatCan value.**

No exceptions. No approximations. No placeholders.

## CRITICAL: Auxiliary Data Fabrication Prevention

**Lesson learned (2025-12-28):** Backfill articles had fabricated employment rate, participation rate, and FT/PT split values. Some values were not just wrong but in the **OPPOSITE DIRECTION** from reality.

### What Happened
- Time series data (unemployment rate, employment levels) were correct (from verified sources)
- Auxiliary indicators (employment rate, participation rate, FT/PT splits) were **invented** to fill summary tables
- The fabrication pattern always made FT/PT split "mirror" overall employment direction, when reality is more nuanced

### Mandatory Validation Rule

For **every** numeric value in an article:
1. **FETCH** from StatCan (R cansim package) - not derived, not estimated
2. **VALIDATE** the fetched value against the article
3. **CITE** specific table/vector source
4. **NEVER** derive, assume, or fabricate values

### Pre-Publish Checklist for Summary Tables

For each number in summary table:
- [ ] Is this value fetched from StatCan?
- [ ] Can I cite the specific vector/table?
- [ ] Have I validated it matches the R/JSON output exactly?
- [ ] If this is a calculated change, did I calculate from real fetched values?

### Safe vs. Unsafe Backfill Patterns

**SAFE**: Extending line charts backward (each point independently validated)
**UNSAFE**: Filling in auxiliary table values (not sourced, invented)

When backfilling from existing article time series:
- ❌ Wrong: If summary table has 6 indicators but only 2 are in time series, fill other 4 with "plausible" numbers
- ✓ Right: Omit indicators you cannot source, or fetch each from StatCan

### LFS Specific Vectors for Reference

If fetching auxiliary LFS indicators:
```r
library(cansim)

vectors <- c(
  "v2062809",  # Population
  "v2062811",  # Employment
  "v2062813",  # Part-time employment
  "v2062815",  # Unemployment rate
  "v2062817",  # Employment rate
  "v2062821"   # Full-time employment
)

df <- get_cansim_vector(vectors, start_time = "2024-01-01")
```

## Post-Fetch Validation

After fetching, **always verify the data before generating**:

```r
# Check actual data range (don't trust JSON metadata)
df <- get_cansim("18-10-0212")
range(df$REF_DATE)  # Actual date coverage

# Verify YoY is possible
min_date <- min(df$REF_DATE)
max_date <- max(df$REF_DATE)
has_yoy <- as.numeric(difftime(
  as.Date(paste0(max_date, "-01")),
  as.Date(paste0(min_date, "-01")),
  units = "days"
)) > 365

# Check dimension labels exist
unique(df$Commodity)  # or whatever the category column is
```

**Red flags to watch for:**
- JSON shows `data_start_date: "2018-01-01"` but actual data starts recently
- `yoy_pct_change` present in JSON but table has < 13 months of data
- `time_series[]` has values but no category labels
- `subseries{}` or `provincial{}` empty when table should have breakdowns

**If validation fails:** Query the raw table via R to get accurate dimensions, don't rely solely on JSON output.

## Data Flow

```
1. FETCH
   Rscript r-tools/fetch_cansim_enhanced.R 36-10-0434 output
   ↓
   output/data_36_10_0434_enhanced.json

2. READ
   Claude reads the JSON to extract:
   - latest.value, latest.yoy_pct_change, latest.mom_pct_change
   - time_series[] for charts
   - subseries[] for component breakdowns
   - provincial[] for geographic data

3. GENERATE
   Claude creates article markdown using ONLY values from the JSON
   - Headlines use latest.yoy_pct_change
   - Charts embed time_series[] data directly
   - Tables use subseries[] or provincial[] data

4. VALIDATE
   Before publishing, verify:
   - Chart data matches time_series from JSON
   - Percentages match calculated changes
   - All numbers traceable to source
```

## JSON Structure Reference

```json
{
  "metadata": {
    "table_number": "36-10-0434",
    "reference_period": "2025-10",
    "fetched_at": "2025-12-23 10:00:00"
  },
  "latest": {
    "value": 2325868,
    "mom_pct_change": -0.34,
    "yoy_pct_change": 0.31
  },
  "time_series": [
    {"date": "2024-11-01", "value": 2312337, "mom_pct_change": ...},
    {"date": "2024-12-01", "value": 2317000, "mom_pct_change": ...},
    ...
  ],
  "subseries": [
    {"category": "Manufacturing", "value": ..., "yoy_pct_change": ...},
    ...
  ]
}
```

## Embedding Data in Articles

Articles embed data directly in JavaScript blocks:

```js
// CORRECT: Use actual values from JSON
const gdpData = [
  {date: new Date("2024-11"), value: 2312337},
  {date: new Date("2024-12"), value: 2317000},
  {date: new Date("2025-01"), value: 2327191},
  // ... all values from time_series[]
];
```

**NEVER:**
```js
// WRONG: Made-up "plausible" values
const gdpData = [
  {date: new Date("2024-11"), value: 2314700},  // fake
  {date: new Date("2024-12"), value: 2309700},  // fake
  ...
];
```

## Validation Checklist

Before any article is complete:

- [ ] JSON file exists with fetched_at timestamp
- [ ] Headline number matches latest.yoy_pct_change or latest.value
- [ ] Chart data points match time_series[] exactly
- [ ] Table values match subseries[] or provincial[]
- [ ] Reference period matches metadata.reference_period
- [ ] No hardcoded numbers that aren't from JSON

## If Data Fetch Fails

If the R script cannot fetch data:
1. **Do not generate the article**
2. Report the error
3. Check if table number is correct
4. Check if StatCan API is available
5. Try again later

Never substitute synthetic data.

## Known Failure Modes

### Hardcoded Plausible Values (Jan 2026)

**What happened**: Articles were generated with numbers that looked reasonable but weren't from the fetched data.

**Examples**:
- Interest rates article used 2.50% (the "Bank Rate") instead of 2.25% (the "Policy Rate" from JSON)
- Manufacturing capacity used 80.8% instead of actual 80.7% from JSON

**Root causes**:
1. JSON file wasn't read before generating article text
2. LLM used approximate values from training data instead of exact JSON values
3. Similar-sounding terms confused (Bank Rate ≠ Policy Rate)

**Prevention**:
1. ALWAYS read JSON file before writing ANY numbers
2. ALWAYS state headline value out loud: "The JSON shows X.X%"
3. Copy-paste values from JSON, don't type from memory
4. For financial data: verify exact terminology matches the JSON field name

### Stale Breakdown Data in Historical Articles (Jan 2026)

**What happened**: CPI articles for July-October 2025 were generated using `--ref-date` parameter. Headlines and time series correctly showed historical periods, BUT component breakdowns and provincial tables showed November 2025 data.

**Result**: 5 articles had identical fabricated breakdown data - same component percentages (Food: 4.2%, Household: 3.3%, etc.) and same provincial values across all months.

**Root cause**:
1. `rebase_data_to_period()` in Python generator only rebased headlines, not breakdowns
2. JSON file only contained latest period's `subseries[]` and `provincial[]` data
3. Function copied stale data without validation

**Detection red flags**:
- Component percentages **identical** across multiple months → fabricated
- Provincial YoY values **identical** across multiple months → fabricated
- Real economic data has natural month-to-month variation

**Prevention**:
1. Generator now strips `subseries`/`provincial` when rebasing to historical period
2. Always verify JSON `metadata.reference_period` matches article period
3. For historical articles: only include headline + trend, not breakdowns
4. If generating multiple months: verify values DIFFER between months

### YoY Calculation Errors (Jan 2026)

**What happened**: GDP October 2025 article claimed +0.4% YoY, but actual calculation from time_series was +0.04% (10x error).

**The data**:
- time_series: Oct 2024 = 2317.1B, Oct 2025 = 2318.0B
- Correct YoY: (2318.0 - 2317.1) / 2317.1 × 100 = **0.04%**
- Article incorrectly stated: **0.4%**

**Root cause**: Decimal place error when transcribing small percentage changes.

**Prevention**:
1. Always cross-validate YoY by manual calculation from time_series
2. If time_series shows Oct 2024 = X and Oct 2025 = Y, verify (Y-X)/X × 100 matches claimed YoY
3. Be especially careful with small percentage changes (<1%)
4. Double-check decimal places: 0.04% ≠ 0.4% ≠ 4%

### Article Generated for Unreleased Period (Jan 2026)

**What happened**: International trade article claimed to cover October 2025, but JSON only contained September 2025 data. October data wasn't released until January 8, 2026.

**The evidence**:
- JSON `reference_period`: "2025-09"
- JSON `end_period`: "2025-09"
- JSON `fetched_at`: "2025-12-23"
- Article claimed: October 2025
- Official October release: 2026-01-08

**Result**: LLM fabricated internally-consistent but completely wrong October figures:
- Claimed: exports flat, imports +4.2%, deficit $2.6B
- Actual (released Jan 8): exports +2.1%, imports +3.4%, deficit $583M

**Root cause**: Article was requested for a period beyond what existed in the JSON. Without real data, LLM invented plausible-looking values that were self-consistent but externally wrong.

**Detection**:
- Internally consistent ≠ externally accurate
- Compare JSON `reference_period` against article's claimed reference period
- If article period > JSON period → data was fabricated

**Prevention**:
1. **NEVER generate articles for periods beyond `metadata.reference_period`**
2. Before generating, verify: `article_period <= JSON.metadata.reference_period`
3. If user requests future period, STOP and report: "Data not yet available"
4. Check StatCan release schedule before attempting to generate

### Percentage Fabrication from Dollar Values (Jan 2026)

**What happened**: Building permits article showed industrial component +12.5%, but source only had dollar change ("edged down $3.9 million").

**The evidence**:
- Source text: "industrial component edged down $3.9 million"
- Article claimed: Industrial +12.5%
- No base value was available to calculate percentage

**Root cause**: LLM invented a percentage when only absolute change was provided. Without the denominator, percentage cannot be calculated.

**Detection**:
- If source shows "$X change" but article shows "Y% change" → verify base value exists
- Percentage requires: (new - old) / old × 100. If "old" is unknown, percentage is fabricated.

**Prevention**:
1. Only show percentages when BOTH values (before and after) are available
2. If source only provides dollar change, report dollar change (not invented %)
3. Ask: "Can I calculate this percentage from values I have?" If no → don't show %
