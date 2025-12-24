# Data Workflow

How data flows from Statistics Canada to published articles.

## The Golden Rule

**Every number in an article must trace back to a real StatCan value.**

No exceptions. No approximations. No placeholders.

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
