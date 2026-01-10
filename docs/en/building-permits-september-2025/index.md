---
title: Building permits up 4.3% in September 2025
verification_json: output/data_34_10_0175_enhanced.json
toc: false
---
# Building permits up 4.3% in September 2025

<p class="release-date">Released: November 12, 2025</p>

<div class="highlights">

**Highlights**

- The total value of building permits increased 4.3% to $12.0 billion in September 2025
- Residential permits rose 4.8% to $7.5 billion
- Non-residential permits increased 3.5% to $4.5 billion
- On a year-over-year basis, permits were up 2.6%

</div>

The total value of building permits increased 4.3% to $12.0 billion in September 2025, recovering from a decline in August. On a year-over-year basis, the total value of permits was up 2.6% compared with September 2024.

Residential permits rose 4.8% to $7.5 billion, driven by multi-family construction intentions. Non-residential permits increased 3.5% to $4.5 billion.

## Trend in building permits

The total value of building permits has fluctuated between $10.7 billion and $13.0 billion over the past two years, with September 2025 continuing this range-bound pattern.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 34-10-0292 (values in $ billions)
const permitsData = [
  {date: new Date("2023-10"), total: 13.0},
  {date: new Date("2023-11"), total: 11.8},
  {date: new Date("2023-12"), total: 11.2},
  {date: new Date("2024-01"), total: 11.5},
  {date: new Date("2024-02"), total: 11.1},
  {date: new Date("2024-03"), total: 11.8},
  {date: new Date("2024-04"), total: 11.4},
  {date: new Date("2024-05"), total: 11.6},
  {date: new Date("2024-06"), total: 11.9},
  {date: new Date("2024-07"), total: 12.2},
  {date: new Date("2024-08"), total: 11.3},
  {date: new Date("2024-09"), total: 11.7},
  {date: new Date("2024-10"), total: 13.0},
  {date: new Date("2024-11"), total: 11.5},
  {date: new Date("2024-12"), total: 11.1},
  {date: new Date("2025-01"), total: 11.4},
  {date: new Date("2025-02"), total: 10.9},
  {date: new Date("2025-03"), total: 11.6},
  {date: new Date("2025-04"), total: 11.3},
  {date: new Date("2025-05"), total: 11.8},
  {date: new Date("2025-06"), total: 12.1},
  {date: new Date("2025-07"), total: 11.9},
  {date: new Date("2025-08"), total: 11.5},
  {date: new Date("2025-09"), total: 12.0}
];

display(Plot.plot({
  title: "Total value of building permits ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [10, 14], grid: true, label: "$ billions"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(permitsData, {x: "date", y: "total", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(permitsData.slice(-1), {x: "date", y: "total", fill: "#AF3C43", r: 5}),
    Plot.text(permitsData.slice(-1), {x: "date", y: "total", text: d => "$" + d.total.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Monthly change in 2025

Building permit values have shown modest fluctuation throughout 2025, with the largest gain in June followed by a pullback in July and August before recovering in September.

```js
const momData = [
  {month: "Jan", change: 2.7},
  {month: "Feb", change: -4.4},
  {month: "Mar", change: 6.4},
  {month: "Apr", change: -2.6},
  {month: "May", change: 4.4},
  {month: "Jun", change: 2.5},
  {month: "Jul", change: -1.7},
  {month: "Aug", change: -3.4},
  {month: "Sep", change: 4.3}
];

display(Plot.plot({
  title: "Month-over-month change in building permits, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"]
  },
  y: {grid: true, label: "Percent change", domain: [-6, 8]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(momData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(momData, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.4 : d.change - 0.4,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      fontSize: 10
    })
  ]
}));
```

## Summary table

| Indicator | September 2025 | Change from August | Change from September 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| Total permits ($ billions) | 12.0 | +4.3% | +2.6% |
| Residential ($ billions) | 7.5 | +4.8% | +3.1% |
| Non-residential ($ billions) | 4.5 | +3.5% | +1.8% |

<div class="note-to-readers">

## Note to readers

Building permits data provide an early indication of future construction activity. The value of permits represents the construction intentions of permit holders and may differ from actual construction.

Data are seasonally adjusted to account for regular seasonal patterns in construction activity.

This backfill article covers September 2025 data as part of The D-AI-LY historical coverage initiative.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch building permits data
permits <- get_cansim("34-10-0066")

# Total building permits value
total_permits <- permits %>%
  filter(GEO == "Canada",
         `Type of structure` == "Total residential and non-residential",
         `Type of permit and value` == "Total permits, value") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# By type of structure
by_type <- permits %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-09",
         `Type of permit and value` == "Total permits, value") %>%
  select(`Type of structure`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- permits %>%
  filter(`Type of structure` == "Total residential and non-residential",
         `Type of permit and value` == "Total permits, value",
         REF_DATE == "2025-09",
         GEO != "Canada") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 34-10-0292](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3410029201)
**Survey:** Building Permits
**Reference period:** September 2025
**DOI:** [https://doi.org/10.25318/3410029201-eng](https://doi.org/10.25318/3410029201-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "building-permits-september-2025", "en"));
```
