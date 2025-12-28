---
title: Airline passengers down 1.9% in August 2025 from summer peak
toc: false
---

# Airline passengers down 1.9% in August 2025 from summer peak

<p class="release-date">Released: October 23, 2025</p>

<div class="highlights">

- Major Canadian airlines carried 8.1 million passengers in August 2025, down 1.9% from July
- Year-over-year, passenger volumes rose 3.7% compared with August 2024
- August marked a slight decline from July's summer peak of 8.3 million
- Load factor remained strong at 84.2%

</div>

Major Canadian airlines carried 8.1 million passengers in August 2025, down 1.9% from July's peak of 8.3 million. Despite the monthly decline, passenger volumes remained elevated during the peak summer travel season.

Compared with August 2024, passenger volumes increased 3.7%, continuing the year-over-year recovery trend observed throughout 2025.

## Monthly passenger trends

```js
import * as Plot from "npm:@observablehq/plot";

const passengerData = [
  {date: new Date("2023-08"), value: 7.58},
  {date: new Date("2023-09"), value: 6.85},
  {date: new Date("2023-10"), value: 6.72},
  {date: new Date("2023-11"), value: 6.21},
  {date: new Date("2023-12"), value: 7.05},
  {date: new Date("2024-01"), value: 6.65},
  {date: new Date("2024-02"), value: 6.25},
  {date: new Date("2024-03"), value: 7.18},
  {date: new Date("2024-04"), value: 6.75},
  {date: new Date("2024-05"), value: 6.88},
  {date: new Date("2024-06"), value: 7.28},
  {date: new Date("2024-07"), value: 8.02},
  {date: new Date("2024-08"), value: 7.85},
  {date: new Date("2024-09"), value: 7.04},
  {date: new Date("2024-10"), value: 6.99},
  {date: new Date("2024-11"), value: 6.49},
  {date: new Date("2024-12"), value: 7.32},
  {date: new Date("2025-01"), value: 6.90},
  {date: new Date("2025-02"), value: 6.49},
  {date: new Date("2025-03"), value: 7.45},
  {date: new Date("2025-04"), value: 7.00},
  {date: new Date("2025-05"), value: 7.14},
  {date: new Date("2025-06"), value: 7.55},
  {date: new Date("2025-07"), value: 8.30},
  {date: new Date("2025-08"), value: 8.14}
];

display(Plot.plot({
  title: "Airline passengers, August 2023 to August 2025 (millions)",
  width: 680,
  height: 300,
  y: {domain: [5.5, 9], grid: true, label: "Millions of passengers"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(passengerData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(passengerData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(passengerData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1) + "M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Monthly change in 2025

Air travel volumes in 2025 peaked in July at 8.3 million passengers, with August showing a slight decline as summer travel began to wind down.

```js
const momData = [
  {month: "Jan", change: -5.7},
  {month: "Feb", change: -5.9},
  {month: "Mar", change: 14.8},
  {month: "Apr", change: -6.0},
  {month: "May", change: 2.0},
  {month: "Jun", change: 5.7},
  {month: "Jul", change: 9.9},
  {month: "Aug", change: -1.9}
];

display(Plot.plot({
  title: "Month-over-month change in airline passengers, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"]
  },
  y: {grid: true, label: "Percent change", domain: [-10, 18]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(momData, {
      x: "month",
      y: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32"
    }),
    Plot.text(momData, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 1.0 : d.change - 1.0,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      fontSize: 9
    })
  ]
}));
```

## Summary table

| Indicator | August 2025 | Change from July | Change from August 2024 |
|-----------|------------:|-----------------:|------------------------:|
| Passengers (millions) | 8.14 | -1.9% | +3.7% |

<div class="note-to-readers">

**Note to readers**

Data cover the operating and financial statistics for major Canadian air carriers. Passenger counts include both domestic and international travel on Canadian carriers.

This is a backfill article covering August 2025 data, published as part of the D-AI-LY's historical coverage initiative.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 23-10-0079](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2310007901)
**Survey:** Monthly Civil Aviation Survey
**Reference period:** August 2025
**DOI:** [https://doi.org/10.25318/2310007901-eng](https://doi.org/10.25318/2310007901-eng)

</div>
