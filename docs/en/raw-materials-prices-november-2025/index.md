---
title: Raw materials prices up 6.4% year over year in November 2025
verification_json: output/data_18_10_0268_enhanced.json
toc: false
---
# Raw materials prices up 6.4% year over year in November 2025

<p class="release-date">Released: December 28, 2025 <span class="article-type-tag release">New release</span></p>

<div class="highlights">

**Highlights**

- The Raw Materials Price Index (RMPI) rose 0.3% in November 2025, following a 1.6% increase in October
- Year over year, raw materials prices increased 6.4%
- Metal ores, concentrates and scrap led the annual increase at 34.7%
- Crude energy products fell 15.2% year over year, partially offsetting gains

</div>

The Raw Materials Price Index (RMPI) rose 0.3% in November 2025, bringing the index to 148.8 (2020=100). This follows a 1.6% increase in October. Year over year, raw materials prices were up 6.4% compared with November 2024.

Excluding crude energy products, the RMPI was up 19.0% year over year, reflecting strong gains in metal ores and non-energy commodities. On a monthly basis, the index excluding crude energy rose 0.6%.

The annual increase was primarily driven by metal ores, concentrates and scrap, which rose 34.7%. Animals and animal products increased 9.9%, while non-metallic minerals rose 9.5%.

Partially offsetting these gains, crude energy products fell 15.2% year over year, with natural gas down 8.0%.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 18-10-0268 (verified via R cansim package)
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
  {date: new Date("2025-10"), value: 148.4},
  {date: new Date("2025-11"), value: 148.8}
];

display(Plot.plot({
  title: "Raw Materials Price Index, December 2023 to November 2025",
  width: 680,
  height: 300,
  y: {domain: [125, 155], grid: true, label: "↑ Index (2020=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(rmpiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(rmpiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(rmpiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Year-over-year changes by major product group

Metal ores, concentrates and scrap recorded the largest year-over-year increase at 34.7%, driven by higher prices for copper, gold, and other metal ores. The index excluding crude energy products rose 19.0%, while animals and animal products increased 9.9%.

Non-metallic minerals rose 9.5% year over year, reflecting gains across a range of mineral products.

Crude energy products fell 15.2% year over year, with natural gas down 8.0%. Lower crude oil prices contributed to the decline in energy commodities.

```js
const yoyData = [
  {product: "Metal ores, concentrates and scrap", change: 34.7},
  {product: "Total, excluding crude energy", change: 19.0},
  {product: "Animals and animal products", change: 9.9},
  {product: "Non-metallic minerals", change: 9.5},
  {product: "Natural gas", change: -8.0},
  {product: "Crude energy products", change: -15.2}
];

display(Plot.plot({
  title: "Year-over-year change by major product group (%)",
  width: 700,
  height: 280,
  marginLeft: 220,
  marginRight: 60,
  x: {domain: [-20, 40], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "product",
      x: "change",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(yoyData, {
      y: "product",
      x: 38,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Monthly changes

Non-metallic minerals led the monthly gains in November, rising 2.4%. Natural gas increased 2.1%, while metal ores, concentrates and scrap rose 1.5%.

Animals and animal products declined 2.0% in November, following gains in previous months. Crude energy products edged down 0.5%.

| Product group | November 2025 index | MoM change (%) | YoY change (%) |
|--------------|--------------------:|---------------:|---------------:|
| Total RMPI | 148.8 | +0.3 | +6.4 |
| Total, excl. crude energy | 173.0 | +0.6 | +19.0 |
| Metal ores and scrap | 215.0 | +1.5 | +34.7 |
| Animals and animal products | 155.0 | -2.0 | +9.9 |
| Non-metallic minerals | 176.0 | +2.4 | +9.5 |
| Crude energy products | 112.0 | -0.5 | -15.2 |
| Natural gas | 64.7 | +2.1 | -8.0 |

<div class="note-to-readers">

## Note to readers

The Raw Materials Price Index (RMPI) measures the prices paid by Canadian manufacturers for key raw materials. It reflects price pressures at the earliest stage of the manufacturing supply chain, before processing into finished goods.

The RMPI differs from the Industrial Product Price Index (IPPI), which measures prices that producers receive for goods sold at the factory gate. Changes in raw materials prices may take time to affect industrial product prices and ultimately consumer prices.

Crude energy products include crude oil, natural gas, and coal. The index excluding crude energy products provides a measure of non-energy raw materials price movements.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0268](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810026801)
**Survey:** Raw Materials Price Index
**Reference period:** November 2025
**DOI:** [https://doi.org/10.25318/1810026801-eng](https://doi.org/10.25318/1810026801-eng)

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch RMPI data
conn <- get_cansim_connection("18-10-0268")

# Total RMPI time series
total <- conn |>
  filter(`North American Product Classification System (NAPCS)` ==
         "Total, Raw materials price indexes (RMPI)") |>
  collect_and_normalize() |>
  filter(REF_DATE >= "2023-11") |>
  select(REF_DATE, VALUE) |>
  arrange(REF_DATE)

# Component breakdown for November 2025
components <- conn |>
  collect_and_normalize() |>
  filter(REF_DATE == "2025-11") |>
  select(`North American Product Classification System (NAPCS)`, VALUE) |>
  arrange(desc(VALUE))

# Calculate changes
nov2025 <- 148.8
oct2025 <- 148.4
nov2024 <- 139.8

mom_change <- (nov2025 - oct2025) / oct2025 * 100  # 0.27%
yoy_change <- (nov2025 - nov2024) / nov2024 * 100  # 6.44%
```

</details>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "raw-materials-prices-november-2025", "en"));
```
