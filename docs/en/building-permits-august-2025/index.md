---
title: Building permits down 3.4% in August 2025
verification_json: output/data_34_10_0175_enhanced.json
toc: false
---
# Building permits down 3.4% in August 2025

<p class="release-date">Released: October 10, 2025</p>

<div class="highlights">

- The total value of building permits decreased 3.4% to $11.5 billion in August 2025
- Residential permits fell to $7.2 billion
- Non-residential permits declined to $4.3 billion
- On a year-over-year basis, permits were up 1.8%

</div>

The total value of building permits decreased 3.4% to $11.5 billion in August 2025, following a 1.7% decline in July. On a year-over-year basis, the total value of permits was up 1.8% compared with August 2024.

Residential permits fell to $7.2 billion, while non-residential permits declined to $4.3 billion, as construction intentions slowed during the summer months.

## Trend in building permits

The total value of building permits has fluctuated between $10.7 billion and $13.0 billion over the past two years, with August 2025 continuing this range-bound pattern.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 34-10-0292 (values in $ billions)
const permitsData = [
  {date: new Date("2023-08"), total: 12.1},
  {date: new Date("2023-09"), total: 11.9},
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
  {date: new Date("2025-08"), total: 11.5}
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

Building permit values have shown notable fluctuation throughout 2025, with the largest gain in March followed by a pullback in July and August.

```js
const momData = [
  {month: "Jan", change: 2.7},
  {month: "Feb", change: -4.4},
  {month: "Mar", change: 6.4},
  {month: "Apr", change: -2.6},
  {month: "May", change: 4.4},
  {month: "Jun", change: 2.5},
  {month: "Jul", change: -1.7},
  {month: "Aug", change: -3.4}
];

display(Plot.plot({
  title: "Month-over-month change in building permits, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"]
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

| Indicator | August 2025 | Change from July | Change from August 2024 |
|-----------|------------:|-----------------:|------------------------:|
| Total permits ($ billions) | 11.5 | -3.4% | +1.8% |
| Residential ($ billions) | 7.2 | -3.6% | +1.5% |
| Non-residential ($ billions) | 4.3 | -3.0% | +2.2% |

<div class="note-to-readers">

**Note to readers**

Building permits data provide an early indication of future construction activity. The value of permits represents the construction intentions of permit holders and may differ from actual construction.

Data are seasonally adjusted to account for regular seasonal patterns in construction activity.

This is a backfill article covering August 2025 data, published as part of the D-AI-LY's historical coverage initiative.

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
         REF_DATE == "2025-08",
         `Type of permit and value` == "Total permits, value") %>%
  select(`Type of structure`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- permits %>%
  filter(`Type of structure` == "Total residential and non-residential",
         `Type of permit and value` == "Total permits, value",
         REF_DATE == "2025-08",
         GEO != "Canada") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 34-10-0292](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3410029201)
**Survey:** Building Permits
**Reference period:** August 2025
**DOI:** [https://doi.org/10.25318/3410029201-eng](https://doi.org/10.25318/3410029201-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "building-permits-august-2025", "en"));
```
