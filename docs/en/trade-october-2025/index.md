---
title: Merchandise exports up 6.3% in September 2025
toc: false
---

# Merchandise exports up 6.3% in September 2025

<p class="release-date">Released: November 14, 2025</p>

<div class="highlights">

**Highlights**

- Merchandise exports increased 6.3% to $64.2 billion in September 2025
- Merchandise imports declined 4.1% to $64.1 billion
- Canada recorded a trade surplus of $0.2 billion
- On a year-over-year basis, exports were up 0.3%

</div>

Merchandise exports increased 6.3% to $64.2 billion in September 2025, following a decline of 3.1% in August. On a year-over-year basis, exports were up 0.3% compared with September 2024.

Merchandise imports declined 4.1% to $64.1 billion in September. The result was a trade surplus of $0.2 billion, compared with a trade deficit of $6.4 billion in August.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 12-10-0011 (values in $ billions)
const tradeData = [
  {date: new Date("2023-01"), exports: 67.6, imports: 65.7},
  {date: new Date("2023-02"), exports: 64.1, imports: 64.3},
  {date: new Date("2023-03"), exports: 64.4, imports: 62.9},
  {date: new Date("2023-04"), exports: 64.3, imports: 62.7},
  {date: new Date("2023-05"), exports: 62.9, imports: 65.4},
  {date: new Date("2023-06"), exports: 60.4, imports: 65.3},
  {date: new Date("2023-07"), exports: 61.2, imports: 62.4},
  {date: new Date("2023-08"), exports: 64.4, imports: 64.4},
  {date: new Date("2023-09"), exports: 65.7, imports: 64.9},
  {date: new Date("2023-10"), exports: 66.0, imports: 63.5},
  {date: new Date("2023-11"), exports: 65.1, imports: 64.6},
  {date: new Date("2023-12"), exports: 63.9, imports: 64.6},
  {date: new Date("2024-01"), exports: 61.6, imports: 62.1},
  {date: new Date("2024-02"), exports: 65.9, imports: 64.9},
  {date: new Date("2024-03"), exports: 63.5, imports: 64.3},
  {date: new Date("2024-04"), exports: 65.0, imports: 65.4},
  {date: new Date("2024-05"), exports: 62.8, imports: 64.6},
  {date: new Date("2024-06"), exports: 65.6, imports: 66.2},
  {date: new Date("2024-07"), exports: 65.0, imports: 65.3},
  {date: new Date("2024-08"), exports: 64.1, imports: 65.8},
  {date: new Date("2024-09"), exports: 64.1, imports: 65.3},
  {date: new Date("2024-10"), exports: 65.1, imports: 65.6},
  {date: new Date("2024-11"), exports: 66.4, imports: 67.0},
  {date: new Date("2024-12"), exports: 69.9, imports: 69.1},
  {date: new Date("2025-01"), exports: 72.9, imports: 69.2},
  {date: new Date("2025-02"), exports: 68.8, imports: 69.9},
  {date: new Date("2025-03"), exports: 67.5, imports: 69.4},
  {date: new Date("2025-04"), exports: 60.0, imports: 67.3},
  {date: new Date("2025-05"), exports: 61.0, imports: 66.8},
  {date: new Date("2025-06"), exports: 61.5, imports: 67.1},
  {date: new Date("2025-07"), exports: 62.4, imports: 66.2},
  {date: new Date("2025-08"), exports: 60.4, imports: 66.8},
  {date: new Date("2025-09"), exports: 64.2, imports: 64.1}
];

display(Plot.plot({
  title: "Merchandise exports and imports ($ billions)",
  width: 680,
  height: 320,
  y: {domain: [55, 75], grid: true, label: "$ billions"},
  x: {type: "utc", label: null},
  color: {legend: true},
  marks: [
    Plot.lineY(tradeData, {x: "date", y: "exports", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.lineY(tradeData, {x: "date", y: "imports", stroke: "#1f77b4", strokeWidth: 2}),
    Plot.dot(tradeData.slice(-1), {x: "date", y: "exports", fill: "#AF3C43", r: 5}),
    Plot.dot(tradeData.slice(-1), {x: "date", y: "imports", fill: "#1f77b4", r: 5}),
    Plot.text([{x: new Date("2025-09"), y: 64.2, text: "Exports"}], {x: "x", y: "y", text: "text", dy: -15, fill: "#AF3C43", fontWeight: 600}),
    Plot.text([{x: new Date("2025-09"), y: 64.1, text: "Imports"}], {x: "x", y: "y", text: "text", dy: 15, fill: "#1f77b4", fontWeight: 600})
  ]
}));
```

## Trade with the United States

Exports to the United States increased to $45.8 billion in September 2025, accounting for 71% of total merchandise exports. Imports from the United States totalled $37.2 billion.

Canada recorded a trade surplus of $8.6 billion with the United States in September.

## Top export destinations

| Partner | Exports ($ billions) | Share of total |
|---------|---------------------|----------------|
| United States | 45.8 | 71.4% |
| European Union | 3.7 | 5.7% |
| United Kingdom | 3.2 | 5.1% |
| China | 2.5 | 4.0% |
| Japan | 1.1 | 1.8% |
| Switzerland | 1.0 | 1.6% |
| Germany | 0.9 | 1.5% |
| Mexico | 0.8 | 1.3% |

```js
const partnerData = [
  {partner: "United States", value: 45.8},
  {partner: "European Union", value: 3.7},
  {partner: "United Kingdom", value: 3.2},
  {partner: "China", value: 2.5},
  {partner: "Japan", value: 1.1},
  {partner: "Other", value: 7.9}
];

display(Plot.plot({
  title: "Merchandise exports by destination ($ billions)",
  width: 500,
  height: 280,
  marginLeft: 120,
  x: {grid: true, label: "$ billions"},
  y: {label: null},
  marks: [
    Plot.barX(partnerData, {
      y: "partner",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(partnerData, {
      y: "partner",
      x: "value",
      text: d => "$" + d.value.toFixed(1) + "B",
      dx: 25,
      fill: "currentColor"
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

Merchandise trade data are presented on a balance of payments basis, which adjusts customs data to conform to the concepts required for the international accounts.

Seasonal adjustment removes the effect of seasonal patterns from the data, allowing for better identification of underlying trends.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 12-10-0011](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1210001101)
**Survey:** International Merchandise Trade
**Reference period:** September 2025
**DOI:** [https://doi.org/10.25318/1210001101-eng](https://doi.org/10.25318/1210001101-eng)

</div>
