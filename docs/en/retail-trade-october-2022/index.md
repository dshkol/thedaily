---
title: Retail sales up 0.8% in October, all provinces post year-over-year gains
toc: false
---

# Retail sales up 0.8% in October, all provinces post year-over-year gains

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 0.8% in October 2022 to $65.4 billion
- Year over year, sales were up 6.1%, a solid pace of annual growth
- New Brunswick led all provinces with 11.6% year-over-year growth
- All provinces and territories recorded positive year-over-year gains

</div>

Retail sales in Canada rose 0.8% in October 2022 to $65.4 billion, rebounding after a slight decline in September. Year-over-year growth was robust at 6.1%, reflecting continued consumer spending.

October 2022 was notable for its universally positive regional performance, with every province and territory posting year-over-year gains. Atlantic Canada led the growth, with New Brunswick and Prince Edward Island posting exceptional gains.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.89},
  {date: new Date("2022-08-01"), value: 65.16},
  {date: new Date("2022-09-01"), value: 64.85},
  {date: new Date("2022-10-01"), value: 65.40}
];

display(Plot.plot({
  title: "Retail sales, Canada, November 2021 to October 2022 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [60, 68], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Atlantic Canada leads growth

New Brunswick led all provinces with exceptional year-over-year growth of 11.6%, followed by Prince Edward Island at 9.2% and Newfoundland and Labrador at 8.3%. Saskatchewan and Manitoba also posted strong gains above 7%.

For the first time in recent months, every province and territory recorded positive year-over-year growth, with even the lowest performer (Northwest Territories) posting a gain of 2.6%.

```js
const provincialData = [
  {province: "New Brunswick", value: 11.6},
  {province: "Prince Edward Island", value: 9.2},
  {province: "Newfoundland and Labrador", value: 8.3},
  {province: "Saskatchewan", value: 8.2},
  {province: "Manitoba", value: 7.9},
  {province: "Quebec", value: 7.3},
  {province: "Nova Scotia", value: 7.0},
  {province: "Yukon", value: 6.4},
  {province: "Alberta", value: 6.2},
  {province: "Ontario", value: 5.5},
  {province: "British Columbia", value: 3.7},
  {province: "Northwest Territories", value: 2.6}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, October 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [0, 14]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([6.1], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: "value",
      y: "province",
      text: d => "+" + d.value.toFixed(1) + "%",
      dx: 4,
      textAnchor: "start",
      fontSize: 10
    }),
    Plot.text([{x: 6.1, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "New Brunswick",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in October, with sales of $16.8 billion. Food and beverage retailers recorded sales of $11.5 billion.

| Retail subsector | Sales (October 2022) |
|---|---:|
| Motor vehicle and parts dealers | $16.8B |
| Food and beverage retailers | $11.5B |
| General merchandise retailers | $8.0B |
| Gasoline stations and fuel vendors | $6.0B |
| Health and personal care retailers | $4.9B |
| Building material and garden equipment dealers | $3.4B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and geographic region. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** October 2022
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-october-2022", "en"));
```
