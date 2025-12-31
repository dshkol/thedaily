---
title: Retail sales rise 2.5% in December as holiday shopping lifts sales to $70.0 billion
toc: false
---

# Retail sales rise 2.5% in December as holiday shopping lifts sales to $70.0 billion

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 2.5% in December 2024 to $70.0 billion, driven by holiday shopping
- Year over year, sales were up 5.6%, with Newfoundland and Labrador (+7.8%) leading provincial gains
- Ten of eleven provinces and territories recorded positive year-over-year growth
- Yukon was the only jurisdiction to post a year-over-year decline (-2.9%)

</div>

Retail sales in Canada rose 2.5% in December 2024 to $70.0 billion, the highest monthly total of the year as holiday shopping drove consumer spending higher. Year over year, sales were up 5.6% compared with December 2023.

The December increase marked the strongest monthly gain since August 2024. Ten of eleven provinces and territories recorded positive year-over-year growth, led by Newfoundland and Labrador at 7.8%.

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
  {date: new Date("2024-12-01"), value: 70.03}
];

display(Plot.plot({
  title: "Retail sales, Canada, January to December 2024 ($ billions)",
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

Newfoundland and Labrador led year-over-year sales growth at 7.8%, followed by Quebec at 7.3% and Manitoba at 6.9%. Alberta posted gains of 6.4%.

Yukon was the only jurisdiction to record a year-over-year decline at -2.9%. British Columbia posted the smallest gain among provinces at 3.6%.

```js
const provincialData = [
  {province: "Newfoundland and Labrador", value: 7.8},
  {province: "Quebec", value: 7.3},
  {province: "Manitoba", value: 6.9},
  {province: "Alberta", value: 6.4},
  {province: "Prince Edward Island", value: 5.9},
  {province: "Ontario", value: 5.0},
  {province: "New Brunswick", value: 4.7},
  {province: "Nova Scotia", value: 4.5},
  {province: "Saskatchewan", value: 4.4},
  {province: "British Columbia", value: 3.6},
  {province: "Yukon", value: -2.9}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, December 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 170,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-5, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([5.6], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 10,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 5.6, label: "Canada average"}], {
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

Motor vehicle and parts dealers remained the largest retail subsector in December, with sales of $19.0 billion. Food and beverage retailers recorded sales of $13.3 billion.

| Retail subsector | Sales (December 2024) |
|---|---:|
| Motor vehicle and parts dealers | $19.0 billion |
| Food and beverage retailers | $13.3 billion |
| General merchandise retailers | $9.5 billion |
| Gasoline stations and fuel vendors | $6.0 billion |
| Health and personal care retailers | $5.8 billion |
| Building material and garden equipment dealers | $4.0 billion |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Retail Trade Survey provides monthly estimates of sales by retail store type and geography. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Retail Trade Survey
**Reference period:** December 2024
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-december-2024", "en"));
```
