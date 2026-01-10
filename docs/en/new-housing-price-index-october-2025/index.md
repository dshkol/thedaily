---
title: New housing prices down 0.4% in October 2025
verification_json: output/nhpi.json
toc: false
---
# New housing prices down 0.4% in October 2025

<p class="release-date">Released: December 28, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- The New Housing Price Index fell 0.4% to 122.2 in October 2025
- This marked the seventh consecutive monthly decline since April
- The index has fallen 1.9% since reaching its 2025 peak of 124.5 in March
- New housing prices have declined steadily throughout 2025

</div>

The New Housing Price Index (NHPI) fell 0.4% to 122.2 in October 2025, continuing a trend of softening new home prices that began in April.

October's decline marked the seventh consecutive month of falling prices, as the index has slipped from 124.0 in April to 122.2 in October—a cumulative decline of 1.5%.

```js
import * as Plot from "npm:@observablehq/plot";

const nhpiData = [
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
  {date: new Date("2025-10"), value: 122.2}
];

display(Plot.plot({
  title: "New Housing Price Index, November 2024 to October 2025 (2016=100)",
  width: 680,
  height: 300,
  y: {domain: [120, 126], grid: true, label: "Index (2016=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(nhpiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(nhpiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(nhpiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Monthly price changes in 2025

New housing prices have declined in seven of the first ten months of 2025. After modest increases in January and February, prices began falling in March and have continued to decline through October.

```js
const monthlyData = [
  {month: "Jan.", value: 124.4, change: -0.1},
  {month: "Feb.", value: 124.5, change: 0.1},
  {month: "Mar.", value: 124.5, change: 0.0},
  {month: "Apr.", value: 124.0, change: -0.4},
  {month: "May", value: 123.7, change: -0.2},
  {month: "Jun.", value: 123.4, change: -0.2},
  {month: "Jul.", value: 123.3, change: -0.1},
  {month: "Aug.", value: 122.9, change: -0.3},
  {month: "Sep.", value: 122.7, change: -0.2},
  {month: "Oct.", value: 122.2, change: -0.4}
];

display(Plot.plot({
  title: "Month-over-month change in NHPI, 2025 (%)",
  width: 640,
  height: 260,
  x: {label: null, padding: 0.3, domain: ["Jan.", "Feb.", "Mar.", "Apr.", "May", "Jun.", "Jul.", "Aug.", "Sep.", "Oct."]},
  y: {grid: true, label: "Percent change", domain: [-0.6, 0.3]},
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

The New Housing Price Index measures changes over time in contractors' selling prices of new residential houses. The index uses 2016 as the base period (2016=100).

This article is a backfill based on verified time series data. Year-over-year comparisons are not included as the available time series does not extend to October 2024.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch new housing price index data
nhpi <- get_cansim("18-10-0205")

# National index
national <- nhpi %>%
  filter(GEO == "Canada",
         `New housing price indexes` == "Total (house and land)") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# By CMA
by_cma <- nhpi %>%
  filter(REF_DATE == "2025-10",
         `New housing price indexes` == "Total (house and land)",
         GEO != "Canada") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0205](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810020501)
**Survey:** New Housing Price Index
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/1810020501-eng](https://doi.org/10.25318/1810020501-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "new-housing-price-index-october-2025", "en"));
```
