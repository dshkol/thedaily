---
title: Wholesale sales edge up 0.1% in October 2025
toc: false
---

# Wholesale sales edge up 0.1% in October 2025

<p class="release-date">Released: December 12, 2025</p>

<div class="highlights">

**Highlights**

- Wholesale sales rose 0.1% to $86.0 billion in October 2025
- Motor vehicle and parts sales increased 2.3% to $14.7 billion
- Farm product sales jumped 16.7% to $2.0 billion
- In volume terms, wholesale sales fell 0.7%

</div>

Sales by Canadian wholesalers rose 0.1% to $86.0 billion in October 2025, the fifth increase in six months. In volume terms, wholesale sales fell 0.7%, indicating that higher prices offset volume declines.

Sales rose in four of seven subsectors, representing approximately half of total wholesale sales. Increases were led by the motor vehicle and parts subsector and the farm product subsector.

```js
import * as Plot from "npm:@observablehq/plot";

// Data from Statistics Canada Table 20-10-0003
// Wholesale trade excluding petroleum and oilseed/grain ($ billions)
const salesData = [
  {date: new Date("2023-01"), value: 84.9},
  {date: new Date("2023-02"), value: 82.7},
  {date: new Date("2023-03"), value: 81.8},
  {date: new Date("2023-04"), value: 81.0},
  {date: new Date("2023-05"), value: 83.4},
  {date: new Date("2023-06"), value: 81.7},
  {date: new Date("2023-07"), value: 82.0},
  {date: new Date("2023-08"), value: 83.6},
  {date: new Date("2023-09"), value: 82.9},
  {date: new Date("2023-10"), value: 82.3},
  {date: new Date("2023-11"), value: 83.1},
  {date: new Date("2023-12"), value: 83.1},
  {date: new Date("2024-01"), value: 82.6},
  {date: new Date("2024-02"), value: 82.4},
  {date: new Date("2024-03"), value: 81.5},
  {date: new Date("2024-04"), value: 84.1},
  {date: new Date("2024-05"), value: 83.2},
  {date: new Date("2024-06"), value: 82.2},
  {date: new Date("2024-07"), value: 82.5},
  {date: new Date("2024-08"), value: 81.9},
  {date: new Date("2024-09"), value: 82.6},
  {date: new Date("2024-10"), value: 83.9},
  {date: new Date("2024-11"), value: 83.6},
  {date: new Date("2024-12"), value: 84.1},
  {date: new Date("2025-01"), value: 85.2},
  {date: new Date("2025-02"), value: 85.7},
  {date: new Date("2025-03"), value: 86.1},
  {date: new Date("2025-04"), value: 84.0},
  {date: new Date("2025-05"), value: 83.8},
  {date: new Date("2025-06"), value: 84.9},
  {date: new Date("2025-07"), value: 86.3},
  {date: new Date("2025-08"), value: 85.5},
  {date: new Date("2025-09"), value: 86.0},
  {date: new Date("2025-10"), value: 86.0}
];

display(Plot.plot({
  title: "Wholesale sales ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [78, 90], grid: true, label: "$ billions"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(salesData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Subsector performance

Motor vehicle and parts sales rose 2.3% to $14.7 billion in October, driven by higher sales in the motor vehicle industry group. The increase came largely from higher wholesale sales of passenger vehicles manufactured abroad, as well as buses and transport trucks.

Farm product wholesalers posted a 16.7% jump to $2.0 billion, marking a sixth consecutive monthly gain and a 28.1% year-over-year increase.

```js
const subsectorData = [
  {sector: "Motor vehicles & parts", change: 2.3, value: 14.7},
  {sector: "Farm products", change: 16.7, value: 2.0},
  {sector: "Food, beverage, tobacco", change: -0.2, value: 15.2},
  {sector: "Machinery & equipment", change: 0.5, value: 13.8},
  {sector: "Personal & household goods", change: -0.8, value: 8.4},
  {sector: "Building materials", change: 0.3, value: 10.1},
  {sector: "Miscellaneous", change: -3.7, value: 10.9}
];

display(Plot.plot({
  title: "Monthly change by subsector (%)",
  width: 600,
  height: 280,
  marginLeft: 180,
  marginRight: 60,
  x: {domain: [-5, 20], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(subsectorData, {
      y: "sector",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(subsectorData, {
      y: "sector",
      x: 20,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Provincial variation

Ontario led the gains in provincial wholesale sales in October, with sales up 0.9% to $44.3 billion. Excluding Ontario, sales of wholesale goods in Canada fell 0.8%.

The largest decline came in Quebec, where sales fell 2.9% to $14.9 billion. Quebec wholesalers reported lower sales in five of seven subsectors, led by the food, beverage and tobacco subsector.

| Province | October 2025 ($ billions) | Monthly change |
|----------|--------------------------|----------------|
| Ontario | 44.3 | +0.9% |
| Quebec | 14.9 | -2.9% |
| British Columbia | 8.5 | +0.2% |
| Alberta | 8.2 | +0.1% |
| Saskatchewan | 4.0 | +4.6% |
| Manitoba | 2.0 | +5.0% |
| Nova Scotia | 1.3 | -1.5% |
| New Brunswick | 0.8 | -3.5% |

## Inventories

Total wholesale inventories were virtually unchanged at $135.4 billion in October. The inventory-to-sales ratio edged down to 1.57 from 1.58 in September.

Declines in food, beverage and tobacco inventories (-2.6%) and personal and household goods (-1.3%) were offset by gains in motor vehicle inventories (+2.7%).

<div class="note-to-readers">

## Note to readers

Data in this release are seasonally adjusted to remove regular seasonal patterns. The headline series excludes petroleum, petroleum products, other hydrocarbons, oilseed, and grain to provide a measure less affected by price volatility in these commodities.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0003](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010000301)
**Survey:** Monthly Wholesale Trade Survey
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/2010000301-eng](https://doi.org/10.25318/2010000301-eng)

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch wholesale trade data
wholesale <- get_cansim("20-10-0003") %>%
  filter(GEO == "Canada") %>%
  filter(`Trade sector` == "Wholesale trade") %>%
  filter(`Adjustments` == "Seasonally adjusted")

# Get total sales time series
sales_ts <- wholesale %>%
  filter(`North American Industry Classification System (NAICS)` ==
         "Wholesale trade [41]") %>%
  filter(REF_DATE >= "2023-01") %>%
  select(REF_DATE, VALUE) %>%
  arrange(REF_DATE)

# Get subsector breakdown for latest month
subsectors <- wholesale %>%
  filter(REF_DATE == "2025-10") %>%
  filter(!grepl("Wholesale trade \\[41\\]",
         `North American Industry Classification System (NAICS)`)) %>%
  select(`North American Industry Classification System (NAICS)`, VALUE)

# Calculate changes
oct2025 <- sales_ts %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
sep2025 <- sales_ts %>% filter(REF_DATE == "2025-09") %>% pull(VALUE)
mom_change <- (oct2025 - sep2025) / sep2025 * 100
```

</details>
