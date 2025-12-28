---
title: Industrial product prices up 6.1% year over year in November 2025
toc: false
---

# Industrial product prices up 6.1% year over year in November 2025

<p class="release-date">Released: December 28, 2025</p>

<div class="highlights">

**Highlights**

- The Industrial Product Price Index (IPPI) rose 0.9% in November 2025, following a 1.6% increase in October
- Year over year, industrial product prices increased 6.1%
- Primary non-ferrous metal products led the annual increase at 33.8%
- Energy and petroleum products rose 4.3% month over month, the largest monthly gain

</div>

The Industrial Product Price Index (IPPI) rose 0.9% in November 2025, bringing the index to 135.6 (2020=100). This follows a 1.6% increase in October. Year over year, industrial product prices were up 6.1% compared with November 2024.

The monthly increase was primarily driven by energy and petroleum products, which rose 4.3%. Fruit, vegetables, feed and other food products increased 1.3%, while pulp and paper products and electrical products both rose 1.0%.

Partially offsetting these gains, chemicals and chemical products declined 0.6%, and beverages fell 0.2%.

```js
import * as Plot from "npm:@observablehq/plot";

// Data from Statistics Canada Table 18-10-0265
// Total Industrial Product Price Index (2020=100)
const ippiData = [
  {date: new Date("2023-11"), value: 124.8},
  {date: new Date("2023-12"), value: 123.0},
  {date: new Date("2024-01"), value: 123.0},
  {date: new Date("2024-02"), value: 125.0},
  {date: new Date("2024-03"), value: 126.0},
  {date: new Date("2024-04"), value: 128.0},
  {date: new Date("2024-05"), value: 128.0},
  {date: new Date("2024-06"), value: 128.0},
  {date: new Date("2024-07"), value: 128.0},
  {date: new Date("2024-08"), value: 127.0},
  {date: new Date("2024-09"), value: 126.0},
  {date: new Date("2024-10"), value: 127.0},
  {date: new Date("2024-11"), value: 127.8},
  {date: new Date("2024-12"), value: 128.0},
  {date: new Date("2025-01"), value: 130.0},
  {date: new Date("2025-02"), value: 131.0},
  {date: new Date("2025-03"), value: 131.0},
  {date: new Date("2025-04"), value: 130.0},
  {date: new Date("2025-05"), value: 129.0},
  {date: new Date("2025-06"), value: 130.0},
  {date: new Date("2025-07"), value: 130.0},
  {date: new Date("2025-08"), value: 131.0},
  {date: new Date("2025-09"), value: 132.0},
  {date: new Date("2025-10"), value: 134.4},
  {date: new Date("2025-11"), value: 135.6}
];

display(Plot.plot({
  title: "Industrial Product Price Index, November 2023 to November 2025",
  width: 680,
  height: 300,
  y: {domain: [118, 140], grid: true, label: "↑ Index (2020=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(ippiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(ippiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(ippiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Year-over-year changes by major product group

Primary non-ferrous metal products recorded the largest year-over-year increase at 33.8%, driven by higher prices for copper, aluminum, and other base metals. Meat, fish and dairy products rose 14.0%, while fabricated metal products and construction materials increased 6.6%.

Five product groups recorded year-over-year declines. Furniture and fixtures fell 4.8%, lumber and other wood products declined 4.0%, and primary ferrous metal products decreased 2.2%.

```js
const yoyData = [
  {product: "Primary non-ferrous metal products", change: 33.8},
  {product: "Meat, fish and dairy products", change: 14.0},
  {product: "Fabricated metal products", change: 6.6},
  {product: "Fruit, vegetables, feed and food", change: 6.5},
  {product: "Cement, glass, minerals", change: 5.0},
  {product: "Packaging materials", change: 4.9},
  {product: "Energy and petroleum products", change: 4.5},
  {product: "Electrical and telecom products", change: 4.0},
  {product: "Beverages", change: 3.2},
  {product: "Pulp and paper products", change: 2.9},
  {product: "Tobacco products", change: -0.8},
  {product: "Chemicals and chemical products", change: -1.5},
  {product: "Primary ferrous metal products", change: -2.2},
  {product: "Lumber and wood products", change: -4.0},
  {product: "Furniture and fixtures", change: -4.8}
];

display(Plot.plot({
  title: "Year-over-year change by major product group (%)",
  width: 700,
  height: 400,
  marginLeft: 210,
  marginRight: 60,
  x: {domain: [-10, 40], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "product",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
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

Energy and petroleum products led the monthly gains in November, rising 4.3% following a decline of 3.6% in October. Fruit, vegetables, feed and other food products increased 1.3%, while pulp and paper products and electrical products both rose 1.0%.

Primary non-ferrous metal products, which recorded the largest annual increase, rose 0.8% in November after a 0.7% gain in October.

| Product group | November 2025 index | MoM change (%) | YoY change (%) |
|--------------|--------------------:|---------------:|---------------:|
| Total IPPI | 135.6 | +0.9 | +6.1 |
| Primary non-ferrous metals | 221.2 | +0.8 | +33.8 |
| Meat, fish and dairy | 135.6 | +0.4 | +14.0 |
| Energy and petroleum | 131.2 | +4.3 | +4.5 |
| Fabricated metals | 148.5 | +0.7 | +6.6 |
| Lumber and wood | 129.5 | +0.2 | -4.0 |
| Furniture and fixtures | 110.1 | +0.5 | -4.8 |

<div class="note-to-readers">

## Note to readers

The Industrial Product Price Index (IPPI) measures the prices that producers receive for goods sold at the factory gate. It reflects price pressures in the manufacturing sector before they reach consumers.

The IPPI basket was updated in September 2024 to reflect 2019 production values and the North American Product Classification System (NAPCS) 2022 Version 1.0. The new basket was linked to the previous basket at the July 2024 reference period.

The IPPI differs from the Consumer Price Index (CPI), which measures prices paid by consumers. Changes in industrial product prices may take time to affect consumer prices as goods move through the supply chain.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0265](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810026501)
**Survey:** Industrial Product Price Index
**Reference period:** November 2025
**DOI:** [https://doi.org/10.25318/1810026501-eng](https://doi.org/10.25318/1810026501-eng)

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch IPPI data
conn <- get_cansim_connection("18-10-0265")

# Total IPPI time series
total <- conn |>
  filter(`North American Product Classification System (NAPCS)` ==
         "Total, Industrial product price index (IPPI)") |>
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
nov2025 <- 135.6
oct2025 <- 134.4
nov2024 <- 127.8

mom_change <- (nov2025 - oct2025) / oct2025 * 100  # 0.89%
yoy_change <- (nov2025 - nov2024) / nov2024 * 100  # 6.1%
```

</details>
