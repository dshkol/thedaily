---
title: Real gross domestic product down 0.3% in October 2025
toc: false
---

# Real gross domestic product down 0.3% in October 2025

<p class="release-date">Released: December 23, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Real gross domestic product decreased 0.3% in October 2025
- GDP stood at $2,325.9 billion in chained (2017) dollars
- On a year-over-year basis, real GDP increased 0.4%
- The decline followed a gain of 0.2% in September

</div>

Real gross domestic product (GDP) decreased 0.3% in October 2025, following a gain of 0.2% in September. On a year-over-year basis, real GDP was up 0.4% compared with October 2024.

Total GDP stood at $2,325.9 billion in chained (2017) dollars in October, down from $2,333.7 billion in September.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 36-10-0434
const gdpData = [
  {date: new Date("2023-01"), value: 2236.2},
  {date: new Date("2023-02"), value: 2243.8},
  {date: new Date("2023-03"), value: 2250.6},
  {date: new Date("2023-04"), value: 2250.7},
  {date: new Date("2023-05"), value: 2251.3},
  {date: new Date("2023-06"), value: 2248.4},
  {date: new Date("2023-07"), value: 2250.9},
  {date: new Date("2023-08"), value: 2251.9},
  {date: new Date("2023-09"), value: 2251.2},
  {date: new Date("2023-10"), value: 2253.5},
  {date: new Date("2023-11"), value: 2259.5},
  {date: new Date("2023-12"), value: 2256.7},
  {date: new Date("2024-01"), value: 2262.8},
  {date: new Date("2024-02"), value: 2276.5},
  {date: new Date("2024-03"), value: 2277.5},
  {date: new Date("2024-04"), value: 2285.6},
  {date: new Date("2024-05"), value: 2289.0},
  {date: new Date("2024-06"), value: 2294.1},
  {date: new Date("2024-07"), value: 2298.6},
  {date: new Date("2024-08"), value: 2301.3},
  {date: new Date("2024-09"), value: 2307.5},
  {date: new Date("2024-10"), value: 2317.1},
  {date: new Date("2024-11"), value: 2312.3},
  {date: new Date("2024-12"), value: 2317.0},
  {date: new Date("2025-01"), value: 2327.2},
  {date: new Date("2025-02"), value: 2322.4},
  {date: new Date("2025-03"), value: 2324.4},
  {date: new Date("2025-04"), value: 2320.9},
  {date: new Date("2025-05"), value: 2317.7},
  {date: new Date("2025-06"), value: 2317.1},
  {date: new Date("2025-07"), value: 2329.4},
  {date: new Date("2025-08"), value: 2328.1},
  {date: new Date("2025-09"), value: 2333.7},
  {date: new Date("2025-10"), value: 2325.9}
];

display(Plot.plot({
  title: "Real GDP at basic prices ($ billions, 2017 constant prices)",
  width: 680,
  height: 300,
  y: {domain: [2200, 2380], grid: true, label: "$ billions"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(gdpData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(gdpData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(gdpData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Industry performance

Manufacturing was the largest contributor to growth in October 2025, increasing 1.7%. Transportation and warehousing rose 1.1%, while mining, quarrying, and oil and gas extraction gained 0.5%.

Retail trade declined 0.8% in October, while construction fell 0.2%.

```js
const sectorData = [
  {sector: "Manufacturing", change: 1.72},
  {sector: "Transportation and warehousing", change: 1.10},
  {sector: "Goods-producing industries", change: 0.72},
  {sector: "Utilities", change: 0.58},
  {sector: "Mining, quarrying, and oil and gas", change: 0.54},
  {sector: "Wholesale trade", change: 0.52},
  {sector: "Agriculture, forestry, fishing, hunting", change: 0.32},
  {sector: "Public administration", change: 0.16},
  {sector: "Services-producing industries", change: 0.08},
  {sector: "Construction", change: -0.16},
  {sector: "Professional, scientific, technical", change: -0.17},
  {sector: "Retail trade", change: -0.84}
];

display(Plot.plot({
  title: "Month-over-month change by sector (%)",
  width: 640,
  height: 380,
  marginLeft: 220,
  marginRight: 70,
  x: {domain: [-1.5, 2.5], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(sectorData, {
      y: "sector",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(sectorData, {
      y: "sector",
      x: 2.5,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Goods and services sectors

| Sector | October 2025 ($ billions) | Monthly change |
|--------|--------------------------|----------------|
| All industries | 2,325.9 | -0.3% |
| Services-producing industries | 1,621.4 | +0.1% |
| Goods-producing industries | 704.5 | +0.7% |

*Source: Statistics Canada, Table 36-10-0434.*

<div class="note-to-readers">

## Note to readers

Real gross domestic product by industry measures the value added by each industry in the production of goods and services. It is calculated by removing the effect of price changes from the nominal value of production.

The data are presented at basic prices, which exclude taxes and subsidies on products.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 36-10-0434](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3610043401)
**Survey:** Gross Domestic Product by Industry
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/3610043401-eng](https://doi.org/10.25318/3610043401-eng)

</div>
