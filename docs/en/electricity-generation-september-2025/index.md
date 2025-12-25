---
title: Electric power generation down 6.7% in September 2025
toc: false
---

# Electric power generation down 6.7% in September 2025

<p class="release-date">Released: December 25, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Electric power generation fell 6.7% to 44.4 TWh in September 2025
- Year-over-year generation was down 2.4% compared with September 2024
- Hydroelectric power accounted for 52% of total generation
- Wind power contributed 2.9 TWh, representing 6.5% of total output

</div>

Electric power generation in Canada totalled 44.4 terawatt hours (TWh) in September 2025, down 6.7% from August. Compared with September 2024, generation was down 2.4%.

The seasonal decline reflects lower electricity demand as summer cooling needs subside. Generation typically peaks in winter months when heating demand is highest.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 25-10-0015
const generationData = [
  {date: new Date("2024-09"), value: 45.5},
  {date: new Date("2024-10"), value: 47.3},
  {date: new Date("2024-11"), value: 50.3},
  {date: new Date("2024-12"), value: 61.6},
  {date: new Date("2025-01"), value: 66.8},
  {date: new Date("2025-02"), value: 59.2},
  {date: new Date("2025-03"), value: 56.6},
  {date: new Date("2025-04"), value: 48.8},
  {date: new Date("2025-05"), value: 46.5},
  {date: new Date("2025-06"), value: 46.0},
  {date: new Date("2025-07"), value: 50.0},
  {date: new Date("2025-08"), value: 47.6},
  {date: new Date("2025-09"), value: 44.4}
];

display(Plot.plot({
  title: "Electric power generation, September 2024 to September 2025",
  width: 680,
  height: 300,
  y: {domain: [40, 70], grid: true, label: "Terawatt hours (TWh)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(generationData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(generationData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(generationData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1) + " TWh", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Generation by source

Hydroelectric power remained the dominant source of electricity in Canada, generating 22.9 TWh in September — accounting for 52% of total output. Canada's abundant hydro resources, particularly in Quebec, British Columbia, and Manitoba, make it one of the largest hydroelectric producers in the world.

Combustible fuels (natural gas and coal) contributed 11.7 TWh, while nuclear power plants generated 6.4 TWh. Wind power added 2.9 TWh to the grid.

```js
const sources = [
  {source: "Hydroelectric", value: 22.9},
  {source: "Combustible fuels", value: 11.7},
  {source: "Nuclear", value: 6.4},
  {source: "Wind", value: 2.9},
  {source: "Solar", value: 0.6}
];

display(Plot.plot({
  title: "Electric power generation by source, September 2025 (TWh)",
  width: 640,
  height: 260,
  marginLeft: 140,
  marginRight: 60,
  x: {grid: true, label: "Terawatt hours"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(sources, {
      y: "source",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(sources, {
      y: "source",
      x: 25,
      text: d => d.value.toFixed(1) + " TWh",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

Electric power generation data includes electricity produced by electric utilities, industrial establishments that generate electricity for their own use, and other electricity producers. One terawatt hour equals 1,000 gigawatt hours or 1,000,000 megawatt hours.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 25-10-0015](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2510001501)
**Survey:** Monthly Survey of Electric Power Generation, Receipts, Deliveries and Firm Peak Load
**Reference period:** September 2025
**DOI:** [https://doi.org/10.25318/2510001501-eng](https://doi.org/10.25318/2510001501-eng)

</div>
