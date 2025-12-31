---
title: Retail sales fall 2.9% in July, but annual growth remains strong at 7.9%
toc: false
---

# Retail sales fall 2.9% in July, but annual growth remains strong at 7.9%

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales fell 2.9% in July 2022 to $64.9 billion, a notable pullback from June's peak
- Year over year, sales were up 7.9%, maintaining strong annual growth momentum
- Prince Edward Island led all provinces with exceptional 16.7% year-over-year growth
- Seven provinces posted double-digit year-over-year gains

</div>

Retail sales in Canada fell 2.9% in July 2022 to $64.9 billion, a notable pullback from June's record high of $66.8 billion. Despite the monthly decline, year-over-year growth remained exceptionally strong at 7.9%.

July 2022 was remarkable for its regional performance, with seven provinces posting double-digit year-over-year gains. Prince Edward Island led with exceptional growth of 16.7%, followed by Yukon at 13.2% and New Brunswick at 12.0%.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-08-01"), value: 61.11},
  {date: new Date("2021-09-01"), value: 60.84},
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.89}
];

display(Plot.plot({
  title: "Retail sales, Canada, August 2021 to July 2022 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [59, 68], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Prince Edward Island leads exceptional provincial growth

Prince Edward Island led all provinces with exceptional year-over-year growth of 16.7%—the highest provincial reading in recent months. Yukon followed at 13.2%, with New Brunswick, Manitoba, Alberta, Newfoundland and Labrador, and Nova Scotia all posting double-digit gains.

Only the Northwest Territories recorded a year-over-year decline, and by just 1.7%.

```js
const provincialData = [
  {province: "Prince Edward Island", value: 16.7},
  {province: "Yukon", value: 13.2},
  {province: "New Brunswick", value: 12.0},
  {province: "Manitoba", value: 11.3},
  {province: "Alberta", value: 11.3},
  {province: "Newfoundland and Labrador", value: 11.1},
  {province: "Nova Scotia", value: 10.8},
  {province: "Quebec", value: 8.7},
  {province: "Saskatchewan", value: 7.6},
  {province: "Ontario", value: 7.0},
  {province: "British Columbia", value: 3.8},
  {province: "Northwest Territories", value: -1.7}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, July 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-4, 20]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([7.9], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 20,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 7.9, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "Prince Edward Island",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in July, with sales of $16.4 billion. Food and beverage retailers recorded sales of $11.4 billion.

| Retail subsector | Sales (July 2022) |
|---|---:|
| Motor vehicle and parts dealers | $16.4B |
| Food and beverage retailers | $11.4B |
| General merchandise retailers | $7.8B |
| Gasoline stations and fuel vendors | $6.1B |
| Health and personal care retailers | $4.8B |
| Building material and garden equipment dealers | $3.5B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and geographic region. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** July 2022
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-july-2022", "en"));
```
