---
title: Employment up 60,000 in September 2025, unemployment rate unchanged at 7.1%
toc: false
---

# Employment up 60,000 in September 2025, unemployment rate unchanged at 7.1%

<p class="release-date">Released: October 11, 2025</p>

<div class="highlights">

- Employment rose by 60,000 (+0.3%) in September 2025
- The unemployment rate held steady at 7.1%
- Year over year, employment was up 1.1%, while the unemployment rate was up 0.5 percentage points

</div>

Employment increased by 60,000 in September 2025, following a decline of 65,000 in August. The unemployment rate was unchanged at 7.1%, remaining near the elevated levels observed since mid-2025.

On a year-over-year basis, employment grew by 236,000 (+1.1%), while the unemployment rate was 0.5 percentage points higher than in September 2024, when it stood at 6.6%.

## Employment trends

The employment gain in September partially offset the decline recorded in August. Total employment reached 21.0 million in September, compared with 20.8 million a year earlier.

```js
import * as Plot from "npm:@observablehq/plot";

const employmentData = [
  {date: new Date("2024-01-01"), value: 20577.1},
  {date: new Date("2024-02-01"), value: 20607.7},
  {date: new Date("2024-03-01"), value: 20614.5},
  {date: new Date("2024-04-01"), value: 20700.5},
  {date: new Date("2024-05-01"), value: 20698.3},
  {date: new Date("2024-06-01"), value: 20715.9},
  {date: new Date("2024-07-01"), value: 20712.9},
  {date: new Date("2024-08-01"), value: 20742.6},
  {date: new Date("2024-09-01"), value: 20779.3},
  {date: new Date("2024-10-01"), value: 20782.6},
  {date: new Date("2024-11-01"), value: 20826.4},
  {date: new Date("2024-12-01"), value: 20917.4},
  {date: new Date("2025-01-01"), value: 20993.4},
  {date: new Date("2025-02-01"), value: 20994.5},
  {date: new Date("2025-03-01"), value: 20961.9},
  {date: new Date("2025-04-01"), value: 20969.3},
  {date: new Date("2025-05-01"), value: 20978.1},
  {date: new Date("2025-06-01"), value: 21061.2},
  {date: new Date("2025-07-01"), value: 21020.4},
  {date: new Date("2025-08-01"), value: 20954.9},
  {date: new Date("2025-09-01"), value: 21015.3}
];

display(Plot.plot({
  title: "Employment, Canada (thousands, seasonally adjusted)",
  width: 700,
  height: 400,
  y: {
    domain: [20400, 21200],
    grid: true,
    label: "Thousands"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(employmentData, {x: "date", y: "value", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(employmentData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(employmentData.filter(d => d.date.getTime() === new Date("2025-09-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#AF3C43",
      r: 5
    }),
    Plot.tip(employmentData.filter(d => d.date.getTime() === new Date("2025-09-01").getTime()), {
      x: "date",
      y: "value",
      title: d => `Sept 2025: ${d.value.toLocaleString()} thousand`
    })
  ]
}));
```

## Unemployment rate

The unemployment rate remained at 7.1% in September, unchanged from August. The rate has been elevated since mid-2025, up from levels around 6.5% observed in early 2025.

```js
const unemploymentData = [
  {date: new Date("2024-01-01"), value: 5.7},
  {date: new Date("2024-02-01"), value: 5.9},
  {date: new Date("2024-03-01"), value: 6.1},
  {date: new Date("2024-04-01"), value: 6.2},
  {date: new Date("2024-05-01"), value: 6.3},
  {date: new Date("2024-06-01"), value: 6.4},
  {date: new Date("2024-07-01"), value: 6.4},
  {date: new Date("2024-08-01"), value: 6.7},
  {date: new Date("2024-09-01"), value: 6.6},
  {date: new Date("2024-10-01"), value: 6.6},
  {date: new Date("2024-11-01"), value: 6.9},
  {date: new Date("2024-12-01"), value: 6.7},
  {date: new Date("2025-01-01"), value: 6.6},
  {date: new Date("2025-02-01"), value: 6.6},
  {date: new Date("2025-03-01"), value: 6.7},
  {date: new Date("2025-04-01"), value: 6.9},
  {date: new Date("2025-05-01"), value: 7.0},
  {date: new Date("2025-06-01"), value: 6.9},
  {date: new Date("2025-07-01"), value: 6.9},
  {date: new Date("2025-08-01"), value: 7.1},
  {date: new Date("2025-09-01"), value: 7.1}
];

display(Plot.plot({
  title: "Unemployment rate, Canada (%, seasonally adjusted)",
  width: 700,
  height: 400,
  y: {
    domain: [5.5, 7.5],
    grid: true,
    label: "Percent"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(unemploymentData, {x: "date", y: "value", fill: "#2e7d32", fillOpacity: 0.1}),
    Plot.lineY(unemploymentData, {x: "date", y: "value", stroke: "#2e7d32", strokeWidth: 2}),
    Plot.dot(unemploymentData.filter(d => d.date.getTime() === new Date("2025-09-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#2e7d32",
      r: 5
    }),
    Plot.ruleY([7.1], {stroke: "#2e7d32", strokeDasharray: "4 2", strokeOpacity: 0.5})
  ]
}));
```

## Summary table

| Indicator | September 2025 | Change from August | Change from September 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| Employment (thousands) | 21,015.3 | +60.4 | +236.0 (+1.1%) |
| Unemployment rate (%) | 7.1 | 0.0 pp | +0.5 pp |

<div class="note-to-readers">

**Note to readers**

The Labour Force Survey (LFS) estimates are based on a sample and are subject to sampling variability. Month-to-month changes in employment of less than approximately 35,000 are not statistically significant at the 68% confidence level.

This is a backfill article covering data from September 2025, published as part of the D-AI-LY's historical coverage initiative.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch Labour Force Survey data
lfs <- get_cansim("14-10-0287")

# National employment and unemployment
national <- lfs %>%
  filter(GEO == "Canada",
         `Labour force characteristics` %in% c("Employment", "Unemployment rate"),
         Sex == "Both sexes",
         `Age group` == "15 years and over") %>%
  select(REF_DATE, `Labour force characteristics`, VALUE) %>%
  arrange(desc(REF_DATE))

# Month-over-month employment change
employment <- lfs %>%
  filter(GEO == "Canada",
         `Labour force characteristics` == "Employment",
         Sex == "Both sexes",
         `Age group` == "15 years and over") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Provincial unemployment rates
provincial <- lfs %>%
  filter(`Labour force characteristics` == "Unemployment rate",
         REF_DATE == "2025-09",
         Sex == "Both sexes",
         `Age group` == "15 years and over",
         GEO != "Canada") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 14-10-0287](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410028701)
**Survey:** Labour Force Survey
**Reference period:** September 2025
**DOI:** [https://doi.org/10.25318/1410028701-eng](https://doi.org/10.25318/1410028701-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "lfs-september-2025", "en"));
```
