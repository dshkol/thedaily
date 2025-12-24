---
title: Employment up 54,000 in November 2025, unemployment rate falls to 6.5%
toc: false
---

# Employment up 54,000 in November 2025, unemployment rate falls to 6.5%

<p class="release-date">Released: December 5, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Employment increased by 54,000 (+0.3%) in November 2025
- The unemployment rate fell 0.4 percentage points to 6.5%
- Total employment rose 309,000 (+1.5%) compared with November 2024
- Part-time employment increased 63,000 from October

</div>

Employment rose by 54,000 (+0.3%) in November 2025, following a gain of 67,000 in October. The unemployment rate fell 0.4 percentage points to 6.5%, down from 6.9% in the previous month.

Total employment stood at 21.1 million in November 2025, an increase of 309,000 (+1.5%) compared with November 2024.

The number of unemployed persons declined by 80,000 to 1.48 million. On a year-over-year basis, the number of unemployed fell by 63,000 compared with November 2024.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 14-10-0287
const urData = [
  {date: new Date("2023-01"), rate: 5.1},
  {date: new Date("2023-02"), rate: 5.1},
  {date: new Date("2023-03"), rate: 5.0},
  {date: new Date("2023-04"), rate: 5.1},
  {date: new Date("2023-05"), rate: 5.2},
  {date: new Date("2023-06"), rate: 5.4},
  {date: new Date("2023-07"), rate: 5.5},
  {date: new Date("2023-08"), rate: 5.5},
  {date: new Date("2023-09"), rate: 5.5},
  {date: new Date("2023-10"), rate: 5.7},
  {date: new Date("2023-11"), rate: 5.7},
  {date: new Date("2023-12"), rate: 5.8},
  {date: new Date("2024-01"), rate: 5.7},
  {date: new Date("2024-02"), rate: 5.9},
  {date: new Date("2024-03"), rate: 6.1},
  {date: new Date("2024-04"), rate: 6.2},
  {date: new Date("2024-05"), rate: 6.3},
  {date: new Date("2024-06"), rate: 6.4},
  {date: new Date("2024-07"), rate: 6.4},
  {date: new Date("2024-08"), rate: 6.7},
  {date: new Date("2024-09"), rate: 6.6},
  {date: new Date("2024-10"), rate: 6.6},
  {date: new Date("2024-11"), rate: 6.9},
  {date: new Date("2024-12"), rate: 6.7},
  {date: new Date("2025-01"), rate: 6.6},
  {date: new Date("2025-02"), rate: 6.6},
  {date: new Date("2025-03"), rate: 6.7},
  {date: new Date("2025-04"), rate: 6.9},
  {date: new Date("2025-05"), rate: 7.0},
  {date: new Date("2025-06"), rate: 6.9},
  {date: new Date("2025-07"), rate: 6.9},
  {date: new Date("2025-08"), rate: 7.1},
  {date: new Date("2025-09"), rate: 7.1},
  {date: new Date("2025-10"), rate: 6.9},
  {date: new Date("2025-11"), rate: 6.5}
];

