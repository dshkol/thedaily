---
title: Employment insurance claims up 2.1% year over year in October 2025
verification_json: output/data_14_10_0005_enhanced.json
toc: false
---
# Employment insurance claims up 2.1% year over year in October 2025

<p class="release-date">Released: December 28, 2025 <span class="article-type-tag release">New release</span></p>

<div class="highlights">

**Highlights**

- Employment insurance (EI) claims received totalled 267,280 in October 2025, down 1.1% from September
- Year over year, EI claims increased 2.1%
- Alberta led provincial gains at 10.0%, followed by Quebec at 3.4%
- Saskatchewan saw the largest decline among provinces at 3.3%

</div>

Employment insurance (EI) claims received totalled 267,280 in October 2025, down 1.1% from 270,140 in September. On a year-over-year basis, EI claims were up 2.1% compared with October 2024, when 261,860 claims were received.

The monthly decline followed a June 2025 peak of 317,120 claims, which was 18.6% higher than the same month a year earlier. Claims have since moderated, returning to levels closer to the pre-June average.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 14-10-0005 (verified via R cansim package)
const eiData = [
  {date: new Date("2023-10"), value: 255.9},
  {date: new Date("2023-11"), value: 265.2},
  {date: new Date("2023-12"), value: 252.0},
  {date: new Date("2024-01"), value: 275.2},
  {date: new Date("2024-02"), value: 261.3},
  {date: new Date("2024-03"), value: 255.1},
  {date: new Date("2024-04"), value: 260.9},
  {date: new Date("2024-05"), value: 267.7},
  {date: new Date("2024-06"), value: 263.9},
  {date: new Date("2024-07"), value: 277.8},
  {date: new Date("2024-08"), value: 260.5},
  {date: new Date("2024-09"), value: 256.4},
  {date: new Date("2024-10"), value: 261.9},
  {date: new Date("2024-11"), value: 260.6},
  {date: new Date("2024-12"), value: 281.9},
  {date: new Date("2025-01"), value: 255.6},
  {date: new Date("2025-02"), value: 260.1},
  {date: new Date("2025-03"), value: 276.3},
  {date: new Date("2025-04"), value: 272.1},
  {date: new Date("2025-05"), value: 279.7},
  {date: new Date("2025-06"), value: 317.1},
  {date: new Date("2025-07"), value: 268.4},
  {date: new Date("2025-08"), value: 269.0},
  {date: new Date("2025-09"), value: 270.1},
  {date: new Date("2025-10"), value: 267.3}
];

display(Plot.plot({
  title: "Employment insurance claims received, October 2023 to October 2025",
  subtitle: "Thousands, seasonally adjusted",
  width: 680,
  height: 300,
  y: {domain: [240, 330], grid: true, label: "↑ Claims (thousands)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(eiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(eiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(eiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Provincial variation

Alberta recorded the largest year-over-year increase in EI claims at 10.0%, with 32,050 claims received in October 2025 compared with 29,140 in October 2024. Quebec followed at 3.4%, while British Columbia saw a 2.9% increase.

Among provinces with year-over-year declines, Saskatchewan fell 3.3%, followed by Prince Edward Island at 2.3% and Manitoba at 1.8%. Ontario was essentially unchanged at -0.1%.

```js
const yoyData = [
  {province: "Alberta", change: 10.0},
  {province: "Quebec", change: 3.4},
  {province: "British Columbia", change: 2.9},
  {province: "Newfoundland and Labrador", change: 0.1},
  {province: "Ontario", change: -0.1},
  {province: "New Brunswick", change: -0.1},
  {province: "Nova Scotia", change: -1.0},
  {province: "Manitoba", change: -1.8},
  {province: "Prince Edward Island", change: -2.3},
  {province: "Saskatchewan", change: -3.3}
];

display(Plot.plot({
  title: "Year-over-year change in EI claims by province (%)",
  subtitle: "October 2025 vs October 2024",
  width: 700,
  height: 320,
  marginLeft: 180,
  marginRight: 60,
  x: {domain: [-5, 12], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "province",
      x: "change",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(yoyData, {
      y: "province",
      x: 11,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Claims by province

| Province | October 2025 | October 2024 | YoY change (%) |
|----------|-------------:|-------------:|---------------:|
| Canada | 267,280 | 261,860 | +2.1 |
| Ontario | 89,010 | 89,090 | -0.1 |
| Quebec | 68,680 | 66,400 | +3.4 |
| Alberta | 32,050 | 29,140 | +10.0 |
| British Columbia | 31,020 | 30,140 | +2.9 |
| New Brunswick | 9,800 | 9,810 | -0.1 |
| Manitoba | 9,370 | 9,540 | -1.8 |
| Nova Scotia | 8,780 | 8,870 | -1.0 |
| Newfoundland and Labrador | 8,120 | 8,110 | +0.1 |
| Saskatchewan | 6,990 | 7,230 | -3.3 |

<div class="note-to-readers">

## Note to readers

Employment insurance claims received represent the number of applications for regular EI benefits. The data are seasonally adjusted to account for regular seasonal patterns in employment.

Initial claims are new applications, while renewal claims are from individuals who were previously receiving benefits. The data in this release cover initial and renewal claims combined.

Changes in EI claims can reflect various factors including layoffs, seasonal employment patterns, and policy changes. They provide an early indicator of labour market conditions.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 14-10-0005](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410000501)
**Survey:** Employment Insurance Statistics
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/1410000501-eng](https://doi.org/10.25318/1410000501-eng)

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch EI claims data
conn <- get_cansim_connection("14-10-0005")

# Canada time series (seasonally adjusted)
total <- conn |>
  filter(GEO == "Canada") |>
  filter(`Type of claim` == "Initial and renewal claims, seasonally adjusted") |>
  filter(`Claim detail` == "Received") |>
  collect_and_normalize() |>
  filter(REF_DATE >= "2023-10") |>
  select(REF_DATE, VALUE) |>
  arrange(REF_DATE)

# Provincial breakdown for October 2025
provincial <- conn |>
  collect_and_normalize() |>
  filter(`Type of claim` == "Initial and renewal claims, seasonally adjusted") |>
  filter(`Claim detail` == "Received") |>
  filter(REF_DATE %in% c("2024-10", "2025-10")) |>
  select(REF_DATE, GEO, VALUE) |>
  tidyr::pivot_wider(names_from = REF_DATE, values_from = VALUE) |>
  mutate(yoy_change = (`2025-10` - `2024-10`) / `2024-10` * 100)

# Calculate changes
oct2025 <- 267280
sep2025 <- 270140
oct2024 <- 261860

mom_change <- (oct2025 - sep2025) / sep2025 * 100  # -1.1%
yoy_change <- (oct2025 - oct2024) / oct2024 * 100  # 2.1%
```

</details>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "ei-claims-october-2025", "en"));
```
