---
title: Canada posts trade deficit of $583 million in October 2025
verification_json: output/merchandise_trade.json
toc: false
---
# Canada posts trade deficit of $583 million in October 2025

<p class="release-date">Released: January 17, 2026 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Canada recorded a merchandise trade deficit of $583 million in October 2025, reversing September's surplus
- Exports rose 2.1% to $65.6 billion while imports increased 3.4% to $66.2 billion
- The United States accounted for 67% of Canadian merchandise exports at $44.1 billion
- Year over year, both exports and imports were up 0.9%

</div>

Canada's merchandise trade balance shifted to a deficit of $583 million in October 2025, following a surplus of $243 million in September. The reversal reflected imports rising faster than exports during the month.

Merchandise exports totalled $65.6 billion in October, up 2.1% from $64.3 billion in September. Imports rose 3.4% to $66.2 billion from $64.0 billion in the previous month. On a year-over-year basis, both exports and imports were up 0.9% compared with October 2024.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 12-10-0011
const exportsData = [
  {date: new Date("2023-11-01"), value: 65272.0},
  {date: new Date("2023-12-01"), value: 63178.6},
  {date: new Date("2024-01-01"), value: 61007.6},
  {date: new Date("2024-02-01"), value: 65145.2},
  {date: new Date("2024-03-01"), value: 63144.4},
  {date: new Date("2024-04-01"), value: 65302.2},
  {date: new Date("2024-05-01"), value: 63470.0},
  {date: new Date("2024-06-01"), value: 65848.7},
  {date: new Date("2024-07-01"), value: 65096.0},
  {date: new Date("2024-08-01"), value: 64124.5},
  {date: new Date("2024-09-01"), value: 63893.2},
  {date: new Date("2024-10-01"), value: 64989.5},
  {date: new Date("2024-11-01"), value: 66006.0},
  {date: new Date("2024-12-01"), value: 69585.3},
  {date: new Date("2025-01-01"), value: 72924.4},
  {date: new Date("2025-02-01"), value: 68813.3},
  {date: new Date("2025-03-01"), value: 67521.5},
  {date: new Date("2025-04-01"), value: 60099.1},
  {date: new Date("2025-05-01"), value: 61110.3},
  {date: new Date("2025-06-01"), value: 61522.1},
  {date: new Date("2025-07-01"), value: 62345.2},
  {date: new Date("2025-08-01"), value: 60252.5},
  {date: new Date("2025-09-01"), value: 64286.6},
  {date: new Date("2025-10-01"), value: 65606.7}
];

const importsData = [
  {date: new Date("2023-11-01"), value: 64682.3},
  {date: new Date("2023-12-01"), value: 64802.4},
  {date: new Date("2024-01-01"), value: 61988.9},
  {date: new Date("2024-02-01"), value: 64503.9},
  {date: new Date("2024-03-01"), value: 63954.5},
  {date: new Date("2024-04-01"), value: 66067.3},
  {date: new Date("2024-05-01"), value: 64923.0},
  {date: new Date("2024-06-01"), value: 66712.1},
  {date: new Date("2024-07-01"), value: 65449.0},
  {date: new Date("2024-08-01"), value: 65892.6},
  {date: new Date("2024-09-01"), value: 65243.6},
  {date: new Date("2024-10-01"), value: 65606.1},
  {date: new Date("2024-11-01"), value: 66617.1},
  {date: new Date("2024-12-01"), value: 67828.3},
  {date: new Date("2025-01-01"), value: 69212.0},
  {date: new Date("2025-02-01"), value: 69879.8},
  {date: new Date("2025-03-01"), value: 69408.7},
  {date: new Date("2025-04-01"), value: 67334.6},
  {date: new Date("2025-05-01"), value: 66803.0},
  {date: new Date("2025-06-01"), value: 67140.8},
  {date: new Date("2025-07-01"), value: 66243.7},
  {date: new Date("2025-08-01"), value: 66905.5},
  {date: new Date("2025-09-01"), value: 64044.1},
  {date: new Date("2025-10-01"), value: 66189.8}
];

