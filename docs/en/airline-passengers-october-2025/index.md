---
title: Airline passengers up 2.2% in October 2025
toc: false
---

# Airline passengers up 2.2% in October 2025

<p class="release-date">Released: December 23, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Major Canadian airlines carried 7.1 million passengers in October 2025, up 2.2% year over year
- Month over month, passenger volumes fell 1.0% from September
- Load factor rose to 83.3%, the first year-over-year increase since December 2024
- The summer peak saw 8.3 million passengers in July 2025

</div>

Major Canadian airlines carried 7.1 million passengers in October 2025, up 2.2% from October 2024. Compared with September, passenger volumes declined 1.0%, reflecting typical seasonal patterns as the summer travel season ends.

The passenger load factor — the percentage of available seats filled — reached 83.3% in October, marking a recovery in airline operating efficiency.

```js
import * as Plot from "npm:@observablehq/plot";

const passengerData = [
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
  {date: new Date("2025-08"), value: 8.14},
  {date: new Date("2025-09"), value: 7.22},
  {date: new Date("2025-10"), value: 7.15}
];

display(Plot.plot({
  title: "Airline passengers, October 2024 to October 2025 (millions)",
  width: 680,
  height: 300,
  y: {domain: [6, 9], grid: true, label: "Millions of passengers"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(passengerData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(passengerData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(passengerData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1) + "M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Seasonal patterns

Air travel in Canada follows a pronounced seasonal pattern, with the highest volumes during the summer months. July 2025 recorded the peak at 8.3 million passengers, driven by vacation travel.

The October decline from summer peaks is typical, as business and leisure travel normalizes after the summer holiday season.

| Month | Passengers (millions) | Year-over-year change |
|-------|----------------------|----------------------|
| October 2025 | 7.15 | +2.2% |
| September 2025 | 7.22 | — |
| August 2025 | 8.14 | — |
| July 2025 | 8.30 | — |

<div class="note-to-readers">

## Note to readers

Data cover the operating and financial statistics for major Canadian air carriers. Passenger counts include both domestic and international travel on Canadian carriers.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 23-10-0079](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2310007901)
**Survey:** Monthly Civil Aviation Survey
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/2310007901-eng](https://doi.org/10.25318/2310007901-eng)

</div>
