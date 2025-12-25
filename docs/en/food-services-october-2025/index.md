---
title: Food services sales up 0.6% in October 2025
toc: false
---

# Food services sales up 0.6% in October 2025

<p class="release-date">Released: December 25, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Food services and drinking places sales rose 0.6% to $8.5 billion in October 2025
- Year-over-year sales increased 5.2% compared with October 2024
- Limited-service eating places led with $3.9 billion in sales
- Full-service restaurants recorded $3.7 billion

</div>

Sales at food services and drinking places increased 0.6% to $8.5 billion in October 2025, following a 0.4% decline in September. Compared with October 2024, sales were up 5.2%.

The food services industry has shown steady growth throughout 2025, with sales trending upward since the start of the year.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 21-10-0019
const salesData = [
  {date: new Date("2024-10"), value: 8.11},
  {date: new Date("2024-11"), value: 8.23},
  {date: new Date("2024-12"), value: 8.24},
  {date: new Date("2025-01"), value: 8.27},
  {date: new Date("2025-02"), value: 8.24},
  {date: new Date("2025-03"), value: 8.40},
  {date: new Date("2025-04"), value: 8.47},
  {date: new Date("2025-05"), value: 8.51},
  {date: new Date("2025-06"), value: 8.49},
  {date: new Date("2025-07"), value: 8.46},
  {date: new Date("2025-08"), value: 8.51},
  {date: new Date("2025-09"), value: 8.48},
  {date: new Date("2025-10"), value: 8.53}
];

display(Plot.plot({
  title: "Food services and drinking places sales, October 2024 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [7.8, 8.8], grid: true, label: "Billions $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(salesData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(2) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Sales by establishment type

Limited-service eating places — which include fast food restaurants, coffee shops, and takeout establishments — accounted for the largest share of food services sales at $3.9 billion in October.

Full-service restaurants followed with $3.7 billion in sales. Special food services, including catering and food service contractors, reported $690 million, while drinking places (bars and pubs) totalled $201 million.

```js
const breakdown = [
  {type: "Limited-service eating places", value: 3.94},
  {type: "Full-service restaurants", value: 3.70},
  {type: "Special food services", value: 0.69},
  {type: "Drinking places", value: 0.20}
];

display(Plot.plot({
  title: "Food services sales by establishment type, October 2025 ($ billions)",
  width: 640,
  height: 260,
  marginLeft: 200,
  marginRight: 60,
  x: {grid: true, label: "Billions $"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(breakdown, {
      y: "type",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(breakdown, {
      y: "type",
      x: 4.2,
      text: d => "$" + d.value.toFixed(2) + "B",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

Food services and drinking places sales represent the total operating revenue from sales of food and beverages prepared on premises for immediate consumption. The estimates are seasonally adjusted.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 21-10-0019](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2110001901)
**Survey:** Monthly Survey of Food Services and Drinking Places
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/2110001901-eng](https://doi.org/10.25318/2110001901-eng)

</div>
