---
title: Consumer prices up 1.7% year over year in July 2025
---

# Consumer prices up 1.7% year over year in July 2025

<p class="release-date">Released: 2025-12-25</p>

<div class="metric-box">
  <div class="value">+1.7%</div>
  <div class="label">Year-over-year change in Consumer Price Index, July 2025</div>
</div>

The Consumer Price Index (CPI) rose 1.7% in July 2025 compared with the same month a year earlier. The index stood at 164.9, up from 161.8 in November 2024. On a monthly basis, prices increased 0.3% from October 2025.

<div class="highlights">

**Highlights**

- The Consumer Price Index rose 1.7% year over year in July 2025
- Food costs increased 4.2%, the largest contributor to inflation
- Household operations, furnishings and equipment prices rose 3.3% compared to July last year
- Manitoba recorded the highest increase at 3.3%

</div>

## Year-over-year inflation trend

```js
import * as Plot from "npm:@observablehq/plot";

const inflationData = [
  {date: new Date("2025-02"), rate: 2.6},
  {date: new Date("2025-03"), rate: 2.3},
  {date: new Date("2025-04"), rate: 1.7},
  {date: new Date("2025-05"), rate: 1.7},
  {date: new Date("2025-06"), rate: 1.9},
  {date: new Date("2025-07"), rate: 1.7}
];

display(Plot.plot({
  title: "Year-over-year inflation rate (%)",
  width: 640,
  height: 280,
  y: {domain: [0, 4], grid: true, label: "Percent"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.ruleY([1, 3], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.lineY(inflationData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(inflationData, {x: "date", y: "rate", fill: "#AF3C43", r: 4})
  ]
}));
```

## Prices by major component

Among the eight major components of the CPI, food prices showed the largest year-over-year increase at 4.2%. Mortgage interest costs and rent continued to put upward pressure on this category.

Food prices rose 4.2%.

```js
const components = [
  {name: "Food", change: 4.2},
  {name: "Household operations, furnishings and equipment", change: 3.3},
  {name: "Health and personal care", change: 3.0},
  {name: "Shelter", change: 2.3},
  {name: "Alcoholic beverages, tobacco products and recreational cannabis", change: 1.4},
  {name: "Clothing and footwear", change: 0.8},
  {name: "Transportation", change: 0.7},
  {name: "Recreation, education and reading", change: 0.4}
];

display(Plot.plot({
  title: "Year-over-year change by component (%)",
  width: 640,
  height: 320,
  marginLeft: 140,
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
      text: d => d.change.toFixed(1) + "%",
      dx: 20,
      fill: "currentColor"
    })
  ]
}));
```

## Provincial variation

Price increases varied across provinces and territories. Manitoba recorded the highest year-over-year increase at 3.3%, driven by rising shelter and transportation costs. Prince Edward Island showed the lowest increase at 1.4%.

| Province | Year-over-year change |
|----------|----------------------|
| Manitoba | +3.3% |
| Quebec | +3.0% |
| New Brunswick | +2.7% |
| Nova Scotia | +2.4% |
| Newfoundland and Labrador | +2.2% |
| Saskatchewan | +2.1% |
| British Columbia | +2.0% |
| Ontario | +1.9% |
| Alberta | +1.9% |
| Prince Edward Island | +1.4% |

<div class="note-to-readers">

## Note to readers

The Consumer Price Index measures the rate of price change experienced by Canadian consumers. It is calculated by comparing the cost of a fixed basket of goods and services purchased by consumers over time.

The CPI is not seasonally adjusted. Month-to-month movements can reflect seasonal patterns in addition to underlying price trends.

</div>

<div class="source-info">

**Source:** Statistics Canada, Table 18-10-0004
**Survey:** Consumer Price Index
**Reference period:** July 2025

</div>
