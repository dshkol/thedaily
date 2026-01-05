---
title: Real GDP up 0.2% in September 2025
toc: false
---

# Real GDP up 0.2% in September 2025

<p class="release-date">Released: November 29, 2025</p>

<div class="highlights">

- Real gross domestic product increased 0.2% in September 2025
- Year over year, real GDP was up 1.1% compared with September 2024
- The services-producing sector drove most of the gain

</div>

Real gross domestic product (GDP) rose 0.2% in September 2025, following a decline of 0.1% in August. Year over year, real GDP was up 1.1% compared with September 2024.

The monthly increase was driven by growth in the services-producing industries, while goods-producing industries were relatively flat.

## GDP trend

Real GDP has shown modest growth through 2025, with the economy expanding gradually from $2,317 billion in October 2024 to $2,334 billion in September 2025.

```js
import * as Plot from "npm:@observablehq/plot";

// Data from Statistics Canada Table 36-10-0434 (billions of chained 2017 dollars)
const gdpData = [
  {date: new Date("2023-10"), value: 2253.5},
  {date: new Date("2023-11"), value: 2259.5},
  {date: new Date("2023-12"), value: 2256.7},
  {date: new Date("2024-01"), value: 2262.8},
  {date: new Date("2024-02"), value: 2276.5},
  {date: new Date("2024-03"), value: 2277.5},
  {date: new Date("2024-04"), value: 2285.6},
  {date: new Date("2024-05"), value: 2289.0},
  {date: new Date("2024-06"), value: 2294.1},
  {date: new Date("2024-07"), value: 2298.6},
  {date: new Date("2024-08"), value: 2301.3},
  {date: new Date("2024-09"), value: 2307.5},
  {date: new Date("2024-10"), value: 2317.1},
  {date: new Date("2024-11"), value: 2312.3},
  {date: new Date("2024-12"), value: 2317.0},
  {date: new Date("2025-01"), value: 2327.2},
  {date: new Date("2025-02"), value: 2322.4},
  {date: new Date("2025-03"), value: 2324.4},
  {date: new Date("2025-04"), value: 2320.9},
  {date: new Date("2025-05"), value: 2317.7},
  {date: new Date("2025-06"), value: 2317.1},
  {date: new Date("2025-07"), value: 2329.4},
  {date: new Date("2025-08"), value: 2328.1},
  {date: new Date("2025-09"), value: 2333.7}
];

display(Plot.plot({
  title: "Real GDP, October 2023 to September 2025 (billions of chained 2017 dollars)",
  width: 680,
  height: 300,
  y: {domain: [2240, 2350], grid: true, label: "Billions $ (2017 chained)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(gdpData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(gdpData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(gdpData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(0) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Monthly change in 2025

GDP growth in 2025 has been uneven, with gains in several months offset by declines in others.

```js
const momData = [
  {month: "Jan", change: 0.4},
  {month: "Feb", change: -0.2},
  {month: "Mar", change: 0.1},
  {month: "Apr", change: -0.2},
  {month: "May", change: -0.1},
  {month: "Jun", change: 0.0},
  {month: "Jul", change: 0.5},
  {month: "Aug", change: -0.1},
  {month: "Sep", change: 0.2}
];

display(Plot.plot({
  title: "Monthly change in real GDP, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"]
  },
  y: {grid: true, label: "Percent change", domain: [-0.5, 0.7]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(momData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(momData, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.05 : d.change - 0.05,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      fontSize: 10
    })
  ]
}));
```

## Summary table

| Indicator | September 2025 | Change from August | Change from September 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| Real GDP ($ billions) | 2,333.7 | +0.2% | +1.1% |

<div class="note-to-readers">

**Note to readers**

Real GDP by industry is measured at basic prices in chained 2017 dollars. The estimates are seasonally adjusted.

This is a backfill article covering September 2025 data, published as part of the D-AI-LY's historical coverage initiative.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch GDP by industry data
gdp <- get_cansim("36-10-0434")

# Total GDP
total_gdp <- gdp %>%
  filter(GEO == "Canada",
         `North American Industry Classification System (NAICS)` == "All industries [T001]",
         `Seasonal adjustment` == "Seasonally adjusted at annual rates") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# By industry sector
by_sector <- gdp %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-09",
         `Seasonal adjustment` == "Seasonally adjusted at annual rates") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 36-10-0434](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3610043401)
**Survey:** Monthly Gross Domestic Product by Industry
**Reference period:** September 2025
**DOI:** [https://doi.org/10.25318/3610043401-eng](https://doi.org/10.25318/3610043401-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "gdp-september-2025", "en"));
```
