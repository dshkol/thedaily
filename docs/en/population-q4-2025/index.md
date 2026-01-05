---
title: Canada's population declines for first time since 2020 as Ontario leads losses
toc: false
---

# Canada's population declines for first time since 2020 as Ontario leads losses

<p class="release-date">Released: December 28, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Canada's population fell by 76,068 in the fourth quarter of 2025, the first quarterly decline since Q4 2020
- Ontario accounted for 88% of the national decline, losing 66,888 residents
- Alberta was the only province to record population growth (+11,525)
- Year-over-year growth slowed sharply to 0.2%, down from the 7.9% peak in mid-2024

</div>

Canada's population declined to 41,575,585 in the fourth quarter of 2025, down 76,068 (-0.18%) from the previous quarter. This marked the first quarterly population decline since the fourth quarter of 2020, when growth briefly stalled during the COVID-19 pandemic.

The decline ended a streak of 19 consecutive quarters of population growth that began in early 2021. Year-over-year growth slowed to just 0.2%, a sharp deceleration from the 7.9% pace recorded in mid-2024.

```js
import * as Plot from "npm:@observablehq/plot";

const populationData = [
  {date: new Date("2020-01-01"), value: 37.93, label: "Q1 2020"},
  {date: new Date("2020-04-01"), value: 38.01, label: "Q2 2020"},
  {date: new Date("2020-07-01"), value: 38.03, label: "Q3 2020"},
  {date: new Date("2020-10-01"), value: 38.03, label: "Q4 2020"},
  {date: new Date("2021-01-01"), value: 38.06, label: "Q1 2021"},
  {date: new Date("2021-04-01"), value: 38.14, label: "Q2 2021"},
  {date: new Date("2021-07-01"), value: 38.24, label: "Q3 2021"},
  {date: new Date("2021-10-01"), value: 38.46, label: "Q4 2021"},
  {date: new Date("2022-01-01"), value: 38.57, label: "Q1 2022"},
  {date: new Date("2022-04-01"), value: 38.69, label: "Q2 2022"},
  {date: new Date("2022-07-01"), value: 38.95, label: "Q3 2022"},
  {date: new Date("2022-10-01"), value: 39.28, label: "Q4 2022"},
  {date: new Date("2023-01-01"), value: 39.50, label: "Q1 2023"},
  {date: new Date("2023-04-01"), value: 39.73, label: "Q2 2023"},
  {date: new Date("2023-07-01"), value: 40.05, label: "Q3 2023"},
  {date: new Date("2023-10-01"), value: 40.47, label: "Q4 2023"},
  {date: new Date("2024-01-01"), value: 40.72, label: "Q1 2024"},
  {date: new Date("2024-04-01"), value: 40.99, label: "Q2 2024"},
  {date: new Date("2024-07-01"), value: 41.26, label: "Q3 2024"},
  {date: new Date("2024-10-01"), value: 41.49, label: "Q4 2024"},
  {date: new Date("2025-01-01"), value: 41.57, label: "Q1 2025"},
  {date: new Date("2025-04-01"), value: 41.60, label: "Q2 2025"},
  {date: new Date("2025-07-01"), value: 41.65, label: "Q3 2025"},
  {date: new Date("2025-10-01"), value: 41.58, label: "Q4 2025"}
];

display(Plot.plot({
  title: "Canada's population, Q1 2020 to Q4 2025 (millions)",
  width: 680,
  height: 320,
  y: {domain: [37, 42.5], grid: true, label: "Population (millions)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(populationData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(populationData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(populationData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(2) + "M", dy: -12, fill: "#AF3C43", fontWeight: 600}),
    Plot.areaY(populationData.slice(-2), {x: "date", y1: d => Math.min(...populationData.slice(-2).map(p => p.value)), y2: "value", fill: "#AF3C43", fillOpacity: 0.1})
  ]
}));
```

## Ontario accounts for nearly all of national decline

Ontario lost 66,888 residents in the fourth quarter, accounting for 88% of the national population decline. The province's population fell to 16,191,372, a decrease of 0.4% from the previous quarter.

British Columbia (-14,335) and Manitoba (-2,645) also recorded notable declines. Quebec's population was essentially unchanged, falling by just 208 residents.

**Alberta was the only province to record population growth** in the fourth quarter, adding 11,525 residents (+0.2%). Nunavut also posted a small gain of 89 people.

```js
const provincialData = [
  {province: "Alberta", value: 11525, pct: 0.23},
  {province: "Nunavut", value: 89, pct: 0.21},
  {province: "Quebec", value: -208, pct: -0.00},
  {province: "Saskatchewan", value: -725, pct: -0.06},
  {province: "Prince Edward Island", value: -149, pct: -0.08},
  {province: "Northwest Territories", value: -102, pct: -0.22},
  {province: "Newfoundland and Labrador", value: -173, pct: -0.03},
  {province: "Yukon", value: -17, pct: -0.04},
  {province: "New Brunswick", value: -1052, pct: -0.12},
  {province: "Nova Scotia", value: -1388, pct: -0.13},
  {province: "Manitoba", value: -2645, pct: -0.18},
  {province: "British Columbia", value: -14335, pct: -0.25},
  {province: "Ontario", value: -66888, pct: -0.41}
];

display(Plot.plot({
  title: "Population change by province, Q4 2025 (number of persons)",
  width: 680,
  height: 400,
  marginLeft: 170,
  x: {grid: true, label: "Change in population", domain: [-70000, 15000]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 15000,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toLocaleString(),
      textAnchor: "end",
      fontSize: 10
    })
  ]
}));
```

## Sharp slowdown in population growth

The fourth quarter decline follows a period of historically rapid population growth. Canada's year-over-year population growth peaked at 7.9% in mid-2024, driven largely by immigration. Growth has since slowed markedly, falling to 0.2% in the fourth quarter of 2025.

The slowdown reflects changes to immigration policy announced in late 2024, which reduced targets for temporary residents and permanent immigrants.

| Quarter | Population | Quarter-over-quarter change | Year-over-year change |
|---|---:|---:|---:|
| Q4 2024 | 41,494,132 | +0.56% | +7.89% |
| Q1 2025 | 41,574,517 | +0.19% | +7.80% |
| Q2 2025 | 41,604,555 | +0.07% | +7.52% |
| Q3 2025 | 41,651,653 | +0.11% | +6.94% |
| Q4 2025 | 41,575,585 | **-0.18%** | +0.20% |

<div class="note-to-readers">

## Note to readers

Population estimates are produced quarterly by Statistics Canada. October 1 estimates (Q4) represent the population as of that date.

Population growth is composed of natural increase (births minus deaths), international migration (immigration, emigration, returning emigrants, and net non-permanent residents), and interprovincial migration.

Estimates for the most recent quarters are preliminary and subject to revision as more complete data become available.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch population estimates
pop <- get_cansim("17-10-0009")

# National population
national <- pop %>%
  filter(GEO == "Canada") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Provincial breakdown
provincial <- pop %>%
  filter(REF_DATE == "2025-Q4",
         GEO != "Canada") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 17-10-0009](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1710000901)
**Survey:** Demographic Estimates Program
**Reference period:** Fourth quarter 2025
**DOI:** [https://doi.org/10.25318/1710000901-eng](https://doi.org/10.25318/1710000901-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "population-q4-2025", "en"));
```
