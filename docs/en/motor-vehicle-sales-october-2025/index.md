---
title: New motor vehicle sales down 3.1% in October 2025
toc: false
---

# New motor vehicle sales down 3.1% in October 2025

<p class="release-date">Released: December 28, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- New motor vehicle sales totalled 163,490 units in October 2025
- Sales fell 3.1% from September and 0.7% year over year
- Truck sales rose 1.1% year over year to 145,811 units
- Passenger car sales declined 13.4% from October 2024

</div>

New motor vehicle sales totalled 163,490 units in October 2025, down 3.1% from September and down 0.7% compared with October 2024. The decline was driven by a sharp drop in passenger car sales, while truck sales edged higher.

Trucks accounted for 89.2% of total new motor vehicle sales in October. Truck sales reached 145,811 units, up 1.1% from October 2024. Passenger car sales fell to 17,679 units, a 13.4% decline from the same month a year earlier.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 20-10-0085
const salesData = [
  {date: new Date("2023-01"), units: 103355},
  {date: new Date("2023-02"), units: 109580},
  {date: new Date("2023-03"), units: 152546},
  {date: new Date("2023-04"), units: 150339},
  {date: new Date("2023-05"), units: 170834},
  {date: new Date("2023-06"), units: 168850},
  {date: new Date("2023-07"), units: 147618},
  {date: new Date("2023-08"), units: 159668},
  {date: new Date("2023-09"), units: 164168},
  {date: new Date("2023-10"), units: 151978},
  {date: new Date("2023-11"), units: 144634},
  {date: new Date("2023-12"), units: 128827},
  {date: new Date("2024-01"), units: 118094},
  {date: new Date("2024-02"), units: 136410},
  {date: new Date("2024-03"), units: 173465},
  {date: new Date("2024-04"), units: 175815},
  {date: new Date("2024-05"), units: 185178},
  {date: new Date("2024-06"), units: 166941},
  {date: new Date("2024-07"), units: 168310},
  {date: new Date("2024-08"), units: 166153},
  {date: new Date("2024-09"), units: 166757},
  {date: new Date("2024-10"), units: 164692},
  {date: new Date("2024-11"), units: 161535},
  {date: new Date("2024-12"), units: 135511},
  {date: new Date("2025-01"), units: 121258},
  {date: new Date("2025-02"), units: 125402},
  {date: new Date("2025-03"), units: 189046},
  {date: new Date("2025-04"), units: 195659},
  {date: new Date("2025-05"), units: 194524},
  {date: new Date("2025-06"), units: 177219},
  {date: new Date("2025-07"), units: 179801},
  {date: new Date("2025-08"), units: 166524},
  {date: new Date("2025-09"), units: 168731},
  {date: new Date("2025-10"), units: 163490}
];

display(Plot.plot({
  title: "New motor vehicle sales, January 2023 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [80000, 220000], grid: true, label: "Units"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(salesData, {x: "date", y: "units", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.slice(-1), {x: "date", y: "units", fill: "#AF3C43", r: 5}),
    Plot.text(salesData.slice(-1), {x: "date", y: "units", text: d => (d.units/1000).toFixed(0) + "K", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Sales by vehicle type

Truck sales continued to dominate the Canadian vehicle market. In October 2025, trucks represented 145,811 units sold, compared with 17,679 passenger cars.

On a year-over-year basis, truck sales increased 1.1% while passenger car sales declined 13.4%. This continues a long-term trend of consumers shifting from passenger cars to trucks, including sport utility vehicles and pickup trucks.

```js
// Year-over-year percent change by vehicle type
const yoyData = [
  {type: "Trucks", yoy: 1.1},
  {type: "Passenger cars", yoy: -13.4}
];

display(Plot.plot({
  title: "Year-over-year change by vehicle type, October 2025",
  width: 500,
  height: 200,
  marginLeft: 120,
  marginRight: 60,
  x: {domain: [-20, 10], grid: true, label: "Year-over-year change (%)"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "type",
      x: "yoy",
      fill: "#AF3C43"
    }),
    Plot.text(yoyData, {
      y: "type",
      x: d => d.yoy >= 0 ? 10 : -20,
      text: d => (d.yoy >= 0 ? "+" : "") + d.yoy.toFixed(1) + "%",
      textAnchor: d => d.yoy >= 0 ? "end" : "start",
      fill: "currentColor",
      fontWeight: 600
    })
  ]
}));
```

## Summary

| Indicator | October 2025 | September 2025 | October 2024 | Monthly change | Year-over-year change |
|-----------|--------------|----------------|--------------|----------------|----------------------|
| Total new vehicles | 163,490 | 168,731 | 164,692 | -3.1% | -0.7% |
| Trucks | 145,811 | — | 144,273 | — | +1.1% |
| Passenger cars | 17,679 | — | 20,419 | — | -13.4% |

<div class="note-to-readers">

## Note to readers

New motor vehicle sales represent the number of new motor vehicles sold by dealers to consumers and businesses. Data are unadjusted for seasonality. Month-over-month comparisons should be interpreted with caution due to seasonal patterns in vehicle purchases.

The data reflect sales of vehicles at new motor vehicle dealerships and exclude sales of used vehicles. Trucks include sport utility vehicles, crossovers, minivans, vans, buses, and pickup trucks.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0085](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010008501)
**Survey:** New Motor Vehicle Sales Survey
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/2010008501-eng](https://doi.org/10.25318/2010008501-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "motor-vehicle-sales-october-2025", "en"));
```
