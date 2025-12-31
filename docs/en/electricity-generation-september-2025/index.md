---
title: Electric power generation down 6.7% in September 2025
toc: false
---

# Electric power generation down 6.7% in September 2025

<p class="release-date">Released: December 25, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Electric power generation fell 6.7% to 44.4 TWh in September 2025
- Quebec and Ontario each generated 12.6 TWh, together accounting for 57% of national output
- Solar generation rose 15.1% year over year; nuclear fell 10.8%
- Hydroelectric power accounted for 52% of total generation

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
// Waffle chart: Hydroelectric accounts for 52% of total generation
// Using 20×5 grid (100 cells) to match article width
const cols = 20;
const shares = [
  {source: "Hydroelectric", pct: 52, color: "#AF3C43"},
  {source: "Combustible fuels", pct: 26, color: "#E57373"},
  {source: "Nuclear", pct: 14, color: "#FFAB91"},
  {source: "Wind", pct: 7, color: "#81C784"},
  {source: "Solar", pct: 1, color: "#FFD54F"}
];

// Build waffle grid (20 columns × 5 rows)
let waffle = [];
let idx = 0;
for (const s of shares) {
  for (let i = 0; i < s.pct; i++) {
    waffle.push({x: idx % cols, y: Math.floor(idx / cols), source: s.source});
    idx++;
  }
}

display(Plot.plot({
  title: "Generation by source — Hydroelectric dominates at 52%",
  width: 640,
  height: 180,
  axis: null,
  color: {
    domain: shares.map(d => d.source),
    range: shares.map(d => d.color),
    legend: true
  },
  marks: [
    Plot.cell(waffle, {x: "x", y: "y", fill: "source", inset: 1, rx: 3})
  ]
}));
```

```js
// Lollipop chart for generation values
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
  height: 220,
  marginLeft: 140,
  marginRight: 60,
  x: {domain: [0, 25], grid: true, label: "Terawatt hours"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.link(sources, {
      y1: "source",
      y2: "source",
      x1: 0,
      x2: "value",
      stroke: "#AF3C43",
      strokeWidth: 2,
      sort: {y1: "-x2"}
    }),
    Plot.dot(sources, {
      y: "source",
      x: "value",
      fill: "#AF3C43",
      r: 6,
      sort: {y: "-x"}
    }),
    Plot.text(sources, {
      y: "source",
      x: "value",
      text: d => d.value.toFixed(1) + " TWh",
      dx: 12,
      textAnchor: "start",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Provincial breakdown

Quebec and Ontario each generated about 12,600 GWh in September, together accounting for 57% of Canada's total electricity production. Alberta contributed 16%, followed by British Columbia at 13%.

```js
const provinces = [
  {province: "Quebec", value: 12645, pct: 28.5},
  {province: "Ontario", value: 12642, pct: 28.5},
  {province: "Alberta", value: 6964, pct: 15.7},
  {province: "British Columbia", value: 5627, pct: 12.7},
  {province: "Saskatchewan", value: 1954, pct: 4.4},
  {province: "Newfoundland and Labrador", value: 1787, pct: 4.0},
  {province: "Manitoba", value: 1447, pct: 3.3}
];

display(Plot.plot({
  title: "Electric power generation by province, September 2025",
  width: 640,
  height: 280,
  marginLeft: 180,
  marginRight: 60,
  x: {domain: [0, 14000], grid: true, label: "Gigawatt hours (GWh)"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.link(provinces, {
      y1: "province",
      y2: "province",
      x1: 0,
      x2: "value",
      stroke: "#AF3C43",
      strokeWidth: 2
    }),
    Plot.dot(provinces, {
      y: "province",
      x: "value",
      fill: "#AF3C43",
      r: 6
    }),
    Plot.text(provinces, {
      y: "province",
      x: "value",
      text: d => d.value.toLocaleString() + " (" + d.pct + "%)",
      dx: 8,
      textAnchor: "start",
      fontSize: 11
    })
  ]
}));
```

Quebec's output is almost entirely hydroelectric, while Ontario relies heavily on nuclear power. Alberta's generation is dominated by natural gas.

## Year-over-year change by source

Compared with September 2024, solar generation rose 15.1% and combustible fuels increased 8.6%. However, nuclear output fell 10.8%, wind declined 6.9%, and hydroelectric generation was down 4.7%.

```js
const yoyData = [
  {source: "Solar", change: 15.1, value: 611},
  {source: "Combustible fuels", change: 8.6, value: 11677},
  {source: "Hydroelectric", change: -4.7, value: 22870},
  {source: "Wind", change: -6.9, value: 2865},
  {source: "Nuclear", change: -10.8, value: 6378}
];

display(Plot.plot({
  title: "Year-over-year change in generation by source (%)",
  width: 640,
  height: 220,
  marginLeft: 140,
  marginRight: 70,
  x: {domain: [-15, 20], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.link(yoyData, {
      y1: "source",
      y2: "source",
      x1: 0,
      x2: "change",
      stroke: "#AF3C43",
      strokeWidth: 2
    }),
    Plot.dot(yoyData, {
      y: "source",
      x: "change",
      fill: "#AF3C43",
      r: 6
    }),
    Plot.text(yoyData, {
      y: "source",
      x: 20,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 11
    })
  ]
}));
```

The decline in nuclear generation reflects scheduled maintenance at Ontario Power Generation facilities. Wind generation was lower due to below-average wind speeds in September.

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

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "electricity-generation-september-2025", "en"));
```
