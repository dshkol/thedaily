---
title: Raw materials prices up 5.8% year over year in October 2025
toc: false
---

# Raw materials prices up 5.8% year over year in October 2025

<p class="release-date">Released: December 28, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- The Raw Materials Price Index (RMPI) rose 1.6% in October 2025
- Year over year, raw materials prices increased 5.8%
- The index reached 148.4 (2020=100), the highest level since April 2024
- This marked the second consecutive monthly increase after declines in August

</div>

The Raw Materials Price Index (RMPI) rose 1.6% in October 2025, bringing the index to 148.4 (2020=100). This follows a 1.7% increase in September. Year over year, raw materials prices were up 5.8% compared with October 2024.

The monthly increase reflected strengthening commodity prices, particularly in metal ores and non-energy raw materials.

```js
import * as Plot from "npm:@observablehq/plot";

const rmpiData = [
  {date: new Date("2023-12"), value: 130.2},
  {date: new Date("2024-01"), value: 131.7},
  {date: new Date("2024-02"), value: 134.4},
  {date: new Date("2024-03"), value: 140.0},
  {date: new Date("2024-04"), value: 147.2},
  {date: new Date("2024-05"), value: 144.9},
  {date: new Date("2024-06"), value: 142.6},
  {date: new Date("2024-07"), value: 143.6},
  {date: new Date("2024-08"), value: 139.4},
  {date: new Date("2024-09"), value: 134.8},
  {date: new Date("2024-10"), value: 140.2},
  {date: new Date("2024-11"), value: 139.8},
  {date: new Date("2024-12"), value: 141.4},
  {date: new Date("2025-01"), value: 146.6},
  {date: new Date("2025-02"), value: 147.3},
  {date: new Date("2025-03"), value: 146.2},
  {date: new Date("2025-04"), value: 141.2},
  {date: new Date("2025-05"), value: 140.2},
  {date: new Date("2025-06"), value: 144.4},
  {date: new Date("2025-07"), value: 144.7},
  {date: new Date("2025-08"), value: 143.6},
  {date: new Date("2025-09"), value: 146.1},
  {date: new Date("2025-10"), value: 148.4}
];

display(Plot.plot({
  title: "Raw Materials Price Index, December 2023 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [125, 155], grid: true, label: "Index (2020=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(rmpiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(rmpiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(rmpiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Monthly changes in 2025

Raw materials prices have shown volatility throughout 2025. After declining in the spring months, the index began rising in June and has gained momentum through October.

```js
const monthlyData = [
  {month: "Jan.", value: 146.6, change: 3.7},
  {month: "Feb.", value: 147.3, change: 0.5},
  {month: "Mar.", value: 146.2, change: -0.7},
  {month: "Apr.", value: 141.2, change: -3.4},
  {month: "May", value: 140.2, change: -0.7},
  {month: "Jun.", value: 144.4, change: 3.0},
  {month: "Jul.", value: 144.7, change: 0.2},
  {month: "Aug.", value: 143.6, change: -0.8},
  {month: "Sep.", value: 146.1, change: 1.7},
  {month: "Oct.", value: 148.4, change: 1.6}
];

display(Plot.plot({
  title: "Month-over-month change in RMPI, 2025 (%)",
  width: 640,
  height: 260,
  x: {label: null, padding: 0.3, domain: ["Jan.", "Feb.", "Mar.", "Apr.", "May", "Jun.", "Jul.", "Aug.", "Sep.", "Oct."]},
  y: {grid: true, label: "Percent change", domain: [-5, 5]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(monthlyData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(monthlyData, {
      x: "month",
      y: "change",
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      dy: d => d.change >= 0 ? -8 : 8,
      fontSize: 10
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

The Raw Materials Price Index (RMPI) measures the prices paid by Canadian manufacturers for key raw materials. It reflects price pressures at the earliest stage of the manufacturing supply chain, before processing into finished goods.

The RMPI differs from the Industrial Product Price Index (IPPI), which measures prices that producers receive for goods sold at the factory gate. Changes in raw materials prices may take time to affect industrial product prices and ultimately consumer prices.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch raw materials price index
rmpi <- get_cansim("18-10-0034")

# Total RMPI
total_rmpi <- rmpi %>%
  filter(`Raw materials price index (RMPI)` == "Total, Raw materials price index (RMPI)") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0268](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810026801)
**Survey:** Raw Materials Price Index
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/1810026801-eng](https://doi.org/10.25318/1810026801-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "raw-materials-prices-october-2025", "en"));
```
