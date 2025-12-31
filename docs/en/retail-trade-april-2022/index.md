---
title: Retail sales essentially unchanged in April, up 9.7% year over year
toc: false
---

# Retail sales essentially unchanged in April, up 9.7% year over year

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales were essentially unchanged in April 2022 at $64.1 billion
- Year over year, sales were up 9.7%, continuing the post-pandemic recovery
- Ontario led all provinces with 21.6% year-over-year growth
- Only the Northwest Territories posted a year-over-year decline

</div>

Retail sales in Canada were essentially unchanged in April 2022 at $64.1 billion. Year-over-year growth remained strong at 9.7%, reflecting continued consumer spending momentum compared to pandemic-affected April 2021.

Ontario continued to lead provincial performance with a 21.6% year-over-year gain, reflecting the province's comparison to restricted conditions in April 2021. All provinces and territories except the Northwest Territories recorded positive year-over-year growth.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
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
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09}
];

display(Plot.plot({
  title: "Retail sales, Canada, May 2021 to April 2022 ($ billions)",
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

## Ontario dominates provincial growth

Ontario led all provinces with year-over-year growth of 21.6%, more than double the national average. This reflects the province's continued recovery from extended pandemic restrictions in place during April 2021.

Saskatchewan (+7.3%) and Manitoba (+6.1%) rounded out the top three performers. Most provinces posted moderate gains, with only the Northwest Territories recording a year-over-year decline (-6.2%).

```js
const provincialData = [
  {province: "Ontario", value: 21.6},
  {province: "Saskatchewan", value: 7.3},
  {province: "Manitoba", value: 6.1},
  {province: "Nova Scotia", value: 5.1},
  {province: "Yukon", value: 4.8},
  {province: "Alberta", value: 4.4},
  {province: "Nunavut", value: 3.9},
  {province: "Quebec", value: 3.2},
  {province: "Newfoundland and Labrador", value: 2.8},
  {province: "British Columbia", value: 1.8},
  {province: "New Brunswick", value: 1.7},
  {province: "Prince Edward Island", value: 0.3},
  {province: "Northwest Territories", value: -6.2}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, April 2022 (%)",
  width: 680,
  height: 380,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-8, 24]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([9.7], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 24,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 9.7, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "Ontario",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in April, with sales of $16.1 billion. Food and beverage retailers recorded sales of $10.9 billion.

| Retail subsector | Sales (April 2022) |
|---|---:|
| Motor vehicle and parts dealers | $16.1B |
| Food and beverage retailers | $10.9B |
| General merchandise retailers | $7.7B |
| Gasoline stations and fuel vendors | $5.9B |
| Health and personal care retailers | $4.7B |
| Building material and garden equipment dealers | $3.5B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and geographic region. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** April 2022
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-april-2022", "en"));
```
