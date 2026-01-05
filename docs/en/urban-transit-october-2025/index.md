---
title: Urban transit ridership down 3.6% in October 2025 despite higher revenues
toc: false
---

# Urban transit ridership down 3.6% in October 2025 despite higher revenues

<p class="release-date">Released: December 30, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Urban transit systems recorded 142.6 million passenger trips in October 2025, down 3.6% from October 2024
- Month over month, ridership increased 3.2% from September 2025
- Total revenue rose 2.8% year over year to $362.7 million
- The Prairies, British Columbia and Territories saw the largest decline at -7.5%

</div>

Urban transit systems in Canada recorded 142.6 million passenger trips in October 2025, a decrease of 3.6% compared with October 2024. On a monthly basis, ridership increased 3.2% from 138.2 million trips in September 2025.

Despite lower ridership, total operating revenue (excluding subsidies) rose 2.8% year over year to $362.7 million, suggesting higher average fares.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 23-10-0251
const tripsData = [
  {date: new Date("2024-10"), value: 148.0},
  {date: new Date("2024-11"), value: 139.9},
  {date: new Date("2024-12"), value: 127.7},
  {date: new Date("2025-01"), value: 132.0},
  {date: new Date("2025-02"), value: 122.0},
  {date: new Date("2025-03"), value: 137.3},
  {date: new Date("2025-04"), value: 134.4},
  {date: new Date("2025-05"), value: 133.6},
  {date: new Date("2025-06"), value: 125.5},
  {date: new Date("2025-07"), value: 124.0},
  {date: new Date("2025-08"), value: 122.2},
  {date: new Date("2025-09"), value: 138.2},
  {date: new Date("2025-10"), value: 142.6}
];

display(Plot.plot({
  title: "Urban transit passenger trips, October 2024 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [115, 155], grid: true, label: "Million trips"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(tripsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(tripsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(tripsData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1) + "M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Revenue versus ridership

While passenger trips declined 3.6% year over year, operating revenue increased 2.8%, widening the gap between ridership recovery and revenue performance observed since the pandemic.

```js
const revenueData = [
  {date: new Date("2024-10"), value: 352.9},
  {date: new Date("2024-11"), value: 349.7},
  {date: new Date("2024-12"), value: 328.2},
  {date: new Date("2025-01"), value: 322.5},
  {date: new Date("2025-02"), value: 305.8},
  {date: new Date("2025-03"), value: 341.0},
  {date: new Date("2025-04"), value: 329.2},
  {date: new Date("2025-05"), value: 334.0},
  {date: new Date("2025-06"), value: 324.0},
  {date: new Date("2025-07"), value: 326.3},
  {date: new Date("2025-08"), value: 331.2},
  {date: new Date("2025-09"), value: 359.9},
  {date: new Date("2025-10"), value: 362.7}
];

display(Plot.plot({
  title: "Urban transit operating revenue, October 2024 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [290, 380], grid: true, label: "Million dollars"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(revenueData, {x: "date", y: "value", stroke: "#1f77b4", strokeWidth: 2}),
    Plot.dot(revenueData.slice(-1), {x: "date", y: "value", fill: "#1f77b4", r: 5}),
    Plot.text(revenueData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(0) + "M", dy: -12, fill: "#1f77b4", fontWeight: 600})
  ]
}));
```

## Regional breakdown

Quebec and Ontario accounted for 66.8% of total ridership at 95.3 million trips, down 1.9% from October 2024. The Prairies, British Columbia and Territories recorded the largest year-over-year decline at 7.5%, falling to 44.2 million trips.

Atlantic Canada reported 3.1 million trips, unchanged from a year earlier.

```js
const regionalData = [
  {region: "Quebec and Ontario", value: 95.3, yoy: -1.9},
  {region: "Prairies, BC & Territories", value: 44.2, yoy: -7.5},
  {region: "Atlantic", value: 3.1, yoy: 0.0}
];

display(Plot.plot({
  title: "Urban transit ridership by region, October 2025 (million trips)",
  width: 680,
  height: 220,
  marginLeft: 180,
  marginRight: 100,
  x: {grid: true, label: "Million trips"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(regionalData, {
      y: "region",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(regionalData, {
      y: "region",
      x: d => d.value + 2,
      text: d => d.value.toFixed(1) + "M (" + (d.yoy >= 0 ? "+" : "") + d.yoy.toFixed(1) + "% YoY)",
      textAnchor: "start",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

### Year-over-year change by region

```js
const yoyRegional = [
  {region: "Atlantic", change: 0.0},
  {region: "Quebec and Ontario", change: -1.9},
  {region: "Prairies, BC & Territories", change: -7.5}
];

display(Plot.plot({
  title: "Year-over-year change in ridership by region, October 2025 (%)",
  width: 680,
  height: 200,
  marginLeft: 180,
  marginRight: 80,
  x: {domain: [-10, 2], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyRegional, {
      y: "region",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(yoyRegional, {
      y: "region",
      x: d => d.change >= 0 ? d.change + 0.3 : d.change - 0.3,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      textAnchor: d => d.change >= 0 ? "start" : "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

Urban transit statistics cover passenger bus and urban transit operations. Data are collected monthly from transit authorities and include total passenger trips and operating revenue (excluding government subsidies).

The statistics represent activity by urban transit systems (NAICS 485110), which include metropolitan bus, subway, light rail, streetcar and commuter rail services.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch urban transit data
transit <- get_cansim("23-10-0251")

# Total ridership
ridership <- transit %>%
  filter(GEO == "Canada",
         `Type of service` == "Total, type of service") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 23-10-0251](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2310025101)
**Survey:** Passenger Bus and Urban Transit Survey
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/2310025101-eng](https://doi.org/10.25318/2310025101-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "urban-transit-october-2025", "en"));
```
