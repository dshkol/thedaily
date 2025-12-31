---
title: Retail sales rise 1.1% in March to $64.1 billion, up 3.8% year over year
toc: false
---

# Retail sales rise 1.1% in March to $64.1 billion, up 3.8% year over year

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 1.1% in March 2022 to $64.1 billion
- Year over year, sales were up 3.8%, a more moderate pace as base effects normalized
- Saskatchewan led all provinces with 7.2% year-over-year growth
- Only the Northwest Territories posted a year-over-year decline

</div>

Retail sales in Canada rose 1.1% in March 2022 to $64.1 billion. Year-over-year growth moderated to 3.8%, reflecting a more normalized comparison as the March 2021 base was less affected by pandemic restrictions than April or May 2021.

Provincial performance was relatively balanced in March, with Saskatchewan leading at 7.2% year-over-year growth. New Brunswick (+7.0%) and Newfoundland and Labrador (+6.6%) also posted solid gains. All provinces and territories except the Northwest Territories recorded positive year-over-year growth.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-04-01"), value: 58.40},
  {date: new Date("2021-05-01"), value: 56.95},
  {date: new Date("2021-06-01"), value: 59.65},
  {date: new Date("2021-07-01"), value: 60.15},
  {date: new Date("2021-08-01"), value: 61.11},
  {date: new Date("2021-09-01"), value: 60.84},
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11}
];

display(Plot.plot({
  title: "Retail sales, Canada, April 2021 to March 2022 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [54, 66], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Saskatchewan leads provincial growth

Saskatchewan led all provinces with year-over-year growth of 7.2%, followed closely by New Brunswick at 7.0% and Newfoundland and Labrador at 6.6%. Alberta also posted a strong 6.5% gain.

Most provinces recorded positive year-over-year growth, with only the Northwest Territories posting a decline (-9.0%).

```js
const provincialData = [
  {province: "Saskatchewan", value: 7.2},
  {province: "New Brunswick", value: 7.0},
  {province: "Newfoundland and Labrador", value: 6.6},
  {province: "Alberta", value: 6.5},
  {province: "Yukon", value: 5.6},
  {province: "Ontario", value: 5.1},
  {province: "Nova Scotia", value: 4.2},
  {province: "Prince Edward Island", value: 4.2},
  {province: "Manitoba", value: 1.8},
  {province: "British Columbia", value: 1.5},
  {province: "Nunavut", value: 1.1},
  {province: "Quebec", value: 0.9},
  {province: "Northwest Territories", value: -9.0}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, March 2022 (%)",
  width: 680,
  height: 380,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-10, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([3.8], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 3.8, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "Saskatchewan",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in March, with sales of $16.0 billion. Food and beverage retailers recorded sales of $11.0 billion.

| Retail subsector | Sales (March 2022) |
|---|---:|
| Motor vehicle and parts dealers | $16.0B |
| Food and beverage retailers | $11.0B |
| General merchandise retailers | $7.7B |
| Gasoline stations and fuel vendors | $5.8B |
| Health and personal care retailers | $4.7B |
| Building material and garden equipment dealers | $3.4B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and geographic region. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** March 2022
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-march-2022", "en"));
```
