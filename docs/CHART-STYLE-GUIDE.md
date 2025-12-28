---
title: Chart Style Guide
toc: true
---

# Chart Style Guide

Guidelines for creating consistent Observable Plot charts in The D-AI-LY articles.

## Choosing the Right Chart

| Data Pattern | Chart Type | Example |
|-------------|------------|---------|
| Trend over time | Line chart | CPI index over 24 months |
| Composition over time | Stacked area | Energy sources monthly |
| Part of whole (snapshot) | Waffle chart | "52% hydroelectric" |
| Ranking/comparison | Horizontal bar or lollipop | Industry employment change |
| Two-point comparison | Slope chart | Provincial rates YoY |
| Multiple series comparison | Small multiples | Regional unemployment trends |
| Values with uncertainty | Dot plot with range | Survey estimates with CI |
| Change direction emphasis | Diverging bar | Positive/negative monthly changes |

**Default to variety:** Don't use the same chart type twice in one article unless necessary. Mix time series with composition charts for richer storytelling.

## Color Palette

| Color | Hex Code | Usage |
|-------|----------|-------|
| StatCan Red | `#AF3C43` | Primary color for lines, positive values, highlights |
| Green | `#2e7d32` | Negative values only (declines, decreases) |
| Grid lines | `#ddd` | Light gray for reference lines |
| Text | `currentColor` | Inherits from page styling |

**Rule:** Use red for most data. Only use green when showing negative values in bar charts.

## Standard Dimensions

| Chart Type | Width | Height | Notes |
|------------|-------|--------|-------|
| Time series | 680 | 300 | Primary format |
| Narrow trend | 640 | 280 | For secondary charts |
| Horizontal bar | 640-700 | 320-380 | Adjust based on items |
| Compact | 600 | 260 | When space is limited |

**Important:** Always set explicit width/height. Never rely on defaults.

## Import Statement

Place a single import at the top of the first code block only:

```js
import * as Plot from "npm:@observablehq/plot";
```

Do not repeat this import in subsequent code blocks.

## Line Charts (Time Series)

Use for showing trends over time. Most common chart type.

```js
display(Plot.plot({
  title: "Consumer Price Index, December 2023 to November 2025",
  width: 680,
  height: 300,
  y: {grid: true, label: "↑ Index (2002=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(data, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(data.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(data.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

**Key elements:**
- `strokeWidth: 2` for visible lines
- Highlight the latest point with a dot (`r: 5`)
- Add text label for latest value (`dy: -12` positions above)
- Set `x: {type: "utc"}` for date axes
- Set `label: null` on x-axis to remove redundant "date" label
- Use arrow indicator on y-axis label (e.g., `"↑ Index"`)

## Horizontal Bar Charts

Use for comparing categories or showing component breakdowns.

```js
display(Plot.plot({
  title: "Year-over-year change by component (%)",
  width: 700,
  height: 320,
  marginLeft: 340,  // Adjust based on longest label
  x: {domain: [-1, 5], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),  // Zero line
    Plot.barX(data, {
      y: "name",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}  // Sort by value descending
    }),
    Plot.text(data, {
      y: "name",
      x: "change",
      text: d => d.change.toFixed(1) + "%",
      dx: 20,  // Offset from bar end
      fill: "currentColor"
    })
  ]
}));
```

**Key elements:**
- Set `marginLeft` to accommodate long category labels (200-340px typical)
- Always include `Plot.ruleX([0])` as a baseline
- Use conditional fill for positive/negative values
- Sort bars by value with `sort: {y: "-x"}`
- Position labels with `dx: 20` (positive values) or handle negative separately

### Custom Domains (IMPORTANT)

**When using a custom x-axis domain that doesn't start at 0**, you must use `x1` and `x2` instead of just `x`:

```js
// WRONG: Bars extend from 0 to value, covering y-axis labels!
x: {domain: [120, 145], grid: true},
marks: [
  Plot.barX(data, {y: "name", x: "value"})  // BAD
]

