---
title: Housing starts fell 17.4% to 232,000 units in October 2025
toc: false
---

# Housing starts fell 17.4% to 232,000 units in October 2025

<p class="release-date">Released: December 28, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Housing starts declined 17.4% to a seasonally adjusted annual rate of 232,000 units in October 2025
- This followed a strong September at 281,000 units
- October marked the lowest level since February 2025 (221,000 units)
- The decline reversed gains seen in summer months

</div>

Housing starts fell 17.4% to a seasonally adjusted annual rate of 232,000 units in October 2025, down from 281,000 units in September. This marked a sharp reversal following relatively strong construction activity during the summer months.

The October level was the lowest since February 2025, when starts reached 221,000 units.

```js
import * as Plot from "npm:@observablehq/plot";

const startsData = [
  {date: new Date("2024-11"), value: 267},
  {date: new Date("2024-12"), value: 232},
  {date: new Date("2025-01"), value: 233},
  {date: new Date("2025-02"), value: 221},
  {date: new Date("2025-03"), value: 214},
  {date: new Date("2025-04"), value: 282},
  {date: new Date("2025-05"), value: 282},
  {date: new Date("2025-06"), value: 282},
  {date: new Date("2025-07"), value: 293},
  {date: new Date("2025-08"), value: 244},
  {date: new Date("2025-09"), value: 281},
  {date: new Date("2025-10"), value: 232}
];

display(Plot.plot({
  title: "Housing starts, November 2024 to October 2025 (thousands of units, SAAR)",
  width: 680,
  height: 300,
  y: {domain: [200, 310], grid: true, label: "Thousands of units"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(startsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(startsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(startsData.slice(-1), {x: "date", y: "value", text: d => d.value + "K", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Monthly pattern

Housing starts showed considerable volatility through 2025. After reaching a low of 214,000 units in March, starts rose sharply in April and remained elevated through September before the October decline.

```js
const monthlyData = [
  {month: "Jan.", value: 233, change: 0.4},
  {month: "Feb.", value: 221, change: -5.2},
  {month: "Mar.", value: 214, change: -3.2},
  {month: "Apr.", value: 282, change: 31.8},
  {month: "May", value: 282, change: 0.0},
  {month: "Jun.", value: 282, change: 0.0},
  {month: "Jul.", value: 293, change: 3.9},
  {month: "Aug.", value: 244, change: -16.7},
  {month: "Sep.", value: 281, change: 15.2},
  {month: "Oct.", value: 232, change: -17.4}
];

display(Plot.plot({
  title: "Month-over-month change in housing starts, 2025 (%)",
  width: 640,
  height: 260,
  x: {label: null, padding: 0.3, domain: ["Jan.", "Feb.", "Mar.", "Apr.", "May", "Jun.", "Jul.", "Aug.", "Sep.", "Oct."]},
  y: {grid: true, label: "Percent change", domain: [-25, 40]},
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

Housing starts are reported as a seasonally adjusted annual rate (SAAR), which represents the number of housing units that would be started in a year if the current month's pace were maintained.

This article is a backfill based on verified time series data. Year-over-year comparisons are not included as the available time series does not extend to October 2024.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch housing starts data
starts <- get_cansim("34-10-0158")

# Total housing starts (SAAR)
total_starts <- starts %>%
  filter(GEO == "Canada",
         `Type of dwelling unit` == "Total units",
         `Housing estimates` == "Housing starts") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# By dwelling type
by_type <- starts %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-10",
         `Housing estimates` == "Housing starts") %>%
  select(`Type of dwelling unit`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- starts %>%
  filter(`Type of dwelling unit` == "Total units",
         `Housing estimates` == "Housing starts",
         REF_DATE == "2025-10",
         GEO != "Canada") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 34-10-0158](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3410015801)
**Survey:** Canada Mortgage and Housing Corporation, Housing Starts
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/3410015801-eng](https://doi.org/10.25318/3410015801-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "housing-starts-october-2025", "en"));
```
