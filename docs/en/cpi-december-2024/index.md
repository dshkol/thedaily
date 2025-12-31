---
title: Consumer prices up 1.8% year over year in December 2024
toc: false
---

# Consumer prices up 1.8% year over year in December 2024

<p class="release-date">Released: January 21, 2025</p>

<div class="highlights">

- The Consumer Price Index rose 1.8% year over year in December 2024
- Inflation declined from 1.9% in November
- Food prices increased 3.6% year over year
- Shelter costs rose 4.4%

</div>

The Consumer Price Index (CPI) rose 1.8% in December 2024 compared with the same month a year earlier, down from 1.9% in November. This marked the second consecutive month with inflation below the Bank of Canada's 2% target.

On a monthly basis, prices were unchanged from November 2024.

## Year-over-year inflation trend

Annual inflation continued its decline toward year-end, ending 2024 below the 2% target.

```js
import * as Plot from "npm:@observablehq/plot";

const inflationData = [
  {date: new Date("2023-12"), rate: 3.4},
  {date: new Date("2024-01"), rate: 2.9},
  {date: new Date("2024-02"), rate: 2.8},
  {date: new Date("2024-03"), rate: 2.9},
  {date: new Date("2024-04"), rate: 2.7},
  {date: new Date("2024-05"), rate: 2.9},
  {date: new Date("2024-06"), rate: 2.7},
  {date: new Date("2024-07"), rate: 2.5},
  {date: new Date("2024-08"), rate: 2.0},
  {date: new Date("2024-09"), rate: 1.6},
  {date: new Date("2024-10"), rate: 2.0},
  {date: new Date("2024-11"), rate: 1.9},
  {date: new Date("2024-12"), rate: 1.8}
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

Shelter remained the largest contributor to annual inflation at 4.4%, followed by food at 3.6%. Transportation prices declined 0.4%.

```js
const components = [
  {name: "Shelter", change: 4.4},
  {name: "Food", change: 3.6},
  {name: "Health and personal care", change: 2.8},
  {name: "Household operations", change: 2.4},
  {name: "Alcoholic beverages and tobacco", change: 2.0},
  {name: "Recreation and education", change: 0.7},
  {name: "Clothing and footwear", change: 0.4},
  {name: "Transportation", change: -0.4}
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
      fill: "#AF3C43",
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

| Indicator | December 2024 | Change from November | Change from December 2023 |
|-----------|----------:|------------------:|---------------------:|
| All-items CPI (YoY) | +1.8% | -0.1 pp | -1.6 pp |
| Food | +3.6% | — | — |
| Shelter | +4.4% | — | — |
| Transportation | -0.4% | — | — |

<div class="note-to-readers">

**Note to readers**

The Consumer Price Index measures the rate of price change experienced by Canadian consumers. It is calculated by comparing the cost of a fixed basket of goods and services purchased by consumers over time.

The CPI is not seasonally adjusted. Month-to-month movements can reflect seasonal patterns in addition to underlying price trends.

This is a backfill article covering December 2024 data, published as part of the D-AI-LY's historical coverage initiative.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0004](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810000401)
**Survey:** Consumer Price Index
**Reference period:** December 2024
**DOI:** [https://doi.org/10.25318/1810000401-eng](https://doi.org/10.25318/1810000401-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "cpi-december-2024", "en"));
```