display(Plot.plot({
  title: "Merchandise exports and imports, November 2023 to October 2025 ($ millions)",
  width: 680,
  height: 300,
  y: {domain: [58000, 75000], grid: true, label: "Millions $"},
  x: {type: "utc", label: null},
  color: {domain: ["Exports", "Imports"], range: ["#AF3C43", "#666"]},
  marks: [
    Plot.lineY(exportsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.lineY(importsData, {x: "date", y: "value", stroke: "#666", strokeWidth: 2}),
    Plot.dot(exportsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.dot(importsData.slice(-1), {x: "date", y: "value", fill: "#666", r: 5}),
    Plot.text([{x: new Date("2025-10-01"), y: 65606.7, label: "Exports"}], {x: "x", y: "y", text: "label", dy: -12, fill: "#AF3C43", fontWeight: 600}),
    Plot.text([{x: new Date("2025-10-01"), y: 66189.8, label: "Imports"}], {x: "x", y: "y", text: "label", dy: 18, fill: "#666", fontWeight: 600})
  ]
}));
```

## Trade balance fluctuates throughout 2025

The October deficit followed several months of trade balance volatility in 2025. Canada recorded surpluses in January ($3.7 billion) and September ($243 million), but deficits in most other months, including a significant deficit of $7.2 billion in April.

```js
const balanceData = [
  {date: new Date("2023-11-01"), value: 589.7},
  {date: new Date("2023-12-01"), value: -1623.8},
  {date: new Date("2024-01-01"), value: -981.3},
  {date: new Date("2024-02-01"), value: 641.3},
  {date: new Date("2024-03-01"), value: -810.1},
  {date: new Date("2024-04-01"), value: -765.1},
  {date: new Date("2024-05-01"), value: -1453.0},
  {date: new Date("2024-06-01"), value: -863.4},
  {date: new Date("2024-07-01"), value: -353.0},
  {date: new Date("2024-08-01"), value: -1768.1},
  {date: new Date("2024-09-01"), value: -1350.4},
  {date: new Date("2024-10-01"), value: -616.7},
  {date: new Date("2024-11-01"), value: -611.1},
  {date: new Date("2024-12-01"), value: 1757.0},
  {date: new Date("2025-01-01"), value: 3712.4},
  {date: new Date("2025-02-01"), value: -1066.5},
  {date: new Date("2025-03-01"), value: -1887.3},
  {date: new Date("2025-04-01"), value: -7235.5},
  {date: new Date("2025-05-01"), value: -5692.8},
  {date: new Date("2025-06-01"), value: -5618.7},
  {date: new Date("2025-07-01"), value: -3898.5},
  {date: new Date("2025-08-01"), value: -6653.0},
  {date: new Date("2025-09-01"), value: 242.5},
  {date: new Date("2025-10-01"), value: -583.1}
];

display(Plot.plot({
  title: "Merchandise trade balance, November 2023 to October 2025 ($ millions)",
  width: 680,
  height: 280,
  y: {grid: true, label: "Millions $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0], {stroke: "#333"}),
    Plot.barY(balanceData, {x: "date", y: "value", fill: d => d.value >= 0 ? "#AF3C43" : "#2e7d32"}),
    Plot.text(balanceData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(0) + "M", dy: d => d.value >= 0 ? -12 : 12, fill: "#2e7d32", fontWeight: 600})
  ]
}));
```

## United States dominates Canadian exports

The United States remained Canada's largest export destination by far, receiving $44.1 billion in merchandise exports in October 2025, or 67% of total Canadian exports. The United Kingdom was the second-largest destination at $5.9 billion (9%), followed by the European Union at $4.2 billion (6%) and China at $3.3 billion (5%).

| Trading partner | Exports ($ millions) | Share |
|---|---:|---:|
| United States | 44,126 | 67.3% |
| United Kingdom | 5,905 | 9.0% |
| European Union | 4,206 | 6.4% |
| China | 3,327 | 5.1% |
| Netherlands | 1,298 | 2.0% |
| Japan | 1,233 | 1.9% |
| Mexico | 819 | 1.2% |
| Other countries | 4,693 | 7.2% |

<div class="note-to-readers">

## Note to readers

International merchandise trade data are compiled on a balance of payments basis, which adjusts customs-based data for coverage, timing, and valuation to conform to concepts used in the Canadian System of National Accounts.

Data are seasonally adjusted to account for regular seasonal patterns in trade flows. All values are expressed in Canadian dollars.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch merchandise trade data
trade <- get_cansim("12-10-0011")

# Filter for Canada, seasonally adjusted, balance of payments, all countries
canada_trade <- trade %>%
  filter(GEO == "Canada",
         `Seasonal adjustment` == "Seasonally adjusted",
         Basis == "Balance of payments",
         `Principal trading partners` == "All countries")

# Get exports, imports, and balance
exports <- canada_trade %>% filter(Trade == "Export") %>% select(REF_DATE, VALUE)
imports <- canada_trade %>% filter(Trade == "Import") %>% select(REF_DATE, VALUE)
balance <- canada_trade %>% filter(Trade == "Trade Balance") %>% select(REF_DATE, VALUE)

# Calculate changes
current_exp <- exports %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
previous_exp <- exports %>% filter(REF_DATE == "2025-09") %>% pull(VALUE)
mom_change_exp <- (current_exp - previous_exp) / previous_exp * 100
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 12-10-0011](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1210001101)
**Survey:** International Merchandise Trade
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/1210001101-eng](https://doi.org/10.25318/1210001101-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "merchandise-trade-october-2025", "en"));
```
