---
title: Employment down 65,000 in August 2025, unemployment rate rises to 7.1%
toc: false
---

# Employment down 65,000 in August 2025, unemployment rate rises to 7.1%

<p class="release-date">Released: September 6, 2025</p>

<div class="highlights">

- Employment fell by 65,000 (-0.3%) in August 2025
- The unemployment rate rose 0.2 percentage points to 7.1%
- Year over year, employment was up 1.0%, while the unemployment rate was up 0.4 percentage points

</div>

Employment decreased by 65,000 in August 2025, following a decline of 41,000 in July. The unemployment rate rose 0.2 percentage points to 7.1%, the highest level since early 2022.

On a year-over-year basis, employment grew by 212,000 (+1.0%), while the unemployment rate was 0.4 percentage points higher than in August 2024, when it stood at 6.7%.

## Employment trends

Employment declined for the second consecutive month in August, with total employment falling to 20.95 million from 21.02 million in July. Despite the monthly decline, employment remained above year-ago levels.

```js
import * as Plot from "npm:@observablehq/plot";

const employmentData = [
  {date: new Date("2023-08-01"), value: 20443.2},
  {date: new Date("2023-09-01"), value: 20432.4},
  {date: new Date("2023-10-01"), value: 20503.9},
  {date: new Date("2023-11-01"), value: 20522.3},
  {date: new Date("2023-12-01"), value: 20520.9},
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
  {date: new Date("2025-08-01"), value: 20954.9}
];

display(Plot.plot({
  title: "Employment, Canada (thousands, seasonally adjusted)",
  width: 700,
  height: 400,
  y: {
    domain: [20300, 21200],
    grid: true,
    label: "Thousands"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(employmentData, {x: "date", y: "value", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(employmentData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(employmentData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#AF3C43",
      r: 5
    }),
    Plot.text(employmentData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      text: d => d.value.toLocaleString() + "K",
      dy: -12,
      fill: "#AF3C43",
      fontWeight: 600
    })
  ]
}));
```

## Unemployment rate

The unemployment rate rose to 7.1% in August, up from 6.9% in July. This marked the highest level since early 2022 and continued the upward trend observed since spring 2025.

```js
const unemploymentData = [
  {date: new Date("2023-08-01"), value: 5.5},
  {date: new Date("2023-09-01"), value: 5.5},
  {date: new Date("2023-10-01"), value: 5.8},
  {date: new Date("2023-11-01"), value: 5.8},
  {date: new Date("2023-12-01"), value: 5.8},
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
  {date: new Date("2025-08-01"), value: 7.1}
];

display(Plot.plot({
  title: "Unemployment rate, Canada (%, seasonally adjusted)",
  width: 700,
  height: 400,
  y: {
    domain: [5.0, 7.5],
    grid: true,
    label: "Percent"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(unemploymentData, {x: "date", y: "value", fill: "#2e7d32", fillOpacity: 0.1}),
    Plot.lineY(unemploymentData, {x: "date", y: "value", stroke: "#2e7d32", strokeWidth: 2}),
    Plot.dot(unemploymentData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#2e7d32",
      r: 5
    }),
    Plot.text(unemploymentData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      text: d => d.value.toFixed(1) + "%",
      dy: -12,
      fill: "#2e7d32",
      fontWeight: 600
    })
  ]
}));
```

## Summary table

| Indicator | August 2025 | Change from July | Change from August 2024 |
|-----------|------------:|-----------------:|------------------------:|
| Employment (thousands) | 20,954.9 | -65.5 | +212.3 (+1.0%) |
| Unemployment rate (%) | 7.1 | +0.2 pp | +0.4 pp |

<div class="note-to-readers">

**Note to readers**

The Labour Force Survey (LFS) estimates are based on a sample and are subject to sampling variability. Month-to-month changes in employment of less than approximately 35,000 are not statistically significant at the 68% confidence level.

This is a backfill article covering data from August 2025, published as part of the D-AI-LY's historical coverage initiative.

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
         REF_DATE == "2025-08",
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
**Reference period:** August 2025
**DOI:** [https://doi.org/10.25318/1410028701-eng](https://doi.org/10.25318/1410028701-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "lfs-august-2025", "en"));
```
