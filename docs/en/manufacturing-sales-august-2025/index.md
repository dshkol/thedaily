---
title: Manufacturing sales down 1.1% in August 2025
toc: false
---

# Manufacturing sales down 1.1% in August 2025

<p class="release-date">Released: October 15, 2025</p>

<div class="highlights">

- Manufacturing sales fell 1.1% to $69.8 billion in August 2025
- This followed a 2.3% gain in July
- Year over year, sales were down 0.8%

</div>

Manufacturing sales decreased 1.1% to $69.8 billion in August 2025, partially reversing a 2.3% gain in July. On a year-over-year basis, manufacturing sales were down 0.8% compared with August 2024, when sales totalled $70.3 billion.

The August decline continued the volatility that has characterized the manufacturing sector through 2025.

## Sales trend

Manufacturing sales have fluctuated through 2025, with declines in the spring followed by a recovery in summer, though August saw a pullback from July's gains.

```js
import * as Plot from "npm:@observablehq/plot";

const salesData = [
  {date: new Date("2023-08-01"), value: 68.45},
  {date: new Date("2023-09-01"), value: 69.12},
  {date: new Date("2023-10-01"), value: 69.85},
  {date: new Date("2023-11-01"), value: 70.22},
  {date: new Date("2023-12-01"), value: 69.98},
  {date: new Date("2024-01-01"), value: 70.18},
  {date: new Date("2024-02-01"), value: 71.66},
  {date: new Date("2024-03-01"), value: 70.57},
  {date: new Date("2024-04-01"), value: 71.50},
  {date: new Date("2024-05-01"), value: 71.71},
  {date: new Date("2024-06-01"), value: 70.35},
  {date: new Date("2024-07-01"), value: 71.55},
  {date: new Date("2024-08-01"), value: 70.30},
  {date: new Date("2024-09-01"), value: 70.15},
  {date: new Date("2024-10-01"), value: 71.04},
  {date: new Date("2024-11-01"), value: 71.54},
  {date: new Date("2024-12-01"), value: 71.80},
  {date: new Date("2025-01-01"), value: 72.79},
  {date: new Date("2025-02-01"), value: 72.42},
  {date: new Date("2025-03-01"), value: 71.28},
  {date: new Date("2025-04-01"), value: 69.34},
  {date: new Date("2025-05-01"), value: 68.29},
  {date: new Date("2025-06-01"), value: 68.93},
  {date: new Date("2025-07-01"), value: 70.51},
  {date: new Date("2025-08-01"), value: 69.75}
];

display(Plot.plot({
  title: "Manufacturing sales, Canada (billions of dollars, seasonally adjusted)",
  width: 700,
  height: 400,
  y: {
    domain: [66, 74],
    grid: true,
    label: "Billions ($)"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(salesData, {x: "date", y: "value", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#AF3C43",
      r: 5
    }),
    Plot.text(salesData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      text: d => "$" + d.value.toFixed(1) + "B",
      dy: -12,
      fill: "#AF3C43",
      fontWeight: 600
    })
  ]
}));
```

## Monthly changes in 2025

Sales have been volatile in 2025, with the August decline following a strong July.

```js
const monthlyChanges = [
  {month: "Jan", change: 1.4},
  {month: "Feb", change: -0.5},
  {month: "Mar", change: -1.6},
  {month: "Apr", change: -2.7},
  {month: "May", change: -1.5},
  {month: "Jun", change: 0.9},
  {month: "Jul", change: 2.3},
  {month: "Aug", change: -1.1}
];

display(Plot.plot({
  title: "Month-over-month change in manufacturing sales, 2025 (%)",
  width: 700,
  height: 350,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"]
  },
  y: {
    grid: true,
    label: "Percent change",
    domain: [-4, 4]
  },
  marks: [
    Plot.ruleY([0]),
    Plot.barY(monthlyChanges, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(monthlyChanges, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.25 : d.change - 0.25,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      fontSize: 10
    })
  ]
}));
```

## Summary table

| Indicator | August 2025 | Change from July | Change from August 2024 |
|-----------|------------:|-----------------:|------------------------:|
| Manufacturing sales ($ billions) | 69.8 | -1.1% | -0.8% |

<div class="note-to-readers">

**Note to readers**

Manufacturing sales are expressed in current dollars and are seasonally adjusted. The Monthly Survey of Manufacturing covers all manufacturing industries in Canada.

This is a backfill article covering data from August 2025, published as part of the D-AI-LY's historical coverage initiative.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch manufacturing sales data
manufacturing <- get_cansim("16-10-0048")

# Total manufacturing sales
total_sales <- manufacturing %>%
  filter(GEO == "Canada",
         `North American Industry Classification System (NAICS)` == "Manufacturing [31-33]",
         `Seasonal adjustment` == "Seasonally adjusted") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# By industry subsector
by_industry <- manufacturing %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-08",
         `Seasonal adjustment` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- manufacturing %>%
  filter(`North American Industry Classification System (NAICS)` == "Manufacturing [31-33]",
         REF_DATE == "2025-08",
         `Seasonal adjustment` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 16-10-0047](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1610004701)
**Survey:** Monthly Survey of Manufacturing
**Reference period:** August 2025
**DOI:** [https://doi.org/10.25318/1610004701-eng](https://doi.org/10.25318/1610004701-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "manufacturing-sales-august-2025", "en"));
```
