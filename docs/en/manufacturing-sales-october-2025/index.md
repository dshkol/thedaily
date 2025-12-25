---
title: Manufacturing sales down 1.0% in October 2025
toc: false
---

# Manufacturing sales down 1.0% in October 2025

<p class="release-date">Released: December 25, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Manufacturing sales fell 1.0% to $71.5 billion in October 2025
- Sales were up 0.7% compared with October 2024
- Food manufacturing led all industries at $13.2 billion
- Transportation equipment sales totalled $11.5 billion

</div>

Manufacturing sales decreased 1.0% to $71.5 billion in October 2025, following a 3.5% gain in September. Year over year, sales were up 0.7% compared with October 2024.

The decline was broad-based, with 11 of 21 industries reporting lower sales. Transportation equipment manufacturing and primary metals were among the largest contributors to the decrease.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 16-10-0047
const salesData = [
  {date: new Date("2024-10"), value: 71.0},
  {date: new Date("2024-11"), value: 71.5},
  {date: new Date("2024-12"), value: 71.8},
  {date: new Date("2025-01"), value: 72.8},
  {date: new Date("2025-02"), value: 72.4},
  {date: new Date("2025-03"), value: 71.3},
  {date: new Date("2025-04"), value: 69.3},
  {date: new Date("2025-05"), value: 68.3},
  {date: new Date("2025-06"), value: 68.9},
  {date: new Date("2025-07"), value: 70.5},
  {date: new Date("2025-08"), value: 69.8},
  {date: new Date("2025-09"), value: 72.2},
  {date: new Date("2025-10"), value: 71.5}
];

display(Plot.plot({
  title: "Manufacturing sales, October 2024 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [65, 75], grid: true, label: "Billions $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(salesData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Sales by industry

Food manufacturing remained the largest industry, with sales of $13.2 billion in October. Transportation equipment manufacturing followed at $11.5 billion, which includes both motor vehicle assembly and parts manufacturing.

Primary metal manufacturing reported $6.1 billion in sales, while chemical manufacturing totalled $5.2 billion.

```js
const industries = [
  {name: "Food manufacturing", value: 13.2},
  {name: "Transportation equipment", value: 11.5},
  {name: "Primary metals", value: 6.1},
  {name: "Chemicals", value: 5.2},
  {name: "Machinery", value: 4.6},
  {name: "Fabricated metals", value: 4.4},
  {name: "Plastics and rubber", value: 3.5},
  {name: "Motor vehicle parts", value: 3.0},
  {name: "Wood products", value: 2.9}
];

display(Plot.plot({
  title: "Manufacturing sales by industry, October 2025 ($ billions)",
  width: 680,
  height: 340,
  marginLeft: 160,
  marginRight: 60,
  x: {grid: true, label: "Billions $"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(industries, {
      y: "name",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(industries, {
      y: "name",
      x: 14,
      text: d => "$" + d.value.toFixed(1) + "B",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

Manufacturing sales represent the estimated value of goods manufactured and sold by establishments in Canada. The estimates are based on a survey of manufacturing establishments and are seasonally adjusted.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 16-10-0047](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1610004701)
**Survey:** Monthly Survey of Manufacturing
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/1610004701-eng](https://doi.org/10.25318/1610004701-eng)

</div>
