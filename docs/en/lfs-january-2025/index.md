---
title: Employment up 76,000 in January 2025, unemployment rate falls to 6.6%
verification_json: output/data_14_10_0287_enhanced.json
toc: false
---
# Employment up 76,000 in January 2025, unemployment rate falls to 6.6%

<p class="release-date">Released: February 7, 2025</p>

<div class="highlights">

- Employment increased by 76,000 (+0.4%) in January 2025
- The unemployment rate fell 0.1 percentage points to 6.6%
- Total employment rose 416,000 (+2.0%) compared with January 2024
- Full-time employment led gains, up 34,000 from December

</div>

Employment rose by 76,000 (+0.4%) in January 2025, a solid gain following an increase of 91,000 in December. The unemployment rate fell 0.1 percentage points to 6.6%, down from 6.7% in the previous month.

Total employment stood at 21.0 million in January 2025, an increase of 416,000 (+2.0%) compared with January 2024.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 14-10-0287
const urData = [
  {date: new Date("2023-01"), rate: 5.1},
  {date: new Date("2023-02"), rate: 5.1},
  {date: new Date("2023-03"), rate: 5.0},
  {date: new Date("2023-04"), rate: 5.1},
  {date: new Date("2023-05"), rate: 5.2},
  {date: new Date("2023-06"), rate: 5.4},
  {date: new Date("2023-07"), rate: 5.5},
  {date: new Date("2023-08"), rate: 5.5},
  {date: new Date("2023-09"), rate: 5.5},
  {date: new Date("2023-10"), rate: 5.7},
  {date: new Date("2023-11"), rate: 5.7},
  {date: new Date("2023-12"), rate: 5.8},
  {date: new Date("2024-01"), rate: 5.7},
  {date: new Date("2024-02"), rate: 5.9},
  {date: new Date("2024-03"), rate: 6.1},
  {date: new Date("2024-04"), rate: 6.2},
  {date: new Date("2024-05"), rate: 6.3},
  {date: new Date("2024-06"), rate: 6.4},
  {date: new Date("2024-07"), rate: 6.4},
  {date: new Date("2024-08"), rate: 6.7},
  {date: new Date("2024-09"), rate: 6.6},
  {date: new Date("2024-10"), rate: 6.6},
  {date: new Date("2024-11"), rate: 6.9},
  {date: new Date("2024-12"), rate: 6.7},
  {date: new Date("2025-01"), rate: 6.6}
];

display(Plot.plot({
  title: "Unemployment rate, January 2023 to January 2025",
  width: 680,
  height: 300,
  y: {domain: [4, 8], grid: true, label: "Percent"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.lineY(urData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(urData.slice(-1), {x: "date", y: "rate", fill: "#AF3C43", r: 5}),
    Plot.text(urData.slice(-1), {x: "date", y: "rate", text: d => d.rate.toFixed(1) + "%", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Employment trend

```js
// Real data from Statistics Canada Table 14-10-0287
const empData = [
  {date: new Date("2023-01"), employment: 20114},
  {date: new Date("2023-02"), employment: 20153},
  {date: new Date("2023-03"), employment: 20214},
  {date: new Date("2023-04"), employment: 20258},
  {date: new Date("2023-05"), employment: 20247},
  {date: new Date("2023-06"), employment: 20333},
  {date: new Date("2023-07"), employment: 20352},
  {date: new Date("2023-08"), employment: 20412},
  {date: new Date("2023-09"), employment: 20465},
  {date: new Date("2023-10"), employment: 20494},
  {date: new Date("2023-11"), employment: 20519},
  {date: new Date("2023-12"), employment: 20533},
  {date: new Date("2024-01"), employment: 20577},
  {date: new Date("2024-02"), employment: 20608},
  {date: new Date("2024-03"), employment: 20615},
  {date: new Date("2024-04"), employment: 20701},
  {date: new Date("2024-05"), employment: 20698},
  {date: new Date("2024-06"), employment: 20716},
  {date: new Date("2024-07"), employment: 20713},
  {date: new Date("2024-08"), employment: 20743},
  {date: new Date("2024-09"), employment: 20779},
  {date: new Date("2024-10"), employment: 20783},
  {date: new Date("2024-11"), employment: 20826},
  {date: new Date("2024-12"), employment: 20917},
  {date: new Date("2025-01"), employment: 20993}
];

display(Plot.plot({
  title: "Employment (thousands), January 2023 to January 2025",
  width: 680,
  height: 300,
  y: {domain: [19500, 21500], grid: true, label: "Thousands"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(empData, {x: "date", y: "employment", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(empData.slice(-1), {x: "date", y: "employment", fill: "#AF3C43", r: 5}),
    Plot.text(empData.slice(-1), {x: "date", y: "employment", text: d => (d.employment/1000).toFixed(1) + "M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Labour market summary

| Indicator | January 2025 | December 2024 | January 2024 | Monthly change | Year-over-year change |
|-----------|---------------|--------------|---------------|----------------|----------------------|
| Employment (thousands) | 20,993.0 | 20,917.0 | 20,577.0 | +76.0 | +416.0 |
| Unemployment rate | 6.6% | 6.7% | 5.7% | -0.1 pp | +0.9 pp |
| Participation rate | 65.5% | 65.4% | 65.2% | +0.1 pp | +0.3 pp |
| Employment rate | 61.1% | 61.0% | 61.4% | +0.1 pp | -0.3 pp |

## Full-time and part-time employment

Full-time employment increased by 34,000 (+0.4%) in January. Part-time employment rose 41,000.

```js
const typeData = [
  {type: "Full-time employment", change: 33.9, yoy: 1.8},
  {type: "Part-time employment", change: 40.9, yoy: 2.6}
];

display(Plot.plot({
  title: "Monthly employment change by type (thousands)",
  width: 500,
  height: 200,
  marginLeft: 150,
  marginRight: 50,
  x: {domain: [-20, 80], grid: true, label: "Change (thousands)"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(typeData, {
      y: "type",
      x: "change",
      fill: "#AF3C43"
    }),
    Plot.text(typeData, {
      y: "type",
      x: 80,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1),
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

The Labour Force Survey (LFS) estimates are based on a sample and are therefore subject to sampling variability. Estimates may differ from one month to another due to sampling variability.

The survey collects data on the labour market activity of the population aged 15 years and over. The target population of the LFS covers the civilian, non-institutionalized population.

This is a backfill article covering January 2025 data, published as part of the D-AI-LY's historical coverage initiative.

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
         REF_DATE == "2025-01",
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
**Reference period:** January 2025
**DOI:** [https://doi.org/10.25318/1410028701-eng](https://doi.org/10.25318/1410028701-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "lfs-january-2025", "en"));
```
