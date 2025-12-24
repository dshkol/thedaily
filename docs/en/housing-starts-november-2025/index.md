---
title: Housing starts up 9.4% in November 2025
toc: false
---

# Housing starts up 9.4% in November 2025

<p class="release-date">Released: December 16, 2025</p>

<div class="highlights">

**Highlights**

- Housing starts increased 9.4% to 254,058 units (seasonally adjusted annual rate) in November 2025
- Multi-family starts rose 14.5% to 193,800 units, driving the monthly gain
- Single-detached starts edged down 2.9% to 39,700 units
- On a year-over-year basis, actual starts in urban areas were down 3%

</div>

Housing starts increased 9.4% to a seasonally adjusted annual rate (SAAR) of 254,058 units in November 2025, rebounding from a 17% decline in October. The gain was driven by a surge in multi-family construction intentions.

Multi-family starts rose 14.5% to 193,800 units in November, while single-detached starts edged down 2.9% to 39,700 units. The six-month trend in housing starts decreased 1.7% to 264,445 units, showing signs of slowing momentum in residential construction.

```js
import * as Plot from "npm:@observablehq/plot";

// Data from Statistics Canada Table 34-10-0158 (SAAR, thousands of units)
const startsData = [
  {date: new Date("2024-01"), total: 231.3},
  {date: new Date("2024-02"), total: 260.0},
  {date: new Date("2024-03"), total: 242.2},
  {date: new Date("2024-04"), total: 242.4},
  {date: new Date("2024-05"), total: 267.5},
  {date: new Date("2024-06"), total: 241.4},
  {date: new Date("2024-07"), total: 275.9},
  {date: new Date("2024-08"), total: 213.2},
  {date: new Date("2024-09"), total: 224.0},
  {date: new Date("2024-10"), total: 244.8},
  {date: new Date("2024-11"), total: 267.3},
  {date: new Date("2024-12"), total: 236.2},
  {date: new Date("2025-01"), total: 239.1},
  {date: new Date("2025-02"), total: 229.9},
  {date: new Date("2025-03"), total: 214.1},
  {date: new Date("2025-04"), total: 262.2},
  {date: new Date("2025-05"), total: 269.9},
  {date: new Date("2025-06"), total: 262.3},
  {date: new Date("2025-07"), total: 252.1},
  {date: new Date("2025-08"), total: 217.4},
  {date: new Date("2025-09"), total: 223.7},
  {date: new Date("2025-10"), total: 232.2},
  {date: new Date("2025-11"), total: 254.1}
];

display(Plot.plot({
  title: "Housing starts (seasonally adjusted annual rate, thousands of units)",
  width: 680,
  height: 300,
  y: {domain: [200, 290], grid: true, label: "Thousands of units"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(startsData, {x: "date", y: "total", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(startsData.slice(-1), {x: "date", y: "total", fill: "#AF3C43", r: 5}),
    Plot.text(startsData.slice(-1), {x: "date", y: "total", text: d => d.total.toFixed(1) + "K", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Dwelling type breakdown

Multi-family housing starts, which include apartments, row houses, and semi-detached units, accounted for 83% of total starts in November. Apartment and other unit types led the gain, rising to 158,500 units from 134,500 units in October.

```js
const dwellingData = [
  {type: "Single-detached", nov: 39.7, oct: 40.9, change: -2.9},
  {type: "Semi-detached", nov: 11.9, oct: 11.6, change: 2.6},
  {type: "Row units", nov: 23.0, oct: 23.2, change: -0.9},
  {type: "Apartment and other", nov: 158.5, oct: 134.5, change: 17.8}
];

display(Plot.plot({
  title: "Housing starts by dwelling type, November 2025 (thousands of units)",
  width: 600,
  height: 250,
  marginLeft: 140,
  x: {grid: true, label: "Thousands of units"},
  y: {label: null},
  marks: [
    Plot.barX(dwellingData, {
      y: "type",
      x: "nov",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(dwellingData, {
      y: "type",
      x: "nov",
      text: d => d.nov.toFixed(1) + "K",
      dx: 25,
      fill: "currentColor"
    })
  ]
}));
```

## Provincial highlights

Quebec led all provinces with 63,500 units at annual rates in November, followed by Ontario with 55,100 units. Alberta recorded 53,600 units, while British Columbia reported 41,600 units.

| Province | November 2025 (SAAR, thousands) | Share of total |
|----------|--------------------------------|----------------|
| Quebec | 63.5 | 25.0% |
| Ontario | 55.1 | 21.7% |
| Alberta | 53.6 | 21.1% |
| British Columbia | 41.6 | 16.4% |
| Manitoba | 14.1 | 5.6% |
| New Brunswick | 12.5 | 4.9% |
| Nova Scotia | 7.6 | 3.0% |
| Saskatchewan | 3.4 | 1.3% |
| Newfoundland and Labrador | 2.1 | 0.8% |
| Prince Edward Island | 0.6 | 0.2% |

## Metropolitan area performance

Among major urban areas, Montreal posted a 24% year-over-year increase in actual housing starts, partially offsetting declines in Toronto (-11%) and Vancouver (-1%).

<div class="note-to-readers">

## Note to readers

Housing starts data are compiled by the Canada Mortgage and Housing Corporation (CMHC) and represent the number of new residential dwelling units on which construction has begun.

Seasonally adjusted annual rates (SAAR) are used to facilitate month-over-month comparisons by removing regular seasonal patterns. The six-month trend is a moving average that smooths monthly volatility.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 34-10-0158](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3410015801)
**Survey:** Canada Mortgage and Housing Corporation, Housing Starts
**Reference period:** November 2025
**DOI:** [https://doi.org/10.25318/3410015801-eng](https://doi.org/10.25318/3410015801-eng)

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch housing starts data (SAAR by province)
starts_saar <- get_cansim("34-10-0158") %>%
  filter(GEO == "Canada") %>%
  filter(REF_DATE >= "2024-01") %>%
  select(REF_DATE, VALUE) %>%
  arrange(REF_DATE)

# Fetch housing starts by dwelling type
starts_type <- get_cansim("34-10-0156") %>%
  filter(GEO == "Canada") %>%
  filter(`Type of dwelling` %in% c("Single", "Semi-detached", "Row", "Apartment")) %>%
  filter(REF_DATE == "2025-11") %>%
  select(`Type of dwelling`, VALUE)

# Calculate month-over-month change
nov2025 <- starts_saar %>% filter(REF_DATE == "2025-11") %>% pull(VALUE)
oct2025 <- starts_saar %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
mom_change <- (nov2025 - oct2025) / oct2025 * 100

# Calculate year-over-year change
nov2024 <- starts_saar %>% filter(REF_DATE == "2024-11") %>% pull(VALUE)
yoy_change <- (nov2025 - nov2024) / nov2024 * 100
```

</details>
