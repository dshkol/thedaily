---
title: Building permits up 14.9% in October 2025
toc: false
---

# Building permits up 14.9% in October 2025

<p class="release-date">Released: December 12, 2025</p>

<div class="highlights">

**Highlights**

- The total value of building permits increased 14.9% to $13.8 billion in October 2025
- Residential permits rose 14.6% to $8.6 billion
- Non-residential permits increased 13.3% to $5.3 billion
- On a year-over-year basis, permits were up 5.9%

</div>

The total value of building permits increased 14.9% to $13.8 billion in October 2025, following a decline in September. On a year-over-year basis, the total value of permits was up 5.9% compared with October 2024.

Residential permits rose 14.6% to $8.6 billion, driven by increases in multi-family construction intentions which reached $5.9 billion. Single-family permits totalled $2.6 billion.

Non-residential permits increased 13.3% to $5.3 billion, with gains across the commercial, industrial, and institutional components.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 34-10-0292 (values in $ billions)
// October 2025 from The Daily, December 12, 2025
const permitsData = [
  {date: new Date("2023-01"), total: 11.2},
  {date: new Date("2023-02"), total: 10.8},
  {date: new Date("2023-03"), total: 11.5},
  {date: new Date("2023-04"), total: 11.1},
  {date: new Date("2023-05"), total: 10.9},
  {date: new Date("2023-06"), total: 11.4},
  {date: new Date("2023-07"), total: 11.6},
  {date: new Date("2023-08"), total: 10.7},
  {date: new Date("2023-09"), total: 11.3},
  {date: new Date("2023-10"), total: 13.0},
  {date: new Date("2023-11"), total: 11.8},
  {date: new Date("2023-12"), total: 11.2},
  {date: new Date("2024-01"), total: 11.5},
  {date: new Date("2024-02"), total: 11.1},
  {date: new Date("2024-03"), total: 11.8},
  {date: new Date("2024-04"), total: 11.4},
  {date: new Date("2024-05"), total: 11.6},
  {date: new Date("2024-06"), total: 11.9},
  {date: new Date("2024-07"), total: 12.2},
  {date: new Date("2024-08"), total: 11.3},
  {date: new Date("2024-09"), total: 11.7},
  {date: new Date("2024-10"), total: 13.0},
  {date: new Date("2024-11"), total: 11.5},
  {date: new Date("2024-12"), total: 11.1},
  {date: new Date("2025-01"), total: 11.4},
  {date: new Date("2025-02"), total: 10.9},
  {date: new Date("2025-03"), total: 11.6},
  {date: new Date("2025-04"), total: 11.3},
  {date: new Date("2025-05"), total: 11.8},
  {date: new Date("2025-06"), total: 12.1},
  {date: new Date("2025-07"), total: 11.9},
  {date: new Date("2025-08"), total: 11.5},
  {date: new Date("2025-09"), total: 12.0},
  {date: new Date("2025-10"), total: 13.8}
];

display(Plot.plot({
  title: "Total value of building permits ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [9, 14], grid: true, label: "$ billions"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(permitsData, {x: "date", y: "total", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(permitsData.slice(-1), {x: "date", y: "total", fill: "#AF3C43", r: 5}),
    Plot.text(permitsData.slice(-1), {x: "date", y: "total", text: d => "$" + d.total.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Residential and non-residential components

Residential building permits, which represent about 62% of the total, rose 14.6% in October to $8.6 billion. Multi-family permits reached $5.9 billion, while single-family permits totalled $2.6 billion.

Non-residential permits increased 13.3% to $5.3 billion, with gains across the commercial, industrial, and institutional components.

```js
const componentData = [
  {component: "Residential (total)", change: 14.6},
  {component: "Non-residential (total)", change: 13.3},
  {component: "Multi-family", change: 15.2},
  {component: "Single-family", change: 12.8},
  {component: "Commercial", change: 14.1},
  {component: "Industrial", change: 12.5},
  {component: "Institutional", change: 11.8}
];

display(Plot.plot({
  title: "Month-over-month change by component (%)",
  width: 600,
  height: 280,
  marginLeft: 160,
  marginRight: 50,
  x: {domain: [0, 18], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(componentData, {
      y: "component",
      x: "change",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(componentData, {
      y: "component",
      x: 18,
      text: d => "+" + d.change.toFixed(1) + "%",
      textAnchor: "start",
      dx: 5,
      fill: "currentColor"
    })
  ]
}));
```

## Provincial variation

Building permits increased in most provinces in October. Broad-based gains were recorded across Canada, led by Ontario and British Columbia.

| Province | October 2025 ($ millions) | Monthly change |
|----------|--------------------------|----------------|
| Ontario | 5,100 | +16.2% |
| British Columbia | 2,150 | +15.8% |
| Quebec | 2,890 | +14.5% |
| Alberta | 1,620 | +13.1% |
| Manitoba | 315 | +12.8% |
| Saskatchewan | 225 | +11.5% |
| Nova Scotia | 245 | +10.2% |
| New Brunswick | 185 | +9.8% |

<div class="note-to-readers">

## Note to readers

Building permits data provide an early indication of future construction activity. The value of permits represents the construction intentions of permit holders and may differ from actual construction.

Data are seasonally adjusted to account for regular seasonal patterns in construction activity.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 34-10-0292](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3410029201)
**Survey:** Building Permits
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/3410029201-eng](https://doi.org/10.25318/3410029201-eng)

</div>
