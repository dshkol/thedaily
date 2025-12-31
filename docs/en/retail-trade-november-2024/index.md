---
title: Retail sales edge up 0.4% in November as holiday shopping begins
toc: false
---

# Retail sales edge up 0.4% in November as holiday shopping begins

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales increased 0.4% in November 2024 to $68.3 billion, as early holiday shopping lifted consumer spending
- Year over year, sales were up 2.6%, with Newfoundland and Labrador (+9.2%) leading provincial gains
- Eight of eleven provinces and territories posted positive year-over-year growth
- Prince Edward Island (-5.3%) and New Brunswick (-2.9%) recorded the largest declines

</div>

Retail sales in Canada rose 0.4% in November 2024 to $68.3 billion, as early holiday shopping began to boost consumer spending. Year over year, sales were 2.6% higher than in November 2023.

The November increase followed a 0.4% gain in October. Eight of eleven provinces and territories recorded positive year-over-year growth, though three Atlantic and Northern regions saw declines.

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
  {date: new Date("2024-11-01"), value: 68.30}
];

display(Plot.plot({
  title: "Retail sales, Canada, January to November 2024 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [64, 70], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Newfoundland and Labrador leads provincial gains

Newfoundland and Labrador led year-over-year growth at 9.2%, followed by Alberta at 4.4% and Saskatchewan at 3.4%. Nova Scotia posted gains of 3.3%.

Prince Edward Island recorded the largest decline at -5.3%, followed by New Brunswick at -2.9% and Yukon at -2.8%. This marked an unusual month with three regions posting negative year-over-year changes.

```js
const provincialData = [
  {province: "Newfoundland and Labrador", value: 9.2},
  {province: "Alberta", value: 4.4},
  {province: "Saskatchewan", value: 3.4},
  {province: "Nova Scotia", value: 3.3},
  {province: "Ontario", value: 2.5},
  {province: "Quebec", value: 2.4},
  {province: "Manitoba", value: 2.0},
  {province: "British Columbia", value: 1.9},
  {province: "Yukon", value: -2.8},
  {province: "New Brunswick", value: -2.9},
  {province: "Prince Edward Island", value: -5.3}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, November 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-8, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([2.6], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 12,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 2.6, label: "Canada average"}], {
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

## Motor vehicle dealers lead retail subsectors

Motor vehicle and parts dealers remained the largest retail subsector in November, with sales of $18.6 billion. Food and beverage retailers recorded sales of $13.1 billion.

| Retail subsector | Sales (November 2024) |
|---|---:|
| Motor vehicle and parts dealers | $18.6B |
| Food and beverage retailers | $13.1B |
| General merchandise retailers | $9.2B |
| Gasoline stations and fuel vendors | $5.8B |
| Health and personal care retailers | $5.7B |
| Building material and garden equipment dealers | $3.9B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and by geographic area. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** November 2024
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-november-2024", "en"));
```
