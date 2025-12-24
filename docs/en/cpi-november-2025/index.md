---
title: Consumer prices up 2.2% year over year in November 2025
toc: false
---

# Consumer prices up 2.2% year over year in November 2025

<p class="release-date">Released: December 22, 2025</p>

<div class="highlights">

**Highlights**

- The Consumer Price Index rose 2.2% year over year in November 2025
- Food costs increased 4.2%, the largest contributor to inflation
- Household operations, furnishings and equipment prices rose 3.3% compared to November last year
- Manitoba recorded the highest increase at 3.3%

</div>

The Consumer Price Index (CPI) stood at 165.4 in November 2025, up 2.2% compared with the same month a year earlier. A year ago, the index was 161.8.

On a month-over-month basis, the index increased 0.06% from 165.3 in October 2025 to 165.4 in November 2025.

Over the past two years, the year-over-year inflation rate has ranged from 1.6% to 3.4%.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 18-10-0004
const cpiData = [
  {date: new Date("2023-12"), value: 158.3},
  {date: new Date("2024-01"), value: 158.3},
  {date: new Date("2024-02"), value: 158.8},
  {date: new Date("2024-03"), value: 159.8},
  {date: new Date("2024-04"), value: 160.6},
  {date: new Date("2024-05"), value: 161.5},
  {date: new Date("2024-06"), value: 161.4},
  {date: new Date("2024-07"), value: 162.1},
  {date: new Date("2024-08"), value: 161.8},
  {date: new Date("2024-09"), value: 161.1},
  {date: new Date("2024-10"), value: 161.8},
  {date: new Date("2024-11"), value: 161.8},
  {date: new Date("2024-12"), value: 161.2},
  {date: new Date("2025-01"), value: 161.3},
  {date: new Date("2025-02"), value: 163.0},
  {date: new Date("2025-03"), value: 163.5},
  {date: new Date("2025-04"), value: 163.4},
  {date: new Date("2025-05"), value: 164.3},
  {date: new Date("2025-06"), value: 164.4},
  {date: new Date("2025-07"), value: 164.9},
  {date: new Date("2025-08"), value: 164.8},
  {date: new Date("2025-09"), value: 164.9},
  {date: new Date("2025-10"), value: 165.3},
  {date: new Date("2025-11"), value: 165.4}
];

display(Plot.plot({
  title: "Consumer Price Index, December 2023 to November 2025",
  width: 680,
  height: 300,
  y: {grid: true, label: "↑ Index (2002=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(cpiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(cpiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(cpiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Year-over-year inflation trend

```js
// Real YoY inflation rates calculated from Table 18-10-0004
const inflationData = [
  {date: new Date("2025-06"), rate: 1.9},  // 164.4 vs 161.4
  {date: new Date("2025-07"), rate: 1.7},  // 164.9 vs 162.1
  {date: new Date("2025-08"), rate: 1.9},  // 164.8 vs 161.8
  {date: new Date("2025-09"), rate: 2.4},  // 164.9 vs 161.1
  {date: new Date("2025-10"), rate: 2.2},  // 165.3 vs 161.8
  {date: new Date("2025-11"), rate: 2.2}   // 165.4 vs 161.8
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

**Source:** Statistics Canada, [Table 18-10-0004](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810000401)
**Survey:** Consumer Price Index
**Reference period:** November 2025
**DOI:** [https://doi.org/10.25318/1810000401-eng](https://doi.org/10.25318/1810000401-eng)

</div>