// CORRECT: Bars start at domain minimum
x: {domain: [120, 145], grid: true},
marks: [
  Plot.barX(data, {y: "name", x1: 120, x2: "value"})  // GOOD
]
```

**Why:** `Plot.barX` with just `x` draws bars from 0 to the value. When your domain is `[120, 145]`, the bars extend far to the left (off-screen) and render on top of y-axis labels, making them invisible.

### Handling Mixed Positive/Negative Labels

**Recommended approach:** Place ALL labels at a fixed right-edge position to avoid overlap:

```js
Plot.text(data, {
  y: "name",
  x: domainMax,  // Fixed position at right edge (e.g., 12 if domain is [-5, 12])
  text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
  textAnchor: "end",
  fill: "currentColor",
  fontSize: 11
})
```

**Why this approach:**
- Labels aligned at the bar end can overlap when bars have similar lengths
- A fixed right-edge position keeps all labels readable and consistently positioned
- Set `marginRight: 60` to ensure labels have space
- Expand the x-domain slightly beyond the max value to accommodate labels

## Area Charts (Composition Over Time)

Use stacked area charts to show how parts contribute to a whole over time.

```js
display(Plot.plot({
  title: "Electric power generation by source, 2024–2025",
  width: 680,
  height: 320,
  y: {grid: true, label: "Terawatt hours"},
  x: {type: "utc", label: null},
  color: {
    domain: ["Hydroelectric", "Combustible fuels", "Nuclear", "Wind", "Solar"],
    range: ["#AF3C43", "#E57373", "#FFAB91", "#81C784", "#FFD54F"]
  },
  marks: [
    Plot.areaY(data, Plot.stackY({
      x: "date",
      y: "value",
      fill: "source",
      order: "sum"
    })),
    Plot.ruleY([0])
  ]
}));
```

**When to use:** Energy mix, employment by industry, trade by commodity group.

## Slope Charts (Two-Point Comparison)

Use slope charts to compare values across two time periods (e.g., year-over-year).

```js
const provinces = [
  {province: "Ontario", prev: 6.2, current: 5.8},
  {province: "Quebec", prev: 5.1, current: 4.9},
  {province: "British Columbia", prev: 5.5, current: 5.7},
  // ...
];

display(Plot.plot({
  title: "Unemployment rate by province, November 2024 vs 2025",
  width: 500,
  height: 300,
  x: {domain: ["Nov 2024", "Nov 2025"], padding: 0.3},
  y: {domain: [4, 8], grid: true, label: "Percent"},
  marks: [
    Plot.line(provinces, {
      x: ["prev", "current"],
      y: ["prev", "current"],
      stroke: d => d.current < d.prev ? "#2e7d32" : "#AF3C43",
      strokeWidth: 2
    }),
    Plot.dot(provinces.flatMap(d => [{x: "Nov 2024", y: d.prev}, {x: "Nov 2025", y: d.current}]), {
      x: "x", y: "y", fill: "#AF3C43", r: 4
    }),
    Plot.text(provinces, {
      x: "Nov 2025", y: "current", text: "province", dx: 8, textAnchor: "start"
    })
  ]
}));
```

**When to use:** Provincial comparisons, before/after policy changes, seasonal comparisons.

## Lollipop Charts (Cleaner Rankings)

Use lollipop charts instead of bars when you have many categories—less visual clutter.

```js
display(Plot.plot({
  title: "Employment change by industry, November 2025",
  width: 640,
  height: 400,
  marginLeft: 180,
  x: {grid: true, label: "Change (thousands)"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.link(data, {
      y1: "industry",
      y2: "industry",
      x1: 0,
      x2: "change",
      stroke: "#AF3C43",
      strokeWidth: 2,
      sort: {y1: "-x2"}
    }),
    Plot.dot(data, {
      y: "industry",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      r: 6,
      sort: {y: "-x"}
    }),
    Plot.text(data, {
      y: "industry",
      x: "change",
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1),
      dx: d => d.change >= 0 ? 12 : -12,
      textAnchor: d => d.change >= 0 ? "start" : "end"
    })
  ]
}));
```

**When to use:** Industry rankings, regional comparisons, component contributions.

## Dot Plots with Ranges

Use dot plots with confidence intervals or ranges when uncertainty matters.

```js
display(Plot.plot({
  title: "Unemployment rate by province with sampling range",
  width: 640,
  height: 320,
  marginLeft: 160,
  x: {domain: [3, 10], grid: true, label: "Percent"},
  y: {label: null},
  marks: [
    Plot.ruleX(data, {y: "province", x1: "low", x2: "high", stroke: "#ccc", strokeWidth: 3}),
    Plot.dot(data, {y: "province", x: "rate", fill: "#AF3C43", r: 6, sort: {y: "-x"}}),
    Plot.text(data, {y: "province", x: "rate", text: d => d.rate.toFixed(1) + "%", dx: 12})
  ]
}));
```

**When to use:** Survey estimates with confidence intervals, ranges, or uncertainty.

## Waffle Charts (Part of Whole)

Use waffle charts to show percentages in a visually intuitive way. Use a **20×5 rectangular grid** (100 cells) to match standard chart widths.

```js
// 20×5 grid (100 cells) matching standard 640px width
const cols = 20;
const shares = [
  {source: "Hydroelectric", pct: 52, color: "#AF3C43"},
  {source: "Other sources", pct: 48, color: "#ddd"}
];

