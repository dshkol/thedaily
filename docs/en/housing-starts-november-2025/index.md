---
title: Housing starts at 254,058 units in November 2025
toc: false
---

# Housing starts at 254,058 units in November 2025

<p class="release-date">Released: December 19, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Housing starts rose 9.4% to a seasonally adjusted annual rate of 254,058 units in November 2025
- Year over year, starts were down 5.0% compared with November 2024
- The Prairie provinces led with 71,000 units, followed by Quebec with 63,000 units
- Ontario recorded 55,000 units at a seasonally adjusted annual rate

</div>

Housing starts increased 9.4% to a seasonally adjusted annual rate of 254,058 units in November 2025, recovering from a decline in October. Compared with November 2024, starts were down 5.0%.

The monthly increase was broad-based across most provinces, reflecting improved construction activity heading into the winter months.

```js
import * as Plot from "npm:@observablehq/plot";

const startsData = [
  {date: new Date("2024-11"), value: 267},
  {date: new Date("2024-12"), value: 232},
  {date: new Date("2025-01"), value: 233},
  {date: new Date("2025-02"), value: 221},
  {date: new Date("2025-03"), value: 214},
  {date: new Date("2025-04"), value: 282},
  {date: new Date("2025-05"), value: 282},
  {date: new Date("2025-06"), value: 282},
  {date: new Date("2025-07"), value: 293},
  {date: new Date("2025-08"), value: 244},
  {date: new Date("2025-09"), value: 281},
  {date: new Date("2025-10"), value: 232},
  {date: new Date("2025-11"), value: 254}
];

display(Plot.plot({
  title: "Housing starts, November 2024 to November 2025 (thousands of units, SAAR)",
  width: 680,
  height: 300,
  y: {domain: [200, 310], grid: true, label: "Thousands of units"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(startsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(startsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(startsData.slice(-1), {x: "date", y: "value", text: d => d.value + "K", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Regional breakdown

The Prairie provinces recorded the highest level of housing starts at a seasonally adjusted annual rate of 71,000 units in November. Quebec followed with 63,000 units, while Ontario recorded 55,000 units.

British Columbia saw 42,000 units, while the Atlantic provinces combined for 23,000 units.

```js
const provinces = [
  {province: "Prairie provinces", value: 71},
  {province: "Quebec", value: 63},
  {province: "Ontario", value: 55},
  {province: "British Columbia", value: 42},
  {province: "Atlantic provinces", value: 23}
];

display(Plot.plot({
  title: "Housing starts by region, November 2025 (thousands of units, SAAR)",
  width: 640,
  height: 260,
  marginLeft: 140,
  marginRight: 60,
  x: {grid: true, label: "Thousands of units"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(provinces, {
      y: "province",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(provinces, {
      y: "province",
      x: 75,
      text: d => d.value + "K",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

Housing starts are reported as a seasonally adjusted annual rate (SAAR), which represents the number of housing units that would be started in a year if the current month's pace were maintained.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 34-10-0158](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3410015801)
**Survey:** Canada Mortgage and Housing Corporation, Housing Starts
**Reference period:** November 2025
**DOI:** [https://doi.org/10.25318/3410015801-eng](https://doi.org/10.25318/3410015801-eng)

</div>
