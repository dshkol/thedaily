---
title: Food services sales down 0.4% in September 2025
toc: false
---

# Food services sales down 0.4% in September 2025

<p class="release-date">Released: November 25, 2025</p>

<div class="highlights">

**Highlights**

- Food services and drinking places sales fell 0.4% to $8.5 billion in September 2025
- Year-over-year sales increased 5.0% compared with September 2024
- Limited-service eating places led with $3.9 billion in sales
- Full-service restaurants recorded $3.6 billion

</div>

Sales at food services and drinking places decreased 0.4% to $8.5 billion in September 2025, following a 0.6% increase in August. Compared with September 2024, sales were up 5.0%.

Despite the monthly decline, the food services industry has shown steady year-over-year growth throughout 2025, reflecting continued consumer spending on dining.

## Trend in food services sales

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 21-10-0019
const salesData = [
  {date: new Date("2023-10"), value: 7.72},
  {date: new Date("2023-11"), value: 7.81},
  {date: new Date("2023-12"), value: 7.85},
  {date: new Date("2024-01"), value: 7.88},
  {date: new Date("2024-02"), value: 7.84},
  {date: new Date("2024-03"), value: 7.96},
  {date: new Date("2024-04"), value: 8.01},
  {date: new Date("2024-05"), value: 8.05},
  {date: new Date("2024-06"), value: 8.02},
  {date: new Date("2024-07"), value: 8.00},
  {date: new Date("2024-08"), value: 8.04},
  {date: new Date("2024-09"), value: 8.08},
  {date: new Date("2024-10"), value: 8.11},
  {date: new Date("2024-11"), value: 8.23},
  {date: new Date("2024-12"), value: 8.24},
  {date: new Date("2025-01"), value: 8.27},
  {date: new Date("2025-02"), value: 8.24},
  {date: new Date("2025-03"), value: 8.40},
  {date: new Date("2025-04"), value: 8.47},
  {date: new Date("2025-05"), value: 8.51},
  {date: new Date("2025-06"), value: 8.49},
  {date: new Date("2025-07"), value: 8.46},
  {date: new Date("2025-08"), value: 8.51},
  {date: new Date("2025-09"), value: 8.48}
];

display(Plot.plot({
  title: "Food services and drinking places sales, October 2023 to September 2025",
  width: 680,
  height: 300,
  y: {domain: [7.5, 8.8], grid: true, label: "Billions $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(salesData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(2) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Monthly change in 2025

Food services sales have fluctuated modestly throughout 2025, with the strongest gains in March and May offset by smaller declines in July and September.

```js
const momData = [
  {month: "Jan", change: 0.4},
  {month: "Feb", change: -0.4},
  {month: "Mar", change: 1.9},
  {month: "Apr", change: 0.8},
  {month: "May", change: 0.5},
  {month: "Jun", change: -0.2},
  {month: "Jul", change: -0.4},
  {month: "Aug", change: 0.6},
  {month: "Sep", change: -0.4}
];

display(Plot.plot({
  title: "Month-over-month change in food services sales, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"]
  },
  y: {grid: true, label: "Percent change", domain: [-1, 2.5]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(momData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(momData, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.15 : d.change - 0.15,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      fontSize: 10
    })
  ]
}));
```

## Summary table

| Indicator | September 2025 | Change from August | Change from September 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| Total food services sales ($ billions) | 8.48 | -0.4% | +5.0% |

<div class="note-to-readers">

## Note to readers

Food services and drinking places sales represent the total operating revenue from sales of food and beverages prepared on premises for immediate consumption. The estimates are seasonally adjusted.

This backfill article covers September 2025 data as part of The D-AI-LY historical coverage initiative.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 21-10-0019](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2110001901)
**Survey:** Monthly Survey of Food Services and Drinking Places
**Reference period:** September 2025
**DOI:** [https://doi.org/10.25318/2110001901-eng](https://doi.org/10.25318/2110001901-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "food-services-september-2025", "en"));
```
