---
title: Industrial product prices up 5.7% year over year in October 2025
toc: false
---

# Industrial product prices up 5.7% year over year in October 2025

<p class="release-date">Released: December 28, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- The Industrial Product Price Index (IPPI) rose 1.6% in October 2025
- Year over year, industrial product prices increased 5.7%
- The index reached 134.4 (2020=100), the highest level since early 2025
- This marked the second consecutive monthly increase

</div>

The Industrial Product Price Index (IPPI) rose 1.6% in October 2025, bringing the index to 134.4 (2020=100). This follows a 1.0% increase in September. Year over year, industrial product prices were up 5.7% compared with October 2024.

The monthly increase reflected strengthening upstream price pressures in the manufacturing sector.

```js
import * as Plot from "npm:@observablehq/plot";

const ippiData = [
  {date: new Date("2023-12"), value: 123.3},
  {date: new Date("2024-01"), value: 123.3},
  {date: new Date("2024-02"), value: 124.6},
  {date: new Date("2024-03"), value: 125.7},
  {date: new Date("2024-04"), value: 127.7},
  {date: new Date("2024-05"), value: 128.0},
  {date: new Date("2024-06"), value: 127.9},
  {date: new Date("2024-07"), value: 127.9},
  {date: new Date("2024-08"), value: 126.7},
  {date: new Date("2024-09"), value: 125.6},
  {date: new Date("2024-10"), value: 127.1},
  {date: new Date("2024-11"), value: 127.8},
  {date: new Date("2024-12"), value: 128.3},
  {date: new Date("2025-01"), value: 130.3},
  {date: new Date("2025-02"), value: 131.1},
  {date: new Date("2025-03"), value: 131.4},
  {date: new Date("2025-04"), value: 130.4},
  {date: new Date("2025-05"), value: 129.2},
  {date: new Date("2025-06"), value: 129.6},
  {date: new Date("2025-07"), value: 130.4},
  {date: new Date("2025-08"), value: 130.9},
  {date: new Date("2025-09"), value: 132.2},
  {date: new Date("2025-10"), value: 134.4}
];

display(Plot.plot({
  title: "Industrial Product Price Index, December 2023 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [118, 140], grid: true, label: "Index (2020=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(ippiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(ippiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(ippiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Monthly changes in 2025

Industrial product prices have shown volatility throughout 2025. After declining in the spring months, the index has risen steadily since July, with accelerating gains in September and October.

```js
const monthlyData = [
  {month: "Jan.", value: 130.3, change: 1.6},
  {month: "Feb.", value: 131.1, change: 0.6},
  {month: "Mar.", value: 131.4, change: 0.2},
  {month: "Apr.", value: 130.4, change: -0.8},
  {month: "May", value: 129.2, change: -0.9},
  {month: "Jun.", value: 129.6, change: 0.3},
  {month: "Jul.", value: 130.4, change: 0.6},
  {month: "Aug.", value: 130.9, change: 0.4},
  {month: "Sep.", value: 132.2, change: 1.0},
  {month: "Oct.", value: 134.4, change: 1.7}
];

display(Plot.plot({
  title: "Month-over-month change in IPPI, 2025 (%)",
  width: 640,
  height: 260,
  x: {label: null, padding: 0.3, domain: ["Jan.", "Feb.", "Mar.", "Apr.", "May", "Jun.", "Jul.", "Aug.", "Sep.", "Oct."]},
  y: {grid: true, label: "Percent change", domain: [-1.5, 2.5]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(monthlyData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(monthlyData, {
      x: "month",
      y: "change",
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      dy: d => d.change >= 0 ? -8 : 8,
      fontSize: 10
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

The Industrial Product Price Index (IPPI) measures the prices that producers receive for goods sold at the factory gate. It reflects price pressures in the manufacturing sector before they reach consumers.

The IPPI differs from the Consumer Price Index (CPI), which measures prices paid by consumers. Changes in industrial product prices may take time to affect consumer prices as goods move through the supply chain.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0265](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810026501)
**Survey:** Industrial Product Price Index
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/1810026501-eng](https://doi.org/10.25318/1810026501-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "industrial-product-prices-october-2025", "en"));
```
