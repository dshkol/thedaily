---
title: Retail sales dip 1.1% in December, capping strong year with 5.5% annual growth
toc: false
---

# Retail sales dip 1.1% in December, capping strong year with 5.5% annual growth

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales fell 1.1% in December 2022 to $64.7 billion, a typical post-holiday adjustment
- Year over year, sales were up 5.5%, reflecting strong consumer spending throughout 2022
- Newfoundland and Labrador led provincial growth at 9.8% year over year
- Only the Northwest Territories recorded a year-over-year decline (-4.2%)

</div>

Retail sales in Canada fell 1.1% in December 2022 to $64.7 billion, a typical seasonal adjustment following elevated holiday spending. Despite the monthly decline, year-over-year growth remained robust at 5.5%, capping a strong year for the retail sector.

The December results reflected broad-based annual growth across nearly all provinces and territories, with only the Northwest Territories posting a year-over-year decline.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-01-01"), value: 62.94},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.90},
  {date: new Date("2022-08-01"), value: 65.16},
  {date: new Date("2022-09-01"), value: 64.85},
  {date: new Date("2022-10-01"), value: 65.40},
  {date: new Date("2022-11-01"), value: 65.41},
  {date: new Date("2022-12-01"), value: 64.68}
];

display(Plot.plot({
  title: "Retail sales, Canada, January to December 2022 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [61, 68], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Atlantic provinces lead annual growth

Newfoundland and Labrador led all provinces with exceptional year-over-year growth of 9.8%, followed closely by Manitoba at 9.5% and Prince Edward Island at 9.2%. Alberta continued its strong performance with 8.1% annual growth.

Nearly all provinces recorded positive year-over-year growth, with only the Northwest Territories posting a decline at -4.2%.

```js
const provincialData = [
  {province: "Newfoundland and Labrador", value: 9.8},
  {province: "Manitoba", value: 9.5},
  {province: "Prince Edward Island", value: 9.2},
  {province: "Alberta", value: 8.1},
  {province: "Quebec", value: 7.6},
  {province: "Nova Scotia", value: 6.7},
  {province: "Saskatchewan", value: 5.2},
  {province: "New Brunswick", value: 4.8},
  {province: "Ontario", value: 4.2},
  {province: "Yukon", value: 3.2},
  {province: "British Columbia", value: 1.7},
  {province: "Northwest Territories", value: -4.2}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, December 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-6, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([5.5], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 5.5, label: "Canada average"}], {
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

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in December, with sales of $16.8 billion. Food and beverage retailers recorded sales of $11.6 billion.

| Retail subsector | Sales (December 2022) |
|---|---:|
| Motor vehicle and parts dealers | $16.8B |
| Food and beverage retailers | $11.6B |
| General merchandise retailers | $8.2B |
| Gasoline stations and fuel vendors | $5.9B |
| Health and personal care retailers | $4.9B |
| Building material and garden equipment dealers | $3.3B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and geographic region. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** December 2022
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-december-2022", "en"));
```
