---
title: Merchandise exports up 6.3% in October 2025
toc: false
---

# Merchandise exports up 6.3% in October 2025

<p class="release-date">Released: December 18, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Merchandise exports increased 6.3% to $64.2 billion in October 2025
- Imports declined 4.1% to $66.8 billion
- Canada's trade deficit narrowed to $2.6 billion
- The United States remained the dominant trading partner at $45.8 billion in exports

</div>

Merchandise exports rose 6.3% to $64.2 billion in October 2025, following a decline in September. Imports fell 4.1% to $66.8 billion, narrowing Canada's trade deficit.

Year over year, exports were down 4.8% compared with October 2024, reflecting ongoing challenges in global demand.

```js
import * as Plot from "npm:@observablehq/plot";

const tradeData = [
  {date: new Date("2025-04"), exports: 60.9, imports: 66.4},
  {date: new Date("2025-05"), exports: 61.8, imports: 66.3},
  {date: new Date("2025-06"), exports: 61.3, imports: 66.5},
  {date: new Date("2025-07"), exports: 62.4, imports: 65.6},
  {date: new Date("2025-08"), exports: 60.5, imports: 65.9},
  {date: new Date("2025-09"), exports: 60.4, imports: 69.7},
  {date: new Date("2025-10"), exports: 64.2, imports: 66.8}
];

display(Plot.plot({
  title: "Merchandise trade, April to October 2025 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [55, 75], grid: true, label: "Billions $"},
  x: {type: "utc", label: null},
  color: {legend: true},
  marks: [
    Plot.lineY(tradeData, {x: "date", y: "exports", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.lineY(tradeData, {x: "date", y: "imports", stroke: "#1976d2", strokeWidth: 2}),
    Plot.dot(tradeData.slice(-1), {x: "date", y: "exports", fill: "#AF3C43", r: 5}),
    Plot.dot(tradeData.slice(-1), {x: "date", y: "imports", fill: "#1976d2", r: 5}),
    Plot.text([{x: new Date("2025-10"), y: 64.2, label: "Exports $64.2B"}], {x: "x", y: "y", text: "label", dy: -12, fill: "#AF3C43", fontWeight: 600, fontSize: 11}),
    Plot.text([{x: new Date("2025-10"), y: 66.8, label: "Imports $66.8B"}], {x: "x", y: "y", text: "label", dy: 15, fill: "#1976d2", fontWeight: 600, fontSize: 11})
  ]
}));
```

## Trade by partner

The United States remained Canada's largest trading partner, accounting for $45.8 billion in exports — 71% of total merchandise exports. Exports to the European Union totalled $3.7 billion, while the United Kingdom received $3.2 billion.

```js
const partners = [
  {partner: "United States", value: 45.8},
  {partner: "European Union", value: 3.7},
  {partner: "United Kingdom", value: 3.2},
  {partner: "China", value: 2.5}
];

display(Plot.plot({
  title: "Merchandise exports by trading partner, October 2025 ($ billions)",
  width: 640,
  height: 220,
  marginLeft: 130,
  marginRight: 60,
  x: {grid: true, label: "Billions $"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(partners, {
      y: "partner",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(partners, {
      y: "partner",
      x: 50,
      text: d => "$" + d.value.toFixed(1) + "B",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

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
