---
title: Canada posts $583 million trade deficit in October 2025
verification_json: output/data_12_10_0011_enhanced.json
toc: false
---
# Canada posts $583 million trade deficit in October 2025

<p class="release-date">Released: January 8, 2026 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Merchandise exports rose 2.1% to $65.6 billion in October 2025
- Imports increased 3.4% to $66.2 billion
- Canada's trade balance shifted from a $243 million surplus in September to a $583 million deficit in October
- The trade surplus with the United States narrowed from $8.4 billion to $4.8 billion

</div>

Merchandise exports increased 2.1% to $65.6 billion in October 2025, while imports rose 3.4% to $66.2 billion. Canada's merchandise trade balance with the world went from a small surplus of $243 million in September to a deficit of $583 million in October.

Exports of metal and non-metallic mineral products increased 27.3% to a record high, driven by exports of unwrought gold, silver, and platinum group metals. Excluding this product group, total exports were down 2.5%.

```js
import * as Plot from "npm:@observablehq/plot";

// Data from Statistics Canada Table 12-10-0011
const tradeData = [
  {date: new Date("2024-10"), exports: 65.1, imports: 65.6},
  {date: new Date("2024-11"), exports: 66.4, imports: 67.0},
  {date: new Date("2024-12"), exports: 69.9, imports: 69.2},
  {date: new Date("2025-01"), exports: 72.9, imports: 69.2},
  {date: new Date("2025-02"), exports: 68.8, imports: 69.9},
  {date: new Date("2025-03"), exports: 67.5, imports: 69.4},
  {date: new Date("2025-04"), exports: 60.0, imports: 67.3},
  {date: new Date("2025-05"), exports: 61.0, imports: 66.8},
  {date: new Date("2025-06"), exports: 61.5, imports: 67.1},
  {date: new Date("2025-07"), exports: 62.4, imports: 66.2},
  {date: new Date("2025-08"), exports: 60.4, imports: 66.8},
  {date: new Date("2025-09"), exports: 64.3, imports: 64.0},
  {date: new Date("2025-10"), exports: 65.6, imports: 66.2}
];

display(Plot.plot({
  title: "Merchandise trade, October 2024 to October 2025 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [55, 75], grid: true, label: "Billions $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(tradeData, {x: "date", y: "exports", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.lineY(tradeData, {x: "date", y: "imports", stroke: "#1976d2", strokeWidth: 2}),
    Plot.dot(tradeData.slice(-1), {x: "date", y: "exports", fill: "#AF3C43", r: 5}),
    Plot.dot(tradeData.slice(-1), {x: "date", y: "imports", fill: "#1976d2", r: 5}),
    Plot.text([{x: new Date("2025-05"), y: 73, text: "Exports"}], {x: "x", y: "y", text: "text", fill: "#AF3C43", fontSize: 12}),
    Plot.text([{x: new Date("2025-05"), y: 70, text: "Imports"}], {x: "x", y: "y", text: "text", fill: "#1976d2", fontSize: 12})
  ]
}));
```

## Trade with the United States

Canada's trade surplus with the United States narrowed from $8.4 billion in September to $4.8 billion in October. Canadian exports to the United States fell 3.4%, while imports from the United States rose 5.3%.

Year-to-date, exports to the United States were down 4.1% compared with the same period in 2024.

## Trade with other countries

Exports to countries other than the United States rose 15.6% to reach a record high in October. Higher exports to the United Kingdom (gold) and China (crude oil) contributed the most to this growth.

Canada's trade deficit with countries other than the United States narrowed from $8.1 billion in September to $5.4 billion in October — the lowest deficit since January 2021.

<div class="note-to-readers">

## Note to readers

International merchandise trade data measure the value of goods crossing Canada's borders. Data are seasonally adjusted.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 12-10-0011](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1210001101)
**Survey:** Canadian International Merchandise Trade
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/1210001101-eng](https://doi.org/10.25318/1210001101-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "trade-october-2025", "en"));
```
