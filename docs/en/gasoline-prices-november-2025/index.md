---
title: Gasoline prices up 1.7% in November 2025
toc: false
---

# Gasoline prices up 1.7% in November 2025

<p class="release-date">Released: December 15, 2025</p>

<div class="highlights">

**Highlights**

- Average gasoline prices rose 1.7% to 139.6 cents per litre in November 2025
- On a year-over-year basis, gasoline prices were down 7.8%
- Vancouver recorded the highest prices at 162.0 cents per litre
- Edmonton had the lowest prices at 123.4 cents per litre

</div>

The national average price for regular unleaded gasoline at self-service stations rose 1.7% to 139.6 cents per litre in November 2025, following a decline of 4.9% in October. On a year-over-year basis, gasoline prices were down 7.8% compared with November 2024.

The monthly increase came amid refinery disruptions across North America. Prices remained below year-ago levels due to lower global crude oil prices compared with 2024.

```js
import * as Plot from "npm:@observablehq/plot";

// Data from Statistics Canada Table 18-10-0001
// Regular unleaded gasoline at self-service (cents/litre)
const gasData = [
  {date: new Date("2023-01"), value: 150.3},
  {date: new Date("2023-02"), value: 148.5},
  {date: new Date("2023-03"), value: 150.3},
  {date: new Date("2023-04"), value: 160.1},
  {date: new Date("2023-05"), value: 158.8},
  {date: new Date("2023-06"), value: 161.6},
  {date: new Date("2023-07"), value: 163.1},
  {date: new Date("2023-08"), value: 170.6},
  {date: new Date("2023-09"), value: 168.3},
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
  {date: new Date("2025-10"), value: 137.2},
  {date: new Date("2025-11"), value: 139.6}
];

display(Plot.plot({
  title: "Regular unleaded gasoline prices (cents per litre)",
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

## Regional variation

Gasoline prices continued to vary significantly across the country in November. Vancouver recorded the highest prices at 162.0 cents per litre, while Edmonton had the lowest at 123.4 cents per litre.

British Columbia cities generally had the highest prices, reflecting the province's carbon tax and other fuel taxes. Prairie cities continued to have the lowest prices nationwide.

```js
const cityData = [
  {city: "Vancouver, BC", price: 162.0},
  {city: "Victoria, BC", price: 160.0},
  {city: "Montréal, QC", price: 156.0},
  {city: "St. John's, NL", price: 153.0},
  {city: "Québec, QC", price: 150.0},
  {city: "Whitehorse, YT", price: 150.0},
  {city: "Saint John, NB", price: 149.0},
  {city: "Charlottetown, PE", price: 147.0},
  {city: "Halifax, NS", price: 143.0},
  {city: "Canada average", price: 139.6},
  {city: "Toronto, ON", price: 137.0},
  {city: "Ottawa, ON", price: 136.0},
  {city: "Winnipeg, MB", price: 131.0},
  {city: "Regina, SK", price: 129.0},
  {city: "Calgary, AB", price: 127.0},
  {city: "Edmonton, AB", price: 123.4}
];

display(Plot.plot({
  title: "Gasoline prices by city, November 2025 (cents per litre)",
  width: 600,
  height: 400,
  marginLeft: 140,
  x: {grid: true, label: "Cents per litre", domain: [110, 170]},
  y: {label: null},
  marks: [
    Plot.barX(cityData, {
      y: "city",
      x: "price",
      fill: d => d.city === "Canada average" ? "#1f77b4" : "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(cityData, {
      y: "city",
      x: "price",
      text: d => d.price.toFixed(1) + "¢",
      dx: 25,
      fill: "currentColor"
    })
  ]
}));
```

## Year-over-year comparison

Gasoline prices in November 2025 were 7.8% lower than November 2024, when prices averaged 151.4 cents per litre. The year-over-year decline reflected lower global crude oil prices compared with 2024.

Prices peaked in 2024 at 169.8 cents per litre in April and have generally trended lower since then, with a notable drop in April 2025 that brought prices below 140 cents per litre for the first time since early 2022.

<div class="note-to-readers">

## Note to readers

Retail gasoline prices are collected for 14 urban centres across Canada. Prices represent monthly averages for regular unleaded gasoline at self-service filling stations.

Gasoline prices are influenced by global crude oil prices, refinery operations, seasonal demand, taxes, and local market conditions. Prices can vary significantly between provinces due to differences in provincial fuel taxes and carbon pricing.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0001](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810000101)
**Survey:** Monthly Average Retail Prices for Gasoline and Fuel Oil
**Reference period:** November 2025
**DOI:** [https://doi.org/10.25318/1810000101-eng](https://doi.org/10.25318/1810000101-eng)

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch gasoline price data
gas <- get_cansim("18-10-0001") %>%
  filter(`Type of fuel` == "Regular unleaded gasoline at self service filling stations")

# National average time series
national <- gas %>%
  filter(GEO == "Canada") %>%
  filter(REF_DATE >= "2023-01") %>%
  select(REF_DATE, VALUE) %>%
  arrange(REF_DATE)

# City prices for latest month
cities <- gas %>%
  filter(REF_DATE == "2025-11") %>%
  filter(GEO != "Canada") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))

# Calculate changes
nov2025 <- national %>% filter(REF_DATE == "2025-11") %>% pull(VALUE)
oct2025 <- national %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
nov2024 <- national %>% filter(REF_DATE == "2024-11") %>% pull(VALUE)

mom_change <- (nov2025 - oct2025) / oct2025 * 100
yoy_change <- (nov2025 - nov2024) / nov2024 * 100
```

</details>
