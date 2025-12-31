---
title: Retail sales edge down 0.1% in October, Quebec and Saskatchewan lead year-over-year gains
toc: false
---

# Retail sales edge down 0.1% in October, Quebec and Saskatchewan lead year-over-year gains

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales edged down 0.1% in October 2023 to $66.5 billion, a slight pullback from September
- Year over year, sales were up 1.7%, with Quebec and Saskatchewan tied for the lead at 4.2%
- Three provinces recorded year-over-year declines: British Columbia, Newfoundland and Labrador, and Prince Edward Island
- Motor vehicle and parts dealers remained the largest retail subsector at $17.5 billion

</div>

Retail sales in Canada edged down 0.1% in October 2023 to $66.5 billion, a slight pullback from September's level. Year over year, sales were 1.7% higher than October 2022.

October 2023 saw an unusual tie at the top of provincial rankings, with both Quebec and Saskatchewan posting year-over-year growth of 4.2%. Three provinces recorded declines, all in the Atlantic and Pacific regions.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-11-01"), value: 65.41},
  {date: new Date("2022-12-01"), value: 64.68},
  {date: new Date("2023-01-01"), value: 66.27},
  {date: new Date("2023-02-01"), value: 65.67},
  {date: new Date("2023-03-01"), value: 65.35},
  {date: new Date("2023-04-01"), value: 65.63},
  {date: new Date("2023-05-01"), value: 65.66},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.89},
  {date: new Date("2023-08-01"), value: 65.93},
  {date: new Date("2023-09-01"), value: 66.58},
  {date: new Date("2023-10-01"), value: 66.51}
];

display(Plot.plot({
  title: "Retail sales, Canada, November 2022 to October 2023 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [63, 70], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Quebec and Saskatchewan tied for lead

Quebec and Saskatchewan both posted year-over-year growth of 4.2%, leading all provinces. New Brunswick followed at 2.8%, with Yukon at 2.6%.

Three provinces recorded year-over-year declines: British Columbia fell 1.0%, while Newfoundland and Labrador and Prince Edward Island both declined 1.1%—the steepest provincial drops.

```js
const provincialData = [
  {province: "Quebec", value: 4.2},
  {province: "Saskatchewan", value: 4.2},
  {province: "New Brunswick", value: 2.8},
  {province: "Yukon", value: 2.6},
  {province: "Ontario", value: 1.5},
  {province: "Alberta", value: 0.9},
  {province: "Nova Scotia", value: 0.7},
  {province: "Manitoba", value: 0.6},
  {province: "British Columbia", value: -1.0},
  {province: "Newfoundland and Labrador", value: -1.1},
  {province: "Prince Edward Island", value: -1.1}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, October 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-4, 6]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.7], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 6,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.7, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "Quebec",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in October, with sales of $17.5 billion. Food and beverage retailers recorded sales of $12.2 billion.

| Retail subsector | Sales (October 2023) |
|---|---:|
| Motor vehicle and parts dealers | $17.5B |
| Food and beverage retailers | $12.2B |
| General merchandise retailers | $8.4B |
| Gasoline stations and fuel vendors | $5.9B |
| Health and personal care retailers | $5.2B |
| Building material and garden equipment dealers | $3.6B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and geographic region. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** October 2023
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-october-2023", "en"));
```
