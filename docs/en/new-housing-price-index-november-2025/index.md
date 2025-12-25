---
title: New housing prices unchanged in November 2025
toc: false
---

# New housing prices unchanged in November 2025

<p class="release-date">Released: December 19, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- The New Housing Price Index was unchanged (0.0%) in November 2025
- Year over year, new housing prices were down 1.9%
- Ottawa-Gatineau recorded the highest index value at 160.7
- Montreal followed at 158.2, while Calgary was at 130.2

</div>

The New Housing Price Index (NHPI) was unchanged in November 2025 compared with October. Year over year, the index fell 1.9%, continuing a trend of declining new home prices.

The flat monthly reading reflects stabilizing conditions in the new housing market, following several months of modest declines.

```js
import * as Plot from "npm:@observablehq/plot";

const nhpiData = [
  {date: new Date("2024-11"), value: 124.6},
  {date: new Date("2024-12"), value: 124.5},
  {date: new Date("2025-01"), value: 124.4},
  {date: new Date("2025-02"), value: 124.5},
  {date: new Date("2025-03"), value: 124.5},
  {date: new Date("2025-04"), value: 124.0},
  {date: new Date("2025-05"), value: 123.7},
  {date: new Date("2025-06"), value: 123.4},
  {date: new Date("2025-07"), value: 123.3},
  {date: new Date("2025-08"), value: 122.9},
  {date: new Date("2025-09"), value: 122.7},
  {date: new Date("2025-10"), value: 122.2},
  {date: new Date("2025-11"), value: 122.2}
];

display(Plot.plot({
  title: "New Housing Price Index, November 2024 to November 2025 (2016=100)",
  width: 680,
  height: 300,
  y: {domain: [120, 126], grid: true, label: "Index (2016=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(nhpiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(nhpiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(nhpiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Prices by city

Ottawa-Gatineau (Ontario part) recorded the highest New Housing Price Index value at 160.7 in November, indicating new home prices 60.7% above the 2016 base period. Montreal followed at 158.2.

Among major cities, Calgary showed more moderate price growth at 130.2, while Kitchener-Cambridge-Waterloo was at 153.4.

```js
const cities = [
  {city: "Ottawa-Gatineau", value: 160.7},
  {city: "Montreal", value: 158.2},
  {city: "Kitchener-Cambridge-Waterloo", value: 153.4},
  {city: "Quebec (province)", value: 148.7},
  {city: "Winnipeg", value: 145.0},
  {city: "Windsor", value: 144.5},
  {city: "London", value: 137.8},
  {city: "Calgary", value: 130.2}
];

display(Plot.plot({
  title: "New Housing Price Index by city, November 2025 (2016=100)",
  width: 640,
  height: 300,
  marginLeft: 180,
  marginRight: 60,
  x: {grid: true, label: "Index (2016=100)"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(cities, {
      y: "city",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(cities, {
      y: "city",
      x: 170,
      text: d => d.value.toFixed(1),
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

The New Housing Price Index measures changes over time in contractors' selling prices of new residential houses. The index uses 2016 as the base period (2016=100).

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0205](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810020501)
**Survey:** New Housing Price Index
**Reference period:** November 2025
**DOI:** [https://doi.org/10.25318/1810020501-eng](https://doi.org/10.25318/1810020501-eng)

</div>
