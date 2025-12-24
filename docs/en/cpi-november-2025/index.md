---
title: Consumer prices up 2.2% year over year in November 2025
toc: false
---

# Consumer prices up 2.2% year over year in November 2025

<p class="release-date">Released: December 22, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- The Consumer Price Index rose 2.2% year over year in November 2025, matching the increase in October
- Grocery prices rose 4.2%, driven by beef (+17.7%) and coffee (+27.8%)
- Lower prices for travel tours and slower rent growth put downward pressure on the CPI
- Manitoba led provincial increases at 3.3%; Prince Edward Island lowest at 1.4%

</div>

The Consumer Price Index (CPI) rose 2.2% on a year-over-year basis in November 2025, matching the increase in October. The index stood at 165.4, up from 161.8 a year earlier.

Lower prices for travel tours and traveller accommodation, in addition to slower growth for rent prices, put downward pressure on the all-items CPI. Offsetting this were higher prices for goods, driven by price increases for groceries as well as a smaller decline for gasoline prices.

Excluding gasoline, the CPI rose 2.6% for the third consecutive month.

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

## Grocery price inflation accelerates

Prices for food purchased from stores rose 4.2% year over year in November, the largest increase since late 2023. The main contributors to the acceleration were fresh fruit (+4.4%), led by higher prices for berries, and other food preparations (+6.6%).

Prices for fresh or frozen beef (+17.7%) and coffee (+27.8%) continued to be significant contributors to overall grocery inflation on an annual basis. Higher beef prices have been driven, in part, by lower cattle inventories in North America. Coffee prices have been impacted by adverse weather conditions in growing regions and rose amid American tariffs on coffee-producing countries.

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

## Regional highlights

On an annual basis in November, prices rose at a faster pace in five provinces, were unchanged in two, and rose at a slower pace in the remaining three compared with October.

Of all the provinces, prices accelerated the most in Manitoba, rising 3.3% year over year in November—the highest provincial rate. Higher shelter costs, particularly mortgage interest, were a key driver. At the other end, Prince Edward Island recorded the slowest increase at 1.4%, well below the national average of 2.2%.

Quebec (+3.0%) and New Brunswick (+2.7%) also exceeded the national rate, while Ontario (+1.9%) and Alberta (+1.9%) remained below it. The 1.9 percentage point spread between Manitoba and Prince Edward Island reflects significant regional variation in inflation pressures across the country.

| Province | Year-over-year change | vs. National |
|----------|----------------------|--------------|
| Manitoba | +3.3% | +1.1 pp |
| Quebec | +3.0% | +0.8 pp |
| New Brunswick | +2.7% | +0.5 pp |
| Nova Scotia | +2.4% | +0.2 pp |
| Newfoundland and Labrador | +2.2% | — |
| Saskatchewan | +2.1% | -0.1 pp |
| British Columbia | +2.0% | -0.2 pp |
| Ontario | +1.9% | -0.3 pp |
| Alberta | +1.9% | -0.3 pp |
| Prince Edward Island | +1.4% | -0.8 pp |

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
