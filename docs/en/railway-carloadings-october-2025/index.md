---
title: Railway freight traffic down 0.9% year over year in October 2025
toc: false
---

# Railway freight traffic down 0.9% year over year in October 2025

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Total railway freight traffic was 33.2 million tonnes in October 2025, down 0.9% from October 2024
- Month over month, traffic increased 5.8% from September 2025
- Western division accounted for 66.6% of total carloadings at 22.1 million tonnes
- Wheat shipments rose 18.7% year over year, while canola fell 38.2%

</div>

Canadian railways transported 33.2 million tonnes of freight in October 2025, down 0.9% compared with the same month a year earlier. On a monthly basis, traffic increased 5.8% from 31.4 million tonnes in September 2025.

The decline in year-over-year traffic was driven by lower shipments of potash and canola, which more than offset gains in wheat and iron ore.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 23-10-0216
const carloadingsData = [
  {date: new Date("2024-10"), value: 33.5},
  {date: new Date("2024-11"), value: 31.2},
  {date: new Date("2024-12"), value: 31.4},
  {date: new Date("2025-01"), value: 32.2},
  {date: new Date("2025-02"), value: 26.8},
  {date: new Date("2025-03"), value: 33.4},
  {date: new Date("2025-04"), value: 32.8},
  {date: new Date("2025-05"), value: 33.0},
  {date: new Date("2025-06"), value: 30.0},
  {date: new Date("2025-07"), value: 30.9},
  {date: new Date("2025-08"), value: 30.4},
  {date: new Date("2025-09"), value: 31.4},
  {date: new Date("2025-10"), value: 33.2}
];

display(Plot.plot({
  title: "Total railway freight traffic, October 2024 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [24, 36], grid: true, label: "Million tonnes"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(carloadingsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(carloadingsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(carloadingsData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1) + "M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Regional breakdown

The Western division transported 22.1 million tonnes in October, accounting for 66.6% of total Canadian railway freight. The Eastern division handled 11.1 million tonnes, or 33.4% of the total.

```js
const regionalData = [
  {region: "Western division", value: 22.1, share: 66.6},
  {region: "Eastern division", value: 11.1, share: 33.4}
];

display(Plot.plot({
  title: "Railway freight by division, October 2025 (million tonnes)",
  width: 500,
  height: 200,
  marginLeft: 130,
  marginRight: 80,
  x: {grid: true, label: "Million tonnes"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(regionalData, {
      y: "region",
      x: "value",
      fill: "#AF3C43"
    }),
    Plot.text(regionalData, {
      y: "region",
      x: 24,
      text: d => d.value.toFixed(1) + "M (" + d.share.toFixed(1) + "%)",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Commodities

Iron ore and concentrates led all commodities at 4.8 million tonnes, up 3.8% from October 2024. Wheat shipments totalled 3.2 million tonnes, an increase of 18.7% year over year.

Coal traffic declined 4.6% to 3.1 million tonnes. Potash shipments fell 10.8% to 1.9 million tonnes, while canola dropped 38.2% to 0.8 million tonnes.

```js
const commodities = [
  {name: "Iron ores and concentrates", value: 4.8, yoy: 3.8},
  {name: "Wheat", value: 3.2, yoy: 18.7},
  {name: "Coal", value: 3.1, yoy: -4.6},
  {name: "Potash", value: 1.9, yoy: -10.8},
  {name: "Gaseous hydrocarbons", value: 1.0, yoy: null},
  {name: "Fuel oils and crude petroleum", value: 0.9, yoy: null},
  {name: "Canola", value: 0.8, yoy: -38.2},
  {name: "Other cereal grains", value: 0.8, yoy: null}
];

display(Plot.plot({
  title: "Top commodities by tonnage, October 2025 (million tonnes)",
  width: 680,
  height: 340,
  marginLeft: 200,
  marginRight: 60,
  x: {grid: true, label: "Million tonnes"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(commodities, {
      y: "name",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(commodities, {
      y: "name",
      x: 5.2,
      text: d => d.value.toFixed(1) + "M",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

### Year-over-year change by commodity

```js
const yoyData = [
  {name: "Wheat", change: 18.7},
  {name: "Iron ores", change: 3.8},
  {name: "Coal", change: -4.6},
  {name: "Potash", change: -10.8},
  {name: "Canola", change: -38.2}
];

display(Plot.plot({
  title: "Year-over-year change by commodity, October 2025 (%)",
  width: 680,
  height: 280,
  marginLeft: 100,
  marginRight: 80,
  x: {domain: [-45, 25], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "name",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(yoyData, {
      y: "name",
      x: 22,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

Railway carloadings statistics measure the tonnage of freight transported by rail in Canada. Data are collected monthly from Class I railways operating in Canada. The statistics include both non-intermodal traffic (loaded onto rail cars) and intermodal traffic (containers and trailers).

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 23-10-0216](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2310021601)
**Survey:** Monthly Railway Carloadings
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/2310021601-eng](https://doi.org/10.25318/2310021601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "railway-carloadings-october-2025", "en"));
```
