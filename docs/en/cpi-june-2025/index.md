---
title: Consumer prices up 1.9% year over year in June 2025
toc: false
---

# Consumer prices up 1.9% year over year in June 2025

<p class="release-date">Released: July 16, 2025</p>

<div class="highlights">

- The Consumer Price Index rose 1.9% year over year in June 2025
- Inflation edged up from 1.7% in May
- Food prices increased 3.8% year over year
- Shelter costs rose 4.1%

</div>

The Consumer Price Index (CPI) rose 1.9% in June 2025 compared with the same month a year earlier, up from 1.7% in both April and May. The slight acceleration in inflation reflected higher prices for shelter and food.

On a monthly basis, prices increased 0.2% from May 2025.

## Year-over-year inflation trend

Annual inflation has remained near the Bank of Canada's 2% target through the first half of 2025, fluctuating in a narrow range between 1.7% and 2.6%.

```js
import * as Plot from "npm:@observablehq/plot";

const inflationData = [
  {date: new Date("2024-06"), rate: 2.7},
  {date: new Date("2024-07"), rate: 2.5},
  {date: new Date("2024-08"), rate: 2.0},
  {date: new Date("2024-09"), rate: 1.6},
  {date: new Date("2024-10"), rate: 2.0},
  {date: new Date("2024-11"), rate: 1.9},
  {date: new Date("2024-12"), rate: 1.8},
  {date: new Date("2025-01"), rate: 1.9},
  {date: new Date("2025-02"), rate: 2.6},
  {date: new Date("2025-03"), rate: 2.3},
  {date: new Date("2025-04"), rate: 1.7},
  {date: new Date("2025-05"), rate: 1.7},
  {date: new Date("2025-06"), rate: 1.9}
];

display(Plot.plot({
  title: "Year-over-year inflation rate (%)",
  width: 640,
  height: 280,
  y: {domain: [0, 4], grid: true, label: "Percent"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.ruleY([2], {stroke: "#999", strokeDasharray: "4,4"}),
    Plot.lineY(inflationData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(inflationData.slice(-1), {x: "date", y: "rate", fill: "#AF3C43", r: 5}),
    Plot.text(inflationData.slice(-1), {x: "date", y: "rate", text: d => d.rate.toFixed(1) + "%", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Prices by major component

Among the eight major components of the CPI, shelter showed the largest year-over-year increase at 4.1%, followed by food at 3.8%.

```js
const components = [
  {name: "Shelter", change: 4.1},
  {name: "Food", change: 3.8},
  {name: "Health and personal care", change: 2.9},
  {name: "Household operations", change: 2.5},
  {name: "Alcoholic beverages and tobacco", change: 2.0},
  {name: "Recreation and education", change: 0.8},
  {name: "Clothing and footwear", change: 0.5},
  {name: "Transportation", change: -0.3}
];

display(Plot.plot({
  title: "Year-over-year change by component (%)",
  width: 640,
  height: 320,
  marginLeft: 180,
  x: {domain: [-1, 5], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(components, {
      y: "name",
      x: "change",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(components, {
      y: "name",
      x: "change",
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      dx: d => d.change >= 0 ? 20 : -20,
      fill: "currentColor"
    })
  ]
}));
```

## Summary table

| Indicator | June 2025 | Change from May | Change from June 2024 |
|-----------|----------:|----------------:|----------------------:|
| All-items CPI (YoY) | +1.9% | +0.2 pp | -0.8 pp |
| Food | +3.8% | — | — |
| Shelter | +4.1% | — | — |
| Transportation | -0.3% | — | — |

<div class="note-to-readers">

**Note to readers**

The Consumer Price Index measures the rate of price change experienced by Canadian consumers. It is calculated by comparing the cost of a fixed basket of goods and services purchased by consumers over time.

The CPI is not seasonally adjusted. Month-to-month movements can reflect seasonal patterns in addition to underlying price trends.

This is a backfill article covering June 2025 data, published as part of the D-AI-LY's historical coverage initiative.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch CPI data
cpi <- get_cansim("18-10-0004")

# National all-items CPI time series
national_cpi <- cpi %>%
  filter(GEO == "Canada",
         `Products and product groups` == "All-items") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Year-over-year change calculation
current <- national_cpi %>% filter(REF_DATE == "2025-06") %>% pull(VALUE)
previous <- national_cpi %>% filter(REF_DATE == "2024-06") %>% pull(VALUE)
yoy_change <- (current - previous) / previous * 100

# Component breakdown
components <- cpi %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-06") %>%
  select(`Products and product groups`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial variation
provincial <- cpi %>%
  filter(`Products and product groups` == "All-items",
         REF_DATE %in% c("2025-06", "2024-06"),
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2025-06` - `2024-06`) / `2024-06` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0004](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810000401)
**Survey:** Consumer Price Index
**Reference period:** June 2025
**DOI:** [https://doi.org/10.25318/1810000401-eng](https://doi.org/10.25318/1810000401-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "cpi-june-2025", "en"));
```
