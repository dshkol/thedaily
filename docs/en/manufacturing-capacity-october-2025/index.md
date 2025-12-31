---
title: Manufacturing capacity utilization edges up 0.1 percentage points in October 2025
toc: false
---

# Manufacturing capacity utilization edges up 0.1 percentage points in October 2025

<p class="release-date">Released: December 30, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Manufacturing capacity utilization was 80.8% in October 2025, up 0.1 percentage points from October 2024
- Month over month, utilization increased 0.5 percentage points from 80.3% in September
- Petroleum and coal products led all industries at 90.8%
- Textile product mills recorded the largest year-over-year gain (+11.4 pp), while rubber products saw the sharpest decline (-12.9 pp)

</div>

Canadian manufacturers operated at 80.8% of capacity in October 2025, virtually unchanged from 80.7% a year earlier. On a monthly basis, utilization increased 0.5 percentage points from September 2025.

The modest year-over-year increase reflects offsetting movements across industries, with gains in textile and apparel manufacturing balanced by declines in rubber products and fabricated metals.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 16-10-0012
const capacityData = [
  {date: new Date("2024-10"), value: 80.7},
  {date: new Date("2024-11"), value: 79.7},
  {date: new Date("2024-12"), value: 75.6},
  {date: new Date("2025-01"), value: 78.0},
  {date: new Date("2025-02"), value: 77.2},
  {date: new Date("2025-03"), value: 80.2},
  {date: new Date("2025-04"), value: 77.0},
  {date: new Date("2025-05"), value: 78.4},
  {date: new Date("2025-06"), value: 78.6},
  {date: new Date("2025-07"), value: 76.8},
  {date: new Date("2025-08"), value: 79.0},
  {date: new Date("2025-09"), value: 80.3},
  {date: new Date("2025-10"), value: 80.8}
];

display(Plot.plot({
  title: "Manufacturing capacity utilization rate, October 2024 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [72, 84], grid: true, label: "Percent"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(capacityData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(capacityData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(capacityData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1) + "%", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Utilization by industry

Petroleum and coal products manufacturing operated at the highest rate (90.8%), followed by transportation equipment (88.9%) and computer and electronic products (87.9%).

At the lower end, rubber product manufacturing operated at 72.0% of capacity, followed by fabricated metal products (72.5%) and wood products (73.3%).

```js
const industries = [
  {name: "Petroleum & coal", value: 90.8},
  {name: "Transport equipment", value: 88.9},
  {name: "Computer & electronics", value: 87.9},
  {name: "Textile mills", value: 84.2},
  {name: "Furniture", value: 83.9},
  {name: "Paper", value: 83.8},
  {name: "Apparel", value: 82.6},
  {name: "Food", value: 82.0}
];

display(Plot.plot({
  title: "Capacity utilization by industry, October 2025 (%)",
  width: 640,
  height: 340,
  marginLeft: 180,
  marginRight: 60,
  x: {domain: [60, 95], grid: true, label: "Percent"},
  y: {label: null},
  marks: [
    Plot.ruleX([80.8], {stroke: "#666", strokeDasharray: "4,4"}),
    Plot.barX(industries, {
      y: "name",
      x: "value",
      x1: 60,
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(industries, {
      y: "name",
      x: d => d.value + 1,
      text: d => d.value.toFixed(1) + "%",
      textAnchor: "start",
      fill: "currentColor",
      fontSize: 11
    }),
    Plot.text([{x: 80.8, label: "Total: 80.8%"}], {
      x: "x",
      y: "Petroleum & coal",
      text: "label",
      dy: -20,
      fill: "#666",
      fontSize: 10
    })
  ]
}));
```

## Year-over-year changes

Textile product mills recorded the largest year-over-year increase at 11.4 percentage points, rising from 72.8% in October 2024 to 84.2% in October 2025. Apparel manufacturing followed with a 9.9 percentage point gain.

Rubber product manufacturing saw the sharpest decline, falling 12.9 percentage points from 84.9% to 72.0%. Fabricated metal products fell 5.0 percentage points.

```js
const yoyData = [
  {name: "Textile mills", change: 11.4},
  {name: "Apparel", change: 9.9},
  {name: "Tobacco", change: 6.2},
  {name: "Transport equipment", change: 5.6},
  {name: "Furniture", change: 4.8},
  {name: "Printing", change: -3.0},
  {name: "Wood products", change: -3.0},
  {name: "Non-metallic minerals", change: -4.5},
  {name: "Fabricated metals", change: -5.0},
  {name: "Rubber products", change: -12.9}
];

display(Plot.plot({
  title: "Year-over-year change in capacity utilization, October 2025 (pp)",
  width: 640,
  height: 380,
  marginLeft: 160,
  marginRight: 60,
  x: {domain: [-16, 14], grid: true, label: "Percentage point change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "name",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(yoyData, {
      y: "name",
      x: d => d.change >= 0 ? d.change + 0.5 : d.change - 0.5,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + " pp",
      textAnchor: d => d.change >= 0 ? "start" : "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

The capacity utilization rate measures the extent to which manufacturing industries use their production capacity. It is calculated as the ratio of actual output to potential output. A higher rate indicates greater use of available capacity.

Data are collected monthly from manufacturers and cover all industries in the manufacturing sector (NAICS 31-33). Estimates are seasonally adjusted.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 16-10-0012](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1610001201)
**Survey:** Monthly Survey of Manufacturing
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/1610001201-eng](https://doi.org/10.25318/1610001201-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "manufacturing-capacity-october-2025", "en"));
```
