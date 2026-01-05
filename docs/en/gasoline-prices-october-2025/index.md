---
title: Gasoline prices down 4.9% in October 2025
toc: false
---

# Gasoline prices down 4.9% in October 2025

<p class="release-date">Released: December 28, 2025 <span class="article-type-tag backfill">Historical</span></p>

<div class="highlights">

**Highlights**

- Average gasoline prices fell 4.9% to 137.2 cents per litre in October 2025
- Year-over-year, gasoline prices were down 9.5% compared with October 2024
- This marked the lowest price since April 2025 (139.2 cents)
- Prices were below year-ago levels for the seventh consecutive month

</div>

The national average price for regular unleaded gasoline at self-service stations fell 4.9% to 137.2 cents per litre in October 2025, following a 1.8% increase in September. On a year-over-year basis, gasoline prices were down 9.5% compared with October 2024.

The decline brought prices to their lowest level since April 2025, reflecting weaker global crude oil prices and ample refinery capacity.

```js
import * as Plot from "npm:@observablehq/plot";

// Data from Statistics Canada Table 18-10-0001
// Regular unleaded gasoline at self-service (cents/litre)
const gasData = [
  {date: new Date("2023-10"), value: 157.4},
  {date: new Date("2023-11"), value: 152.2},
  {date: new Date("2023-12"), value: 145.4},
  {date: new Date("2024-01"), value: 144.1},
  {date: new Date("2024-02"), value: 149.9},
  {date: new Date("2024-03"), value: 157.3},
  {date: new Date("2024-04"), value: 169.8},
  {date: new Date("2024-05"), value: 167.6},
  {date: new Date("2024-06"), value: 162.4},
  {date: new Date("2024-07"), value: 166.5},
  {date: new Date("2024-08"), value: 162.1},
  {date: new Date("2024-09"), value: 150.3},
  {date: new Date("2024-10"), value: 151.6},
  {date: new Date("2024-11"), value: 151.4},
  {date: new Date("2024-12"), value: 150.5},
  {date: new Date("2025-01"), value: 156.7},
  {date: new Date("2025-02"), value: 157.7},
  {date: new Date("2025-03"), value: 154.8},
  {date: new Date("2025-04"), value: 139.2},
  {date: new Date("2025-05"), value: 141.7},
  {date: new Date("2025-06"), value: 140.7},
  {date: new Date("2025-07"), value: 139.6},
  {date: new Date("2025-08"), value: 141.6},
  {date: new Date("2025-09"), value: 144.2},
  {date: new Date("2025-10"), value: 137.2}
];

display(Plot.plot({
  title: "Regular unleaded gasoline prices, October 2023 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [120, 180], grid: true, label: "Cents per litre"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(gasData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(gasData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(gasData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1) + "¢", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Monthly price changes

Gasoline prices have shown significant volatility throughout 2025, with a sharp drop in April that brought prices below 140 cents per litre for the first time since early 2022.

The October decline followed a brief uptick in September, returning prices to near the April low.

```js
const monthlyData = [
  {month: "Jan", value: 156.7, change: 4.1},
  {month: "Feb", value: 157.7, change: 0.6},
  {month: "Mar", value: 154.8, change: -1.8},
  {month: "Apr", value: 139.2, change: -10.1},
  {month: "May", value: 141.7, change: 1.8},
  {month: "Jun", value: 140.7, change: -0.7},
  {month: "Jul", value: 139.6, change: -0.8},
  {month: "Aug", value: 141.6, change: 1.4},
  {month: "Sep", value: 144.2, change: 1.8},
  {month: "Oct", value: 137.2, change: -4.9}
];

display(Plot.plot({
  title: "Monthly price change in 2025 (%)",
  width: 640,
  height: 260,
  x: {label: null, padding: 0.3, domain: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"]},
  y: {grid: true, label: "Percent change", domain: [-12, 6]},
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

## Year-over-year comparison

October 2025 prices were 9.5% lower than October 2024, when prices averaged 151.6 cents per litre. This marked the seventh consecutive month with prices below year-ago levels.

The sustained year-over-year declines reflected lower global crude oil prices compared with the elevated levels seen in 2024.

<div class="note-to-readers">

## Note to readers

Retail gasoline prices are collected for 14 urban centres across Canada. Prices represent monthly averages for regular unleaded gasoline at self-service filling stations.

Gasoline prices are influenced by global crude oil prices, refinery operations, seasonal demand, taxes, and local market conditions.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch gasoline prices data
gas <- get_cansim("18-10-0001")

# National average gasoline price
national <- gas %>%
  filter(GEO == "Canada",
         `Type of fuel` == "Regular unleaded gasoline at self service filling stations") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0001](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810000101)
**Survey:** Monthly Average Retail Prices for Gasoline and Fuel Oil
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/1810000101-eng](https://doi.org/10.25318/1810000101-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "gasoline-prices-october-2025", "en"));
```
