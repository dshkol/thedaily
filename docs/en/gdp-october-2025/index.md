---
title: Real GDP down 0.3% in October 2025
toc: false
---

# Real GDP down 0.3% in October 2025

<p class="release-date">Released: December 23, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Real gross domestic product decreased 0.3% in October 2025
- Year over year, real GDP was up 0.4% compared with October 2024
- The services-producing sector accounted for the largest share of output
- Manufacturing and construction contributed to the monthly decline

</div>

Real gross domestic product (GDP) fell 0.3% in October 2025, following a gain of 0.2% in September. Year over year, real GDP was up 0.4% compared with October 2024.

The monthly decline was broad-based, with declines in both goods-producing and services-producing industries.

```js
import * as Plot from "npm:@observablehq/plot";

const gdpData = [
  {date: new Date("2024-10"), value: 2317.1},
  {date: new Date("2024-11"), value: 2319.8},
  {date: new Date("2024-12"), value: 2320.5},
  {date: new Date("2025-01"), value: 2321.2},
  {date: new Date("2025-02"), value: 2323.0},
  {date: new Date("2025-03"), value: 2322.4},
  {date: new Date("2025-04"), value: 2319.8},
  {date: new Date("2025-05"), value: 2318.5},
  {date: new Date("2025-06"), value: 2320.1},
  {date: new Date("2025-07"), value: 2322.8},
  {date: new Date("2025-08"), value: 2324.2},
  {date: new Date("2025-09"), value: 2325.9},
  {date: new Date("2025-10"), value: 2318.0}
];

display(Plot.plot({
  title: "Real GDP, October 2024 to October 2025 (billions of chained 2017 dollars)",
  width: 680,
  height: 300,
  y: {domain: [2310, 2330], grid: true, label: "Billions $ (2017 chained)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(gdpData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(gdpData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(gdpData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(0) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Output by sector

The services-producing sector continued to dominate the Canadian economy, representing approximately two-thirds of total output. Real estate, rental and leasing remained the largest single industry.

Goods-producing industries, including manufacturing and construction, saw declines in October.

| Sector | Share of GDP |
|--------|-------------|
| Services-producing industries | ~67% |
| Goods-producing industries | ~33% |

<div class="note-to-readers">

## Note to readers

Real GDP by industry is measured at basic prices in chained 2017 dollars. The estimates are seasonally adjusted at annual rates.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 36-10-0434](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3610043401)
**Survey:** Monthly Gross Domestic Product by Industry
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/3610043401-eng](https://doi.org/10.25318/3610043401-eng)

</div>
