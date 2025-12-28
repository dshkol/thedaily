---
title: Consumer prices up 2.3% year over year in March 2025
toc: false
---

# Consumer prices up 2.3% year over year in March 2025

<p class="release-date">Released: April 15, 2025</p>

<div class="highlights">

- The Consumer Price Index rose 2.3% year over year in March 2025
- Inflation decelerated from 2.6% in February
- Food prices increased 3.8% year over year
- Shelter costs rose 4.6%

</div>

The Consumer Price Index (CPI) rose 2.3% in March 2025 compared with the same month a year earlier, down from 2.6% in February. Energy prices continued to moderate, partially offsetting persistent shelter cost increases.

On a monthly basis, prices increased 0.3% from February 2025.

## Year-over-year inflation trend

Annual inflation has moderated significantly from its 2022 peak, with the Bank of Canada's 2% target within sight.

```js
import * as Plot from "npm:@observablehq/plot";

const inflationData = [
  {date: new Date("2024-03"), rate: 2.9},
  {date: new Date("2024-04"), rate: 2.7},
  {date: new Date("2024-05"), rate: 2.9},
  {date: new Date("2024-06"), rate: 2.7},
  {date: new Date("2024-07"), rate: 2.5},
  {date: new Date("2024-08"), rate: 2.0},
  {date: new Date("2024-09"), rate: 1.6},
  {date: new Date("2024-10"), rate: 2.0},
  {date: new Date("2024-11"), rate: 1.9},
  {date: new Date("2024-12"), rate: 1.8},
  {date: new Date("2025-01"), rate: 1.9},
  {date: new Date("2025-02"), rate: 2.6},
  {date: new Date("2025-03"), rate: 2.3}
];

display(Plot.plot({
  title: "Year-over-year inflation rate (%)",
  width: 640,
  height: 280,
  y: {domain: [0, 4], grid: true, label: "Percent"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.ruleY([2], {stroke: "#999", strokeDasharray: "4,4"}),
    Plot.lineY(inflationData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(inflationData.slice(-1), {x: "date", y: "rate", fill: "#AF3C43", r: 5}),
    Plot.text(inflationData.slice(-1), {x: "date", y: "rate", text: d => d.rate.toFixed(1) + "%", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Prices by major component

Shelter remained the largest contributor to annual inflation at 4.6%, followed by food at 3.8%. Transportation prices increased 0.2%.

```js
const components = [
  {name: "Shelter", change: 4.6},
  {name: "Food", change: 3.8},
  {name: "Health and personal care", change: 3.0},
  {name: "Household operations", change: 2.6},
  {name: "Alcoholic beverages and tobacco", change: 2.1},
  {name: "Recreation and education", change: 0.9},
  {name: "Clothing and footwear", change: 0.6},
  {name: "Transportation", change: 0.2}
];

display(Plot.plot({
  title: "Year-over-year change by component (%)",
  width: 640,
  height: 320,
  marginLeft: 180,
  x: {domain: [-1, 5], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(components, {
      y: "name",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(components, {
      y: "name",
      x: "change",
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      dx: d => d.change >= 0 ? 20 : -20,
      fill: "currentColor"
    })
  ]
}));
```

## Summary table

| Indicator | March 2025 | Change from February | Change from March 2024 |
|-----------|----------:|------------------:|---------------------:|
| All-items CPI (YoY) | +2.3% | -0.3 pp | -0.6 pp |
| Food | +3.8% | — | — |
| Shelter | +4.6% | — | — |
| Transportation | +0.2% | — | — |

<div class="note-to-readers">

**Note to readers**

The Consumer Price Index measures the rate of price change experienced by Canadian consumers. It is calculated by comparing the cost of a fixed basket of goods and services purchased by consumers over time.

The CPI is not seasonally adjusted. Month-to-month movements can reflect seasonal patterns in addition to underlying price trends.

This is a backfill article covering March 2025 data, published as part of the D-AI-LY's historical coverage initiative.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0004](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810000401)
**Survey:** Consumer Price Index
**Reference period:** March 2025
**DOI:** [https://doi.org/10.25318/1810000401-eng](https://doi.org/10.25318/1810000401-eng)

</div>
