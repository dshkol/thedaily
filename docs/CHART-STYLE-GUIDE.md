---
title: Chart Style Guide
toc: true
---

# Chart Style Guide

Guidelines for creating consistent Observable Plot charts in The D-AI-LY articles.

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

### Handling Negative Value Labels

When bars can be negative, position labels dynamically:

```js
Plot.text(data, {
  y: "name",
  x: d => d.change >= 0 ? domainMax : domainMin,
  text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
  textAnchor: d => d.change >= 0 ? "start" : "end",
  dx: d => d.change >= 0 ? 5 : -5,
  fill: "currentColor"
})
```

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
