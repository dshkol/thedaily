---
title: Retail sales increase 0.3% in April as Newfoundland leads year-over-year gains
toc: false
---

# Retail sales increase 0.3% in April as Newfoundland leads year-over-year gains

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales increased 0.3% in April 2025 to $70.0 billion, following a 0.9% increase in March
- Year over year, sales were up 4.8%, with Newfoundland and Labrador (+6.8%) leading provincial gains
- Ten of eleven jurisdictions recorded positive year-over-year growth
- Yukon was the only jurisdiction to post a year-over-year decline (-1.4%)

</div>

Retail sales in Canada increased 0.3% in April 2025 to $70.0 billion, building on the 0.9% gain recorded in March. Year over year, sales were up 4.8% compared with April 2024.

The April increase extended a two-month streak of gains. Ten of eleven provinces and territories recorded positive year-over-year growth, with Newfoundland and Labrador leading gains.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2024-01-01"), value: 66.08},
  {date: new Date("2024-02-01"), value: 66.24},
  {date: new Date("2024-03-01"), value: 66.16},
  {date: new Date("2024-04-01"), value: 66.78},
  {date: new Date("2024-05-01"), value: 65.96},
  {date: new Date("2024-06-01"), value: 65.89},
  {date: new Date("2024-07-01"), value: 66.89},
  {date: new Date("2024-08-01"), value: 67.10},
  {date: new Date("2024-09-01"), value: 67.51},
  {date: new Date("2024-10-01"), value: 68.04},
  {date: new Date("2024-11-01"), value: 68.30},
  {date: new Date("2024-12-01"), value: 70.03},
  {date: new Date("2025-01-01"), value: 69.65},
  {date: new Date("2025-02-01"), value: 69.19},
  {date: new Date("2025-03-01"), value: 69.80},
  {date: new Date("2025-04-01"), value: 70.02}
];

display(Plot.plot({
  title: "Retail sales, Canada, January 2024 to April 2025 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [64, 72], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Newfoundland leads year-over-year gains

Newfoundland and Labrador led year-over-year sales growth at 6.8%, followed by British Columbia at 6.6%. Ontario posted the third-highest gain at 5.9%.

Yukon was the only jurisdiction to record a year-over-year decline at -1.4%. Prince Edward Island posted the smallest gain among provinces at 0.9%.

```js
const provincialData = [
  {province: "Newfoundland and Labrador", value: 6.8},
  {province: "British Columbia", value: 6.6},
  {province: "Ontario", value: 5.9},
  {province: "Manitoba", value: 4.5},
  {province: "Saskatchewan", value: 4.2},
  {province: "Nova Scotia", value: 3.8},
  {province: "Quebec", value: 3.4},
  {province: "Alberta", value: 3.1},
  {province: "New Brunswick", value: 2.8},
  {province: "Prince Edward Island", value: 0.9},
  {province: "Yukon", value: -1.4}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, April 2025 (%)",
  width: 680,
  height: 340,
  marginLeft: 170,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-3, 9]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([4.8], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 9,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 4.8, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "Newfoundland and Labrador",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead retail sales

Motor vehicle and parts dealers remained the largest retail subsector in April, with sales of $19.4 billion. Food and beverage retailers recorded sales of $13.3 billion.

| Retail subsector | Sales (April 2025) |
|---|---:|
| Motor vehicle and parts dealers | $19.4 billion |
| Food and beverage retailers | $13.3 billion |
| General merchandise retailers | $9.5 billion |
| Gasoline stations and fuel vendors | $6.3 billion |
| Health and personal care retailers | $5.9 billion |
| Building material and garden equipment dealers | $4.2 billion |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Retail Trade Survey provides monthly estimates of sales by retail store type and geography. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Retail Trade Survey
**Reference period:** April 2025
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-april-2025", "en"));
```
