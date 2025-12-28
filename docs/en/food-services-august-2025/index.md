---
title: Food services sales up 0.6% in August 2025
toc: false
---

# Food services sales up 0.6% in August 2025

<p class="release-date">Released: October 25, 2025</p>

<div class="highlights">

- Food services and drinking places sales rose 0.6% to $8.5 billion in August 2025
- Year-over-year sales increased 5.8% compared with August 2024
- This marked a rebound from declines in June and July

</div>

Sales at food services and drinking places increased 0.6% to $8.5 billion in August 2025, recovering from a 0.4% decline in July. Compared with August 2024, sales were up 5.8%.

The food services industry has shown steady year-over-year growth throughout 2025, reflecting continued consumer spending on dining despite month-to-month fluctuations.

## Trend in food services sales

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 21-10-0019
const salesData = [
  {date: new Date("2023-08"), value: 7.65},
  {date: new Date("2023-09"), value: 7.70},
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
  {date: new Date("2025-08"), value: 8.51}
];

display(Plot.plot({
  title: "Food services and drinking places sales, August 2023 to August 2025",
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

Food services sales have fluctuated modestly throughout 2025, with the strongest gains in March and May offset by smaller declines in June and July.

```js
const momData = [
  {month: "Jan", change: 0.4},
  {month: "Feb", change: -0.4},
  {month: "Mar", change: 1.9},
  {month: "Apr", change: 0.8},
  {month: "May", change: 0.5},
  {month: "Jun", change: -0.2},
  {month: "Jul", change: -0.4},
  {month: "Aug", change: 0.6}
];

display(Plot.plot({
  title: "Month-over-month change in food services sales, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"]
  },
  y: {grid: true, label: "Percent change", domain: [-1, 2.5]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(momData, {
      x: "month",
      y: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32"
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

| Indicator | August 2025 | Change from July | Change from August 2024 |
|-----------|------------:|-----------------:|------------------------:|
| Total food services sales ($ billions) | 8.51 | +0.6% | +5.8% |

<div class="note-to-readers">

**Note to readers**

Food services and drinking places sales represent the total operating revenue from sales of food and beverages prepared on premises for immediate consumption. The estimates are seasonally adjusted.

This is a backfill article covering August 2025 data, published as part of the D-AI-LY's historical coverage initiative.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 21-10-0019](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2110001901)
**Survey:** Monthly Survey of Food Services and Drinking Places
**Reference period:** August 2025
**DOI:** [https://doi.org/10.25318/2110001901-eng](https://doi.org/10.25318/2110001901-eng)

</div>
