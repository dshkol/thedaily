---
title: Manufacturing sales up 3.6% in September 2025
toc: false
---

# Manufacturing sales up 3.6% in September 2025

<p class="release-date">Released: November 15, 2025</p>

<div class="highlights">

- Manufacturing sales rose 3.6% to $72.2 billion in September 2025
- This was the largest monthly gain since January 2025
- Year over year, sales were up 3.0%

</div>

Manufacturing sales increased 3.6% to $72.2 billion in September 2025, rebounding after a 1.1% decline in August. This represented the largest monthly gain since January, when sales rose 1.4%.

On a year-over-year basis, manufacturing sales were up 3.0% compared with September 2024, when sales totalled $70.2 billion.

## Sales trend

Manufacturing sales have fluctuated through 2025, with declines in the spring followed by a recovery in the summer months. The September gain brought sales near the levels seen at the start of the year.

```js
import * as Plot from "npm:@observablehq/plot";

const salesData = [
  {date: new Date("2024-01-01"), value: 70.18},
  {date: new Date("2024-02-01"), value: 71.66},
  {date: new Date("2024-03-01"), value: 70.57},
  {date: new Date("2024-04-01"), value: 71.50},
  {date: new Date("2024-05-01"), value: 71.71},
  {date: new Date("2024-06-01"), value: 70.35},
  {date: new Date("2024-07-01"), value: 71.55},
  {date: new Date("2024-08-01"), value: 70.30},
  {date: new Date("2024-09-01"), value: 70.15},
  {date: new Date("2024-10-01"), value: 71.04},
  {date: new Date("2024-11-01"), value: 71.54},
  {date: new Date("2024-12-01"), value: 71.80},
  {date: new Date("2025-01-01"), value: 72.79},
  {date: new Date("2025-02-01"), value: 72.42},
  {date: new Date("2025-03-01"), value: 71.28},
  {date: new Date("2025-04-01"), value: 69.34},
  {date: new Date("2025-05-01"), value: 68.29},
  {date: new Date("2025-06-01"), value: 68.93},
  {date: new Date("2025-07-01"), value: 70.51},
  {date: new Date("2025-08-01"), value: 69.75},
  {date: new Date("2025-09-01"), value: 72.23}
];

display(Plot.plot({
  title: "Manufacturing sales, Canada (billions of dollars, seasonally adjusted)",
  width: 700,
  height: 400,
  y: {
    domain: [67, 74],
    grid: true,
    label: "Billions ($)"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(salesData, {x: "date", y: "value", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.filter(d => d.date.getTime() === new Date("2025-09-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#AF3C43",
      r: 5
    }),
    Plot.tip(salesData.filter(d => d.date.getTime() === new Date("2025-09-01").getTime()), {
      x: "date",
      y: "value",
      title: d => `Sept 2025: $${d.value.toFixed(1)}B`
    })
  ]
}));
```

## Monthly changes in 2025

Sales have been volatile in 2025, with the September gain following declines in March through May.

```js
const monthlyChanges = [
  {month: "Jan", change: 1.38},
  {month: "Feb", change: -0.52},
  {month: "Mar", change: -1.57},
  {month: "Apr", change: -2.73},
  {month: "May", change: -1.51},
  {month: "Jun", change: 0.94},
  {month: "Jul", change: 2.28},
  {month: "Aug", change: -1.07},
  {month: "Sep", change: 3.56}
];

display(Plot.plot({
  title: "Month-over-month change in manufacturing sales, 2025 (%)",
  width: 700,
  height: 350,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"]
  },
  y: {
    grid: true,
    label: "Percent change",
    domain: [-4, 5]
  },
  marks: [
    Plot.ruleY([0]),
    Plot.barY(monthlyChanges, {
      x: "month",
      y: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32"
    }),
    Plot.text(monthlyChanges, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.3 : d.change - 0.3,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      fontSize: 10
    })
  ]
}));
```

## Summary table

| Indicator | September 2025 | Change from August | Change from September 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| Manufacturing sales ($ billions) | 72.2 | +3.6% | +3.0% |

<div class="note-to-readers">

**Note to readers**

Manufacturing sales are expressed in current dollars and are seasonally adjusted. The Monthly Survey of Manufacturing covers all manufacturing industries in Canada.

This is a backfill article covering data from September 2025, published as part of the D-AI-LY's historical coverage initiative.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 16-10-0047](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1610004701)
**Survey:** Monthly Survey of Manufacturing
**Reference period:** September 2025
**DOI:** [https://doi.org/10.25318/1610004701-eng](https://doi.org/10.25318/1610004701-eng)

</div>
