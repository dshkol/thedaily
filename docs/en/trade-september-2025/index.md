---
title: Merchandise exports up 6.3% in September 2025
toc: false
---

# Merchandise exports up 6.3% in September 2025

<p class="release-date">Released: November 13, 2025</p>

<div class="highlights">

- Merchandise exports increased 6.3% to $64.2 billion in September 2025
- Imports declined 4.1% to $64.1 billion
- Canada posted a trade surplus of $153 million

</div>

Merchandise exports rose 6.3% to $64.2 billion in September 2025, rebounding after a 3.2% decline in August. Meanwhile, imports fell 4.1% to $64.1 billion, resulting in a trade surplus of $153 million.

On a year-over-year basis, exports were up 0.3% compared with September 2024, while imports were down 1.9%.

## Trade trend

Both exports and imports have been volatile through 2025, with exports recovering in September after several months of declines.

```js
import * as Plot from "npm:@observablehq/plot";

const tradeData = [
  {date: new Date("2024-01-01"), exports: 61.59, imports: 62.12},
  {date: new Date("2024-02-01"), exports: 65.86, imports: 64.89},
  {date: new Date("2024-03-01"), exports: 63.52, imports: 64.31},
  {date: new Date("2024-04-01"), exports: 65.01, imports: 65.44},
  {date: new Date("2024-05-01"), exports: 62.82, imports: 64.60},
  {date: new Date("2024-06-01"), exports: 65.62, imports: 66.21},
  {date: new Date("2024-07-01"), exports: 64.99, imports: 65.31},
  {date: new Date("2024-08-01"), exports: 64.11, imports: 65.80},
  {date: new Date("2024-09-01"), exports: 64.06, imports: 65.33},
  {date: new Date("2024-10-01"), exports: 65.07, imports: 65.56},
  {date: new Date("2024-11-01"), exports: 66.42, imports: 67.03},
  {date: new Date("2024-12-01"), exports: 69.92, imports: 69.15},
  {date: new Date("2025-01-01"), exports: 72.86, imports: 69.22},
  {date: new Date("2025-02-01"), exports: 68.81, imports: 69.89},
  {date: new Date("2025-03-01"), exports: 67.45, imports: 69.38},
  {date: new Date("2025-04-01"), exports: 60.04, imports: 67.32},
  {date: new Date("2025-05-01"), exports: 61.03, imports: 66.78},
  {date: new Date("2025-06-01"), exports: 61.48, imports: 67.05},
  {date: new Date("2025-07-01"), exports: 62.37, imports: 66.19},
  {date: new Date("2025-08-01"), exports: 60.40, imports: 66.83},
  {date: new Date("2025-09-01"), exports: 64.23, imports: 64.08}
];

display(Plot.plot({
  title: "Merchandise trade, Canada (billions of dollars)",
  width: 700,
  height: 400,
  y: {
    domain: [55, 75],
    grid: true,
    label: "Billions ($)"
  },
  x: {
    label: null
  },
  color: {
    legend: true,
    domain: ["Exports", "Imports"],
    range: ["#AF3C43", "#1f77b4"]
  },
  marks: [
    Plot.lineY(tradeData, {x: "date", y: "exports", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.lineY(tradeData, {x: "date", y: "imports", stroke: "#1f77b4", strokeWidth: 2}),
    Plot.dot(tradeData.filter(d => d.date.getTime() === new Date("2025-09-01").getTime()), {
      x: "date",
      y: "exports",
      fill: "#AF3C43",
      r: 5
    }),
    Plot.dot(tradeData.filter(d => d.date.getTime() === new Date("2025-09-01").getTime()), {
      x: "date",
      y: "imports",
      fill: "#1f77b4",
      r: 5
    }),
    Plot.text([{x: new Date("2025-05-01"), y: 73, text: "Exports"}], {
      x: "x", y: "y", text: "text", fill: "#AF3C43", fontSize: 12
    }),
    Plot.text([{x: new Date("2025-05-01"), y: 70, text: "Imports"}], {
      x: "x", y: "y", text: "text", fill: "#1f77b4", fontSize: 12
    })
  ]
}));
```

## Trade balance

Canada posted a trade surplus of $153 million in September, reversing several months of trade deficits.

```js
const balanceData = [
  {month: "Jan", balance: 3.64},
  {month: "Feb", balance: -1.08},
  {month: "Mar", balance: -1.93},
  {month: "Apr", balance: -7.28},
  {month: "May", balance: -5.75},
  {month: "Jun", balance: -5.57},
  {month: "Jul", balance: -3.82},
  {month: "Aug", balance: -6.43},
  {month: "Sep", balance: 0.15}
];

display(Plot.plot({
  title: "Trade balance, 2025 (billions of dollars)",
  width: 700,
  height: 350,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"]
  },
  y: {
    grid: true,
    label: "Billions ($)",
    domain: [-10, 5]
  },
  marks: [
    Plot.ruleY([0]),
    Plot.barY(balanceData, {
      x: "month",
      y: "balance",
      fill: "#AF3C43"
    }),
    Plot.text(balanceData, {
      x: "month",
      y: d => d.balance >= 0 ? d.balance + 0.4 : d.balance - 0.4,
      text: d => (d.balance >= 0 ? "+" : "") + d.balance.toFixed(1),
      fontSize: 10
    })
  ]
}));
```

## Summary table

| Indicator | September 2025 | Change from August | Change from September 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| Exports ($ billions) | 64.2 | +6.3% | +0.3% |
| Imports ($ billions) | 64.1 | -4.1% | -1.9% |
| Trade balance ($ millions) | +153 | — | — |

<div class="note-to-readers">

**Note to readers**

International merchandise trade data are expressed in current dollars and are seasonally adjusted. The data cover trade in goods between Canada and its trading partners.

This is a backfill article covering data from September 2025, published as part of the D-AI-LY's historical coverage initiative.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 12-10-0011](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1210001101)
**Survey:** Canadian International Merchandise Trade
**Reference period:** September 2025
**DOI:** [https://doi.org/10.25318/1210001101-eng](https://doi.org/10.25318/1210001101-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "trade-september-2025", "en"));
```
