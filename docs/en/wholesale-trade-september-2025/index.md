---
title: Wholesale sales up 0.6% in September 2025
toc: false
---

# Wholesale sales up 0.6% in September 2025

<p class="release-date">Released: November 14, 2025</p>

<div class="highlights">

- Wholesale sales rose 0.6% to $86.0 billion in September 2025
- This marked the fourth increase in five months
- Year-over-year, wholesale sales were up 4.1%

</div>

Wholesale sales rose 0.6% to $86.0 billion in September 2025, marking the fourth increase in five months. On a year-over-year basis, wholesale sales were up 4.1% compared with September 2024.

Sales increased in four of seven subsectors in September, with motor vehicles and parts wholesalers and farm product wholesalers among those posting gains.

## Wholesale trade trend

Wholesale sales have generally trended upward through 2025, rising from $85.2 billion in January to $86.0 billion in September.

```js
import * as Plot from "npm:@observablehq/plot";

// Data from Statistics Canada Table 20-10-0003
const salesData = [
  {date: new Date("2023-10"), value: 82.3},
  {date: new Date("2023-11"), value: 83.1},
  {date: new Date("2023-12"), value: 83.1},
  {date: new Date("2024-01"), value: 82.6},
  {date: new Date("2024-02"), value: 82.4},
  {date: new Date("2024-03"), value: 81.5},
  {date: new Date("2024-04"), value: 84.1},
  {date: new Date("2024-05"), value: 83.2},
  {date: new Date("2024-06"), value: 82.2},
  {date: new Date("2024-07"), value: 82.5},
  {date: new Date("2024-08"), value: 81.9},
  {date: new Date("2024-09"), value: 82.6},
  {date: new Date("2024-10"), value: 83.9},
  {date: new Date("2024-11"), value: 83.6},
  {date: new Date("2024-12"), value: 84.1},
  {date: new Date("2025-01"), value: 85.2},
  {date: new Date("2025-02"), value: 85.7},
  {date: new Date("2025-03"), value: 86.1},
  {date: new Date("2025-04"), value: 84.0},
  {date: new Date("2025-05"), value: 83.8},
  {date: new Date("2025-06"), value: 84.9},
  {date: new Date("2025-07"), value: 86.3},
  {date: new Date("2025-08"), value: 85.5},
  {date: new Date("2025-09"), value: 86.0}
];

display(Plot.plot({
  title: "Wholesale sales ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [78, 90], grid: true, label: "$ billions"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(salesData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Monthly change in 2025

Wholesale sales have fluctuated month to month in 2025, with gains in most months offset by declines in April and May.

```js
const momData = [
  {month: "Jan", change: 1.3},
  {month: "Feb", change: 0.6},
  {month: "Mar", change: 0.5},
  {month: "Apr", change: -2.4},
  {month: "May", change: -0.2},
  {month: "Jun", change: 1.3},
  {month: "Jul", change: 1.6},
  {month: "Aug", change: -0.9},
  {month: "Sep", change: 0.6}
];

display(Plot.plot({
  title: "Monthly change in wholesale sales, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"]
  },
  y: {grid: true, label: "Percent change", domain: [-3, 2]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(momData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(momData, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.2 : d.change - 0.2,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      fontSize: 10
    })
  ]
}));
```

## Summary table

| Indicator | September 2025 | Change from August | Change from September 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| Wholesale sales ($ billions) | 86.0 | +0.6% | +4.1% |

<div class="note-to-readers">

**Note to readers**

Wholesale trade data are seasonally adjusted and expressed in current dollars. The data cover sales by establishments primarily engaged in wholesaling merchandise and providing related logistics, marketing, and support services.

This is a backfill article covering September 2025 data, published as part of the D-AI-LY's historical coverage initiative.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0003](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010000301)
**Survey:** Monthly Wholesale Trade Survey
**Reference period:** September 2025
**DOI:** [https://doi.org/10.25318/2010000301-eng](https://doi.org/10.25318/2010000301-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "wholesale-trade-september-2025", "en"));
```
