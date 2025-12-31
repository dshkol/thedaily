---
title: Retail sales edge up 0.1% in August, Yukon posts exceptional 14.9% year-over-year growth
toc: false
---

# Retail sales edge up 0.1% in August, Yukon posts exceptional 14.9% year-over-year growth

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales edged up 0.1% in August 2023 to $65.9 billion, essentially flat from July
- Year over year, sales were up 1.2%, with Yukon posting an exceptional gain of 14.9%
- Four provinces recorded year-over-year declines: Manitoba, Saskatchewan, British Columbia, and Newfoundland and Labrador
- New Brunswick continued its strong performance with 6.2% year-over-year growth

</div>

Retail sales in Canada edged up 0.1% in August 2023 to $65.9 billion, essentially flat from July's level. Year over year, sales were 1.2% higher than August 2022.

August 2023 saw a sharp divide between provinces, with Yukon posting an exceptional 14.9% year-over-year gain while four provinces recorded declines. Western Canada and Newfoundland showed particular weakness.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-09-01"), value: 64.85},
  {date: new Date("2022-10-01"), value: 65.40},
  {date: new Date("2022-11-01"), value: 65.41},
  {date: new Date("2022-12-01"), value: 64.68},
  {date: new Date("2023-01-01"), value: 66.27},
  {date: new Date("2023-02-01"), value: 65.67},
  {date: new Date("2023-03-01"), value: 65.35},
  {date: new Date("2023-04-01"), value: 65.63},
  {date: new Date("2023-05-01"), value: 65.66},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.89},
  {date: new Date("2023-08-01"), value: 65.93}
];

display(Plot.plot({
  title: "Retail sales, Canada, September 2022 to August 2023 ($ billions)",
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

## Yukon leads with exceptional growth

Yukon led all provinces with an exceptional year-over-year growth of 14.9%, the strongest provincial performance in the retail trade series in recent months. New Brunswick followed at 6.2%, with Prince Edward Island at 4.5%.

Four provinces recorded year-over-year declines. Manitoba fell 0.4% and Saskatchewan dropped 0.5%, while British Columbia declined 1.9% and Newfoundland and Labrador fell 2.0%—the steepest provincial decline.

```js
const provincialData = [
  {province: "Yukon", value: 14.9},
  {province: "New Brunswick", value: 6.2},
  {province: "Prince Edward Island", value: 4.5},
  {province: "Quebec", value: 3.5},
  {province: "Nova Scotia", value: 2.5},
  {province: "Alberta", value: 1.3},
  {province: "Ontario", value: 1.0},
  {province: "Manitoba", value: -0.4},
  {province: "Saskatchewan", value: -0.5},
  {province: "British Columbia", value: -1.9},
  {province: "Newfoundland and Labrador", value: -2.0}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, August 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-5, 18]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.2], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 18,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.2, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "Yukon",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in August, with sales of $17.4 billion. Food and beverage retailers recorded sales of $12.1 billion.

| Retail subsector | Sales (August 2023) |
|---|---:|
| Motor vehicle and parts dealers | $17.4B |
| Food and beverage retailers | $12.1B |
| General merchandise retailers | $8.4B |
| Gasoline stations and fuel vendors | $6.0B |
| Health and personal care retailers | $5.1B |
| Building material and garden equipment dealers | $3.7B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and geographic region. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** August 2023
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-august-2023", "en"));
```
