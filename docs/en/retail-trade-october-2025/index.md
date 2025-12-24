---
title: Retail sales down 0.2% in October 2025
toc: false
---

# Retail sales down 0.2% in October 2025

<p class="release-date">Released: December 20, 2025</p>

<div class="highlights">

**Highlights**

- Retail sales decreased 0.2% to $69.4 billion in October 2025
- On a year-over-year basis, retail sales rose 2.0% compared with October 2024
- Clothing and clothing accessories retailers recorded the largest year-over-year increase at 9.8%
- Gasoline stations and fuel vendors declined 3.0% compared with October 2024

</div>

Retail sales decreased 0.2% to $69.4 billion in October 2025, following a decline of 0.9% in September. Excluding motor vehicle and parts dealers, retail sales were down 0.3%.

On a year-over-year basis, retail sales increased 2.0% compared with October 2024. In volume terms, retail sales rose 1.2% from a year earlier.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 20-10-0056 (values in $ billions)
const retailData = [
  {date: new Date("2023-01"), value: 66.3},
  {date: new Date("2023-02"), value: 65.7},
  {date: new Date("2023-03"), value: 65.3},
  {date: new Date("2023-04"), value: 65.6},
  {date: new Date("2023-05"), value: 65.7},
  {date: new Date("2023-06"), value: 66.0},
  {date: new Date("2023-07"), value: 65.9},
  {date: new Date("2023-08"), value: 65.9},
  {date: new Date("2023-09"), value: 66.6},
  {date: new Date("2023-10"), value: 66.5},
  {date: new Date("2023-11"), value: 66.6},
  {date: new Date("2023-12"), value: 66.3},
  {date: new Date("2024-01"), value: 66.1},
  {date: new Date("2024-02"), value: 66.2},
  {date: new Date("2024-03"), value: 66.2},
  {date: new Date("2024-04"), value: 66.8},
  {date: new Date("2024-05"), value: 66.0},
  {date: new Date("2024-06"), value: 65.9},
  {date: new Date("2024-07"), value: 66.9},
  {date: new Date("2024-08"), value: 67.1},
  {date: new Date("2024-09"), value: 67.5},
  {date: new Date("2024-10"), value: 68.0},
  {date: new Date("2024-11"), value: 68.3},
  {date: new Date("2024-12"), value: 70.0},
  {date: new Date("2025-01"), value: 69.7},
  {date: new Date("2025-02"), value: 69.2},
  {date: new Date("2025-03"), value: 69.8},
  {date: new Date("2025-04"), value: 70.0},
  {date: new Date("2025-05"), value: 69.2},
  {date: new Date("2025-06"), value: 70.1},
  {date: new Date("2025-07"), value: 69.5},
  {date: new Date("2025-08"), value: 70.2},
  {date: new Date("2025-09"), value: 69.6},
  {date: new Date("2025-10"), value: 69.4}
];

display(Plot.plot({
  title: "Retail sales ($ billions), seasonally adjusted",
  width: 680,
  height: 300,
  y: {domain: [62, 72], grid: true, label: "$ billions"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Sales by sector

Motor vehicle and parts dealers, the largest retail subsector, recorded sales of $19.1 billion in October, up 0.6% from a year earlier. Food and beverage retailers sales were unchanged year over year at $13.0 billion.

Clothing and clothing accessories retailers recorded the largest year-over-year increase at 9.8%, reaching $3.1 billion in October 2025.

```js
const sectorData = [
  {sector: "Clothing and accessories", change: 9.8},
  {sector: "Miscellaneous retailers", change: 8.9},
  {sector: "Sporting goods, hobby, books", change: 7.3},
  {sector: "General merchandise", change: 4.8},
  {sector: "Health and personal care", change: 4.0},
  {sector: "Furniture, electronics, appliances", change: 3.1},
  {sector: "Building materials and garden", change: 2.0},
  {sector: "Grocery and convenience", change: 1.3},
  {sector: "Motor vehicle and parts", change: 0.6},
  {sector: "Food and beverage", change: 0.0},
  {sector: "New car dealers", change: -1.6},
  {sector: "Gasoline stations and fuel", change: -3.0}
];

display(Plot.plot({
  title: "Year-over-year change by sector (%)",
  width: 640,
  height: 380,
  marginLeft: 180,
  marginRight: 60,
  x: {domain: [-5, 12], grid: true, label: "Percent change"},
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
      x: d => d.change >= 0 ? 12 : -5,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      textAnchor: d => d.change >= 0 ? "start" : "end",
      dx: d => d.change >= 0 ? 5 : -5,
      fill: "currentColor"
    })
  ]
}));
```

## Provincial variation

Retail sales increased in most provinces and territories on a year-over-year basis. New Brunswick recorded the highest year-over-year growth among provinces at 5.5%, while Saskatchewan recorded the smallest increase at 0.8%.

| Province | October 2025 ($ millions) | Year-over-year change |
|----------|--------------------------|----------------------|
| New Brunswick | 1,579 | +5.5% |
| Prince Edward Island | 307 | +4.6% |
| Newfoundland and Labrador | 1,068 | +2.6% |
| British Columbia | 9,444 | +2.6% |
| Ontario | 25,859 | +2.1% |
| Quebec | 15,618 | +1.9% |
| Nova Scotia | 1,874 | +1.6% |
| Alberta | 8,927 | +1.4% |
| Manitoba | 2,339 | +0.9% |
| Saskatchewan | 2,178 | +0.8% |

<div class="note-to-readers">

## Note to readers

This release covers monthly retail trade estimates. The estimates are based on a sample survey of retailers across Canada.

All data in this release are seasonally adjusted, unless otherwise indicated. For information on seasonal adjustment, see Seasonally adjusted data - Frequently asked questions.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>
