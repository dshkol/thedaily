---
title: Housing starts up 11% in November 2025
verification_json: output/housing_starts.json
toc: false
---
# Housing starts up 11% in November 2025

<p class="release-date">Released: 2025-12-17 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Housing starts rose 11.0% to 233,600 units (seasonally adjusted annual rate) in November 2025
- Multi-family units accounted for 83% of all starts, reaching 194,000 units
- On a year-over-year basis, starts were down 5.7% compared with November 2024
- New Brunswick (+76.7%) and Manitoba (+69.9%) recorded the largest provincial gains year over year

</div>

The seasonally adjusted annual rate of housing starts rose 11.0% to 233,600 units in November 2025, following a decline in October. Despite the monthly rebound, starts were down 5.7% compared with November 2024, when 247,800 units were started.

Multi-family construction continued to dominate new housing activity, with apartments and other multi-unit types accounting for 83% of all starts. Apartment and other unit types totalled 159,100 units, while row units added 23,000 and semi-detached units contributed 11,900. Single-detached starts reached 39,700 units.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 34-10-0156
// Housing starts, seasonally adjusted annual rates (thousands)
const startsData = [
  {date: new Date("2023-12"), value: 236.1},
  {date: new Date("2024-01"), value: 208.0},
  {date: new Date("2024-02"), value: 237.4},
  {date: new Date("2024-03"), value: 221.0},
  {date: new Date("2024-04"), value: 222.0},
  {date: new Date("2024-05"), value: 248.0},
  {date: new Date("2024-06"), value: 222.0},
  {date: new Date("2024-07"), value: 262.4},
  {date: new Date("2024-08"), value: 199.4},
  {date: new Date("2024-09"), value: 211.0},
  {date: new Date("2024-10"), value: 225.2},
  {date: new Date("2024-11"), value: 247.8},
  {date: new Date("2024-12"), value: 214.8},
  {date: new Date("2025-01"), value: 220.2},
  {date: new Date("2025-02"), value: 207.9},
  {date: new Date("2025-03"), value: 202.6},
  {date: new Date("2025-04"), value: 260.9},
  {date: new Date("2025-05"), value: 260.1},
  {date: new Date("2025-06"), value: 260.2},
  {date: new Date("2025-07"), value: 268.6},
  {date: new Date("2025-08"), value: 219.7},
  {date: new Date("2025-09"), value: 256.4},
  {date: new Date("2025-10"), value: 210.3},
  {date: new Date("2025-11"), value: 233.6}
];

display(Plot.plot({
  title: "Housing starts, seasonally adjusted annual rate (thousands)",
  width: 680,
  height: 300,
  y: {domain: [180, 280], grid: true, label: "Thousands of units"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(startsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(startsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(startsData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1) + "K", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Dwelling type breakdown

Multi-family construction remains the primary driver of housing starts activity. In November, apartments and other unit types accounted for 68% of all starts, while single-detached homes represented 17% of total activity.

```js
const typeData = [
  {type: "Apartment and other unit types", value: 159.1},
  {type: "Single-detached units", value: 39.7},
  {type: "Row units", value: 23.0},
  {type: "Semi-detached units", value: 11.9}
];

display(Plot.plot({
  title: "Housing starts by dwelling type, November 2025 (thousands)",
  width: 640,
  height: 240,
  marginLeft: 200,
  marginRight: 60,
  x: {domain: [0, 180], grid: true, label: "Thousands of units"},
  y: {label: null},
  marks: [
    Plot.barX(typeData, {
      y: "type",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(typeData, {
      y: "type",
      x: "value",
      text: d => d.value.toFixed(1) + "K",
      dx: 25,
      fill: "currentColor"
    })
  ]
}));
```

## Provincial variation

On a year-over-year basis in November, housing starts increased in five provinces and decreased in five compared with November 2024.

New Brunswick (+76.7%) recorded the largest year-over-year increase, followed by Manitoba (+69.9%) and Nova Scotia (+19.0%). These gains were partially offset by declines in Saskatchewan (-38.5%), British Columbia (-21.0%), and Alberta (-12.6%).

Quebec led all provinces with 55,000 starts, followed by Ontario and Alberta, each at 52,100 starts. British Columbia recorded 39,100 starts.

```js
const provData = [
  {province: "Quebec", value: 55.0, yoy: 2.6},
  {province: "Ontario", value: 52.1, yoy: -12.0},
  {province: "Alberta", value: 52.1, yoy: -12.6},
  {province: "British Columbia", value: 39.1, yoy: -21.0},
  {province: "Manitoba", value: 13.2, yoy: 69.9},
  {province: "New Brunswick", value: 10.5, yoy: 76.7},
  {province: "Nova Scotia", value: 6.8, yoy: 19.0},
  {province: "Saskatchewan", value: 2.9, yoy: -38.5},
  {province: "Newfoundland and Labrador", value: 1.6, yoy: -3.2},
  {province: "Prince Edward Island", value: 0.4, yoy: 122.3}
];

display(Plot.plot({
  title: "Year-over-year change in housing starts by province (%)",
  width: 640,
  height: 340,
  marginLeft: 180,
  marginRight: 60,
  x: {domain: [-50, 130], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(provData, {
      y: "province",
      x: "yoy",
      fill: d => d.yoy >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(provData, {
      y: "province",
      x: 125,
      text: d => (d.yoy >= 0 ? "+" : "") + d.yoy.toFixed(1) + "%",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

Housing starts represent the beginning of construction on a new residential building. The data are collected by the Canada Mortgage and Housing Corporation (CMHC) through field surveys of residential building sites across Canada.

Data are seasonally adjusted at annual rates (SAAR) to facilitate month-to-month comparisons. The SAAR represents the number of housing starts that would occur over a year if the current month's pace continued for 12 months.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch housing starts data (SAAR)
df <- get_cansim("34-10-0156")

# National time series - Total units
national <- df %>%
  filter(GEO == "Canada",
         `Type of unit` == "Total units") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Calculate month-over-month and year-over-year changes
current <- national %>% filter(REF_DATE == "2025-11") %>% pull(VALUE)
previous <- national %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
year_ago <- national %>% filter(REF_DATE == "2024-11") %>% pull(VALUE)

mom_change <- (current - previous) / previous * 100
yoy_change <- (current - year_ago) / year_ago * 100

# Dwelling type breakdown for November 2025
by_type <- df %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-11") %>%
  select(`Type of unit`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provinces <- c("Newfoundland and Labrador", "Prince Edward Island", "Nova Scotia",
               "New Brunswick", "Quebec", "Ontario", "Manitoba", "Saskatchewan",
               "Alberta", "British Columbia")

provincial <- df %>%
  filter(GEO %in% provinces,
         `Type of unit` == "Total units",
         REF_DATE == "2025-11") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 34-10-0156](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3410015601)
**Survey:** Canada Mortgage and Housing Corporation, housing starts survey
**Reference period:** November 2025
**DOI:** [https://doi.org/10.25318/3410015601-eng](https://doi.org/10.25318/3410015601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "housing-starts-november-2025", "en"));
```
