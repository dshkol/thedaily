---
title: Construction union wage rate index up 2.3% year over year in November 2025
toc: false
---

# Construction union wage rate index up 2.3% year over year in November 2025

<p class="release-date">Data released: December 15, 2025 | Published: January 4, 2026 <span class="article-type-tag release">New Release</span></p>

<div class="metric-box">
  <div class="value">+2.3%</div>
  <div class="label">Year-over-year change in construction wage rate index, November 2025</div>
</div>

The construction union wage rate index for Canada stood at 126.3 in November 2025, up 2.3% compared with the same month a year earlier, when the index was 123.5. On a monthly basis, the index was unchanged from October 2025.

<div class="highlights">

**Highlights**

- The construction union wage rate index rose 2.3% year over year in November 2025
- Carpenters recorded the largest year-over-year increase among trades at 3.1%
- Vancouver recorded the highest wage rate index among major cities at 133.7
- The index was unchanged on a monthly basis

</div>

## Wage rate index trend

```js
import * as Plot from "npm:@observablehq/plot";

const indexData = [
  {date: new Date("2024-01"), value: 119.8},
  {date: new Date("2024-02"), value: 119.8},
  {date: new Date("2024-03"), value: 120.3},
  {date: new Date("2024-04"), value: 121.3},
  {date: new Date("2024-05"), value: 122.7},
  {date: new Date("2024-06"), value: 122.8},
  {date: new Date("2024-07"), value: 123.3},
  {date: new Date("2024-08"), value: 123.3},
  {date: new Date("2024-09"), value: 123.7},
  {date: new Date("2024-10"), value: 123.5},
  {date: new Date("2024-11"), value: 123.5},
  {date: new Date("2024-12"), value: 124.0},
  {date: new Date("2025-01"), value: 124.3},
  {date: new Date("2025-02"), value: 124.2},
  {date: new Date("2025-03"), value: 124.3},
  {date: new Date("2025-04"), value: 124.8},
  {date: new Date("2025-05"), value: 126.0},
  {date: new Date("2025-06"), value: 126.1},
  {date: new Date("2025-07"), value: 126.3},
  {date: new Date("2025-08"), value: 126.3},
  {date: new Date("2025-09"), value: 126.3},
  {date: new Date("2025-10"), value: 126.3},
  {date: new Date("2025-11"), value: 126.3}
];

display(Plot.plot({
  title: "Construction union wage rate index, January 2024 to November 2025",
  width: 680,
  height: 300,
  y: {grid: true, label: "↑ Index (January 1971=100)", domain: [118, 128]},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(indexData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(indexData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(indexData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Year-over-year change by trade

Among construction trades, carpenters recorded the largest year-over-year increase at 3.1%, followed by cement finishers (3.0%) and plumbers (2.9%). Heavy equipment operators and sheet metal workers also recorded increases of 2.9%.

```js
const tradeData = [
  {trade: "Carpenter", change: 3.1},
  {trade: "Cement finisher", change: 3.0},
  {trade: "Plumber", change: 2.9},
  {trade: "Sheet metal worker", change: 2.9},
  {trade: "Heavy equipment operator", change: 2.9},
  {trade: "Structural steel erector", change: 2.8},
  {trade: "Insulator", change: 2.8},
  {trade: "Truck driver", change: 2.8},
  {trade: "Bricklayer", change: 2.7},
  {trade: "Roofer", change: 2.6}
];

display(Plot.plot({
  title: "Year-over-year change in wage rate index by trade, November 2025 (%)",
  width: 680,
  height: 360,
  marginLeft: 160,
  x: {grid: true, label: "Percent change", domain: [0, 3.5]},
  y: {label: null},
  marks: [
    Plot.barX(tradeData, {
      y: "trade",
      x: "change",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(tradeData, {
      y: "trade",
      x: "change",
      text: d => d.change.toFixed(1) + "%",
      dx: 4,
      textAnchor: "start",
      fill: "#AF3C43",
      fontWeight: 600
    })
  ]
}));
```

## Regional variation

British Columbia recorded the highest construction wage rate indexes among provinces, with Vancouver at 133.7 and Kelowna at 133.3. Quebec cities also recorded elevated indexes, with Montreal at 131.6 and Quebec City at 131.5. Ontario cities generally recorded lower indexes, with Toronto at 127.6 and Hamilton at 125.0.

```js
const cityData = [
  {city: "Vancouver, BC", index: 133.7},
  {city: "Kelowna, BC", index: 133.3},
  {city: "Saint John, NB", index: 131.8},
  {city: "Montréal, QC", index: 131.6},
  {city: "Québec City, QC", index: 131.5},
  {city: "Winnipeg, MB", index: 131.3},
  {city: "Moncton, NB", index: 130.7},
  {city: "Victoria, BC", index: 130.6},
  {city: "Toronto, ON", index: 127.6},
  {city: "Hamilton, ON", index: 125.0}
];

display(Plot.plot({
  title: "Construction union wage rate index by city, November 2025",
  width: 680,
  height: 360,
  marginLeft: 140,
  x: {grid: true, label: "Index (January 1971=100)", domain: [120, 136]},
  y: {label: null},
  marks: [
    Plot.barX(cityData, {
      y: "city",
      x1: 120,
      x2: "index",
      fill: "#AF3C43",
      sort: {y: "-x2"}
    }),
    Plot.text(cityData, {
      y: "city",
      x: "index",
      text: d => d.index.toFixed(1),
      dx: 4,
      textAnchor: "start",
      fill: "#AF3C43",
      fontWeight: 600
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

The construction union wage rate index measures changes in basic wage rates negotiated through collective bargaining agreements in the unionized construction industry. The index includes 20 construction trades across 21 metropolitan areas in Canada. The base period is January 1971=100.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0140](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810014001)

</div>
