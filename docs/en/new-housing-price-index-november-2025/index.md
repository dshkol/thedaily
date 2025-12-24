---
title: New housing prices unchanged in November 2025
toc: false
---

# New housing prices unchanged in November 2025

<p class="release-date">Released: December 19, 2025</p>

<div class="highlights">

**Highlights**

- The New Housing Price Index was unchanged (0.0%) in November 2025
- On a year-over-year basis, new housing prices were down 1.9%
- House prices declined while land prices stabilized
- Saskatchewan led provincial gains with a 0.5% increase

</div>

The New Housing Price Index (NHPI) was unchanged (0.0%) in November 2025, following a decline of 0.4% in October. On a year-over-year basis, new housing prices were down 1.9% compared with November 2024.

The national index value stood at 122.2 (2017=100), continuing a gradual decline that began in April 2025. House prices (excluding land) were down 0.1% month-over-month, while land prices were unchanged.

```js
import * as Plot from "npm:@observablehq/plot";

// Data from Statistics Canada Table 18-10-0205
// New Housing Price Index, Total (house and land), 2017=100
const nhpiData = [
  {date: new Date("2023-01"), value: 125.2},
  {date: new Date("2023-02"), value: 124.9},
  {date: new Date("2023-03"), value: 124.9},
  {date: new Date("2023-04"), value: 124.8},
  {date: new Date("2023-05"), value: 124.9},
  {date: new Date("2023-06"), value: 125.0},
  {date: new Date("2023-07"), value: 124.9},
  {date: new Date("2023-08"), value: 125.0},
  {date: new Date("2023-09"), value: 124.7},
  {date: new Date("2023-10"), value: 124.7},
  {date: new Date("2023-11"), value: 124.4},
  {date: new Date("2023-12"), value: 124.4},
  {date: new Date("2024-01"), value: 124.3},
  {date: new Date("2024-02"), value: 124.4},
  {date: new Date("2024-03"), value: 124.4},
  {date: new Date("2024-04"), value: 124.7},
  {date: new Date("2024-05"), value: 124.9},
  {date: new Date("2024-06"), value: 124.7},
  {date: new Date("2024-07"), value: 125.0},
  {date: new Date("2024-08"), value: 125.0},
  {date: new Date("2024-09"), value: 125.0},
  {date: new Date("2024-10"), value: 124.5},
  {date: new Date("2024-11"), value: 124.6},
  {date: new Date("2024-12"), value: 124.5},
  {date: new Date("2025-01"), value: 124.4},
  {date: new Date("2025-02"), value: 124.5},
  {date: new Date("2025-03"), value: 124.5},
  {date: new Date("2025-04"), value: 124.0},
  {date: new Date("2025-05"), value: 123.7},
  {date: new Date("2025-06"), value: 123.4},
  {date: new Date("2025-07"), value: 123.3},
  {date: new Date("2025-08"), value: 122.9},
  {date: new Date("2025-09"), value: 122.7},
  {date: new Date("2025-10"), value: 122.2},
  {date: new Date("2025-11"), value: 122.2}
];

display(Plot.plot({
  title: "New Housing Price Index (2017=100)",
  width: 680,
  height: 300,
  y: {domain: [120, 128], grid: true, label: "Index (2017=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(nhpiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(nhpiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(nhpiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## House versus land prices

The house-only component of the index (excluding land) declined 0.1% in November, while the land-only component was unchanged. On a year-over-year basis, house prices were down 1.7% and land prices were down 2.5%.

```js
const componentData = [
  {component: "Total (house and land)", index: 122.2, yoyChange: -1.9},
  {component: "House only", index: 124.0, yoyChange: -1.7},
  {component: "Land only", index: 117.2, yoyChange: -2.5}
];

display(Plot.plot({
  title: "New Housing Price Index components, November 2025",
  width: 500,
  height: 200,
  marginLeft: 160,
  x: {domain: [110, 130], grid: true, label: "Index (2017=100)"},
  y: {label: null},
  marks: [
    Plot.barX(componentData, {
      y: "component",
      x: "index",
      fill: "#AF3C43"
    }),
    Plot.text(componentData, {
      y: "component",
      x: "index",
      text: d => d.index.toFixed(1),
      dx: 20,
      fill: "currentColor"
    })
  ]
}));
```

## Provincial variation

Saskatchewan led provincial gains with a 0.5% increase in November, followed by Manitoba and Alberta at 0.3% each. Ontario and British Columbia experienced slight declines of 0.1% and 0.2% respectively.

Quebec continued to have the highest provincial index at 148.7, reflecting stronger price growth over the past decade compared with other provinces.

| Province | Index (2017=100) | Monthly change |
|----------|-----------------|----------------|
| Quebec | 148.7 | +0.1% |
| Manitoba | 145.0 | +0.3% |
| Nova Scotia | 128.1 | 0.0% |
| British Columbia | 125.0 | -0.2% |
| Prince Edward Island | 124.4 | 0.0% |
| Canada | 122.2 | 0.0% |
| New Brunswick | 120.9 | 0.0% |
| Ontario | 119.5 | -0.1% |
| Alberta | 118.7 | +0.3% |
| Saskatchewan | 109.8 | +0.5% |
| Newfoundland and Labrador | 109.5 | 0.0% |

<div class="note-to-readers">

## Note to readers

The New Housing Price Index measures changes over time in contractors' selling prices of new residential houses where detailed specifications remain unchanged between two consecutive periods. The index covers new single homes, semi-detached homes, and townhomes.

The index uses a 2017 base year (2017=100). Values above 100 indicate price levels higher than in 2017.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0205](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810020501)
**Survey:** New Housing Price Index
**Reference period:** November 2025
**DOI:** [https://doi.org/10.25318/1810020501-eng](https://doi.org/10.25318/1810020501-eng)

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch New Housing Price Index data
nhpi <- get_cansim("18-10-0205")

# National total (house and land) time series
national <- nhpi %>%
  filter(GEO == "Canada") %>%
  filter(`New housing price indexes` == "Total (house and land)") %>%
  filter(REF_DATE >= "2023-01") %>%
  select(REF_DATE, VALUE) %>%
  arrange(REF_DATE)

# Components for latest month
components <- nhpi %>%
  filter(GEO == "Canada") %>%
  filter(REF_DATE == "2025-11") %>%
  filter(`New housing price indexes` %in% c(
    "Total (house and land)", "House only", "Land only"
  )) %>%
  select(`New housing price indexes`, VALUE)

# Provincial breakdown
provinces <- nhpi %>%
  filter(`New housing price indexes` == "Total (house and land)") %>%
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
