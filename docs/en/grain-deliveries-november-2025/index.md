---
title: Western Canadian grain deliveries up 14.2% year over year in November 2025
toc: false
---

# Western Canadian grain deliveries up 14.2% year over year in November 2025

<p class="release-date">Released: December 30, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Western Canadian grain deliveries totalled 5.5 million tonnes in November 2025, up 14.2% from November 2024
- Month over month, deliveries declined 14.6% from the 6.5 million tonnes recorded in October
- Wheat deliveries rose 21.1% year over year to 3.4 million tonnes
- Oats recorded the largest year-over-year decline at -27.7%

</div>

Grain producers in Western Canada delivered 5.5 million tonnes of grain to licensed primary elevators, process elevators, and grain dealers in November 2025. This was 14.2% higher than November 2024 but 14.6% lower than October 2025.

The year-over-year increase was driven by higher deliveries of wheat and canola, while oat deliveries fell sharply.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 32-10-0351
const deliveriesData = [
  {date: new Date("2024-11"), value: 4.83},
  {date: new Date("2024-12"), value: 4.69},
  {date: new Date("2025-01"), value: 6.42},
  {date: new Date("2025-02"), value: 4.61},
  {date: new Date("2025-03"), value: 4.96},
  {date: new Date("2025-04"), value: 5.65},
  {date: new Date("2025-05"), value: 3.63},
  {date: new Date("2025-06"), value: 4.89},
  {date: new Date("2025-07"), value: 3.77},
  {date: new Date("2025-08"), value: 2.91},
  {date: new Date("2025-09"), value: 6.87},
  {date: new Date("2025-10"), value: 6.46},
  {date: new Date("2025-11"), value: 5.51}
];

display(Plot.plot({
  title: "Western Canadian grain deliveries, November 2024 to November 2025",
  width: 680,
  height: 300,
  y: {domain: [2, 8], grid: true, label: "Million tonnes"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(deliveriesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(deliveriesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(deliveriesData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1) + "M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Deliveries by grain type

Wheat led all grains with 3.4 million tonnes delivered in November, accounting for 61% of total deliveries. Canola was second at 1.6 million tonnes (29%), followed by durum wheat at 0.7 million tonnes.

```js
const grainData = [
  {name: "Wheat", value: 3.35},
  {name: "Canola", value: 1.61},
  {name: "Durum wheat", value: 0.70},
  {name: "Barley", value: 0.34},
  {name: "Oats", value: 0.18}
];

display(Plot.plot({
  title: "Grain deliveries by type, November 2025 (million tonnes)",
  width: 680,
  height: 280,
  marginLeft: 120,
  marginRight: 80,
  x: {grid: true, label: "Million tonnes"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(grainData, {
      y: "name",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(grainData, {
      y: "name",
      x: d => d.value + 0.08,
      text: d => d.value.toFixed(2) + "M",
      textAnchor: "start",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

### Year-over-year change by grain type

Flaxseed recorded the largest year-over-year increase at 33.6%, though volumes remained small. Wheat deliveries rose 21.1%, while canola increased 11.1%.

Oat deliveries fell 27.7% compared with November 2024.

```js
const yoyData = [
  {name: "Flaxseed", change: 33.6},
  {name: "Wheat", change: 21.1},
  {name: "Rye", change: 11.2},
  {name: "Canola", change: 11.1},
  {name: "Durum wheat", change: 7.9},
  {name: "Barley", change: 1.2},
  {name: "Oats", change: -27.7}
];

display(Plot.plot({
  title: "Year-over-year change in grain deliveries by type, November 2025 (%)",
  width: 680,
  height: 300,
  marginLeft: 120,
  marginRight: 80,
  x: {domain: [-35, 40], grid: true, label: "Percent change"},
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
      x: d => d.change >= 0 ? d.change + 1 : d.change - 1,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      textAnchor: d => d.change >= 0 ? "start" : "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Provincial breakdown

Saskatchewan accounted for 58% of total Western Canadian grain deliveries at 3.2 million tonnes. Alberta contributed 1.5 million tonnes (28%), while Manitoba delivered 0.7 million tonnes (13%).

```js
const provincialData = [
  {province: "Saskatchewan", value: 3.22},
  {province: "Alberta", value: 1.53},
  {province: "Manitoba", value: 0.74}
];

display(Plot.plot({
  title: "Grain deliveries by province, November 2025 (million tonnes)",
  width: 500,
  height: 200,
  marginLeft: 120,
  marginRight: 80,
  x: {grid: true, label: "Million tonnes"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(provincialData, {
      y: "province",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(provincialData, {
      y: "province",
      x: d => d.value + 0.08,
      text: d => d.value.toFixed(2) + "M",
      textAnchor: "start",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

Producer deliveries of grains in Western Canada measure the quantity of grain delivered by producers to licensed primary elevators, process elevators, and grain dealers. The data cover major grains including wheat, canola, barley, oats, rye, flaxseed, and durum wheat.

Deliveries can vary significantly month to month due to harvest timing, transportation capacity, and market conditions.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch grain deliveries data
grain <- get_cansim("32-10-0354")

# Total deliveries by grain type
deliveries <- grain %>%
  filter(REF_DATE == "2025-11") %>%
  select(`Type of grain`, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 32-10-0351](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3210035101)
**Survey:** Producer Deliveries of Grain in Western Canada
**Reference period:** November 2025
**DOI:** [https://doi.org/10.25318/3210035101-eng](https://doi.org/10.25318/3210035101-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "grain-deliveries-november-2025", "en"));
```