display(Plot.plot({
  title: "Unemployment rate, January 2023 to November 2025",
  width: 680,
  height: 300,
  y: {domain: [4, 8], grid: true, label: "Percent"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.lineY(urData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(urData.slice(-1), {x: "date", y: "rate", fill: "#AF3C43", r: 5}),
    Plot.text(urData.slice(-1), {x: "date", y: "rate", text: d => d.rate.toFixed(1) + "%", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Employment trend

```js
// Real data from Statistics Canada Table 14-10-0287
const empData = [
  {date: new Date("2023-01"), employment: 20114},
  {date: new Date("2023-02"), employment: 20153},
  {date: new Date("2023-03"), employment: 20214},
  {date: new Date("2023-04"), employment: 20258},
  {date: new Date("2023-05"), employment: 20247},
  {date: new Date("2023-06"), employment: 20333},
  {date: new Date("2023-07"), employment: 20352},
  {date: new Date("2023-08"), employment: 20412},
  {date: new Date("2023-09"), employment: 20465},
  {date: new Date("2023-10"), employment: 20494},
  {date: new Date("2023-11"), employment: 20519},
  {date: new Date("2023-12"), employment: 20533},
  {date: new Date("2024-01"), employment: 20577},
  {date: new Date("2024-02"), employment: 20608},
  {date: new Date("2024-03"), employment: 20615},
  {date: new Date("2024-04"), employment: 20701},
  {date: new Date("2024-05"), employment: 20698},
  {date: new Date("2024-06"), employment: 20716},
  {date: new Date("2024-07"), employment: 20713},
  {date: new Date("2024-08"), employment: 20743},
  {date: new Date("2024-09"), employment: 20779},
  {date: new Date("2024-10"), employment: 20783},
  {date: new Date("2024-11"), employment: 20826},
  {date: new Date("2024-12"), employment: 20917},
  {date: new Date("2025-01"), employment: 20993},
  {date: new Date("2025-02"), employment: 20995},
  {date: new Date("2025-03"), employment: 20962},
  {date: new Date("2025-04"), employment: 20969},
  {date: new Date("2025-05"), employment: 20978},
  {date: new Date("2025-06"), employment: 21061},
  {date: new Date("2025-07"), employment: 21020},
  {date: new Date("2025-08"), employment: 20955},
  {date: new Date("2025-09"), employment: 21015},
  {date: new Date("2025-10"), employment: 21082},
  {date: new Date("2025-11"), employment: 21136}
];

display(Plot.plot({
  title: "Employment (thousands), January 2023 to November 2025",
  width: 680,
  height: 300,
  y: {domain: [19500, 21500], grid: true, label: "Thousands"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(empData, {x: "date", y: "employment", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(empData.slice(-1), {x: "date", y: "employment", fill: "#AF3C43", r: 5}),
    Plot.text(empData.slice(-1), {x: "date", y: "employment", text: d => (d.employment/1000).toFixed(1) + "M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Labour market summary

| Indicator | November 2025 | October 2025 | November 2024 | Monthly change | Year-over-year change |
|-----------|---------------|--------------|---------------|----------------|----------------------|
| Employment (thousands) | 21,135.5 | 21,081.9 | 20,826.4 | +53.6 | +309.1 |
| Unemployment (thousands) | 1,477.8 | 1,557.3 | 1,540.6 | -79.5 | -62.8 |
| Unemployment rate | 6.5% | 6.9% | 6.9% | -0.4 pp | -0.4 pp |
| Participation rate | 65.1% | 65.3% | 65.4% | -0.2 pp | -0.3 pp |
| Employment rate | 60.9% | 60.8% | 60.9% | +0.1 pp | 0.0 pp |

## Full-time and part-time employment

Part-time employment increased by 63,000 (+1.6%) in November. On a year-over-year basis, part-time employment rose 173,000 (+4.6%) compared with November 2024.

Full-time employment was little changed in November.

```js
const typeData = [
  {type: "Part-time employment", change: 63.0, yoy: 4.6},
  {type: "Full-time employment", change: -9.4, yoy: 0.6}
];

display(Plot.plot({
  title: "Monthly employment change by type (thousands)",
  width: 500,
  height: 200,
  marginLeft: 150,
  marginRight: 50,
  x: {domain: [-20, 70], grid: true, label: "Change (thousands)"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(typeData, {
      y: "type",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32"
    }),
    Plot.text(typeData, {
      y: "type",
      x: d => d.change >= 0 ? 70 : -20,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1),
      textAnchor: d => d.change >= 0 ? "start" : "end",
      dx: d => d.change >= 0 ? 5 : -5,
      fill: "currentColor"
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

The Labour Force Survey (LFS) estimates are based on a sample and are therefore subject to sampling variability. Estimates may differ from one month to another due to sampling variability.

The survey collects data on the labour market activity of the population aged 15 years and over. The target population of the LFS covers the civilian, non-institutionalized population.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 14-10-0287](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410028701)
**Survey:** Labour Force Survey
**Reference period:** November 2025
**DOI:** [https://doi.org/10.25318/1410028701-eng](https://doi.org/10.25318/1410028701-eng)

</div>