let waffle = [];
let idx = 0;
for (const s of shares) {
  for (let i = 0; i < s.pct; i++) {
    waffle.push({x: idx % cols, y: Math.floor(idx / cols), source: s.source});
    idx++;
  }
}

display(Plot.plot({
  title: "Hydroelectric accounts for 52% of generation",
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

**When to use:** Headline percentages, market share, composition at a point in time.

## Small Multiples (Faceted Charts)

Use faceting to compare trends across provinces or categories.

```js
display(Plot.plot({
  title: "Unemployment rate by region",
  width: 700,
  height: 400,
  fx: {label: null},
  y: {grid: true, label: "Percent"},
  x: {type: "utc", label: null, tickFormat: "%b"},
  marks: [
    Plot.lineY(data, {x: "date", y: "rate", fx: "region", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.frame({stroke: "#ddd"})
  ]
}));
```

**When to use:** Provincial trends, industry comparisons, multiple indicators.

## Reference Lines

Add context with horizontal reference lines:

```js
marks: [
  Plot.ruleY([0]),  // Zero baseline
  Plot.ruleY([1, 3], {stroke: "#ddd", strokeDasharray: "4,4"}),  // Reference levels
  // ... other marks
]
```

## Title Conventions

| Type | Format | Example |
|------|--------|---------|
| Index trend | `"{Indicator}, {Start Month Year} to {End Month Year}"` | "Consumer Price Index, December 2023 to November 2025" |
| Rate/percent | `"{Description} (%)"` | "Year-over-year inflation rate (%)" |
| Component comparison | `"{Description} (%)"` | "Year-over-year change by component (%)" |
| Sector breakdown | `"Monthly change by sector (%)"` | "Monthly change by sector (%)" |

**Rules:**
- Use sentence case (capitalize first word only)
- Include units in parentheses
- Include date range for time series

## Y-Axis Labels

| Data Type | Label Format | Example |
|-----------|--------------|---------|
| Index values | `"↑ Index ({base}=100)"` | `"↑ Index (2002=100)"` |
| Percentage | `"Percent"` | `"Percent"` |
| Currency (billions) | `"Billions $"` or `"Milliards $"` (FR) | `"Billions $"` |
| Count | Descriptive noun | `"Thousands"` |

## Number Formatting

### English
- One decimal place: `d.value.toFixed(1)` → "165.4"
- Percentages: `d.value.toFixed(1) + "%"` → "2.2%"
- Sign prefix for changes: `(d >= 0 ? "+" : "") + d.toFixed(1) + "%"` → "+2.2%"

### French
- Use comma as decimal separator: `d.value.toFixed(1).replace(".", ",")` → "165,4"
- Space before %: `d.toFixed(1).replace(".", ",") + " %"` → "2,2 %"
- Currency: `d.toFixed(1).replace(".", ",") + " G$"` → "165,4 G$"

## Data Structure

Always use arrays of objects with clear property names:

```js
const data = [
  {date: new Date("2025-01"), value: 161.3},
  {date: new Date("2025-02"), value: 163.0},
  // ...
];
```

**Rules:**
- Use `new Date()` for date values
- Use lowercase property names
- Keep data inline in the code block (not loaded from external files)
- Comment the data source: `// Real data from Statistics Canada Table 18-10-0004`

## Complete Example

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 36-10-0434
const gdpData = [
  {date: new Date("2024-11"), value: 2312.3},
  {date: new Date("2024-12"), value: 2317.0},
  {date: new Date("2025-01"), value: 2327.2},
  // ... more data points
  {date: new Date("2025-10"), value: 2325.9}
];

display(Plot.plot({
  title: "Real GDP at basic prices ($ billions, 2017 constant prices)",
  width: 680,
  height: 300,
  y: {domain: [2200, 2380], grid: true, label: "Billions $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(gdpData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(gdpData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(gdpData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Checklist Before Publishing

- [ ] Import statement at top of first code block only
- [ ] Explicit width and height set
- [ ] Title follows conventions
- [ ] StatCan red (#AF3C43) used for primary data
- [ ] Latest value highlighted with dot and label
- [ ] Y-axis has appropriate label with units
- [ ] Numbers formatted to one decimal place
- [ ] Data comment references StatCan table number
- [ ] French version uses comma decimal separator
