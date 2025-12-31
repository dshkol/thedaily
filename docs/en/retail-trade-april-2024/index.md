---
title: Retail sales rise 0.9% in April as Newfoundland leads year-over-year gains
toc: false
---

# Retail sales rise 0.9% in April as Newfoundland leads year-over-year gains

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Historical</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 0.9% in April 2024 to $66.8 billion, following a 0.9% gain in March
- Year-over-year, sales were up 1.7%, with Newfoundland and Labrador leading gains at 9.3%
- Two provinces posted year-over-year declines: Ontario at -0.7% and Nova Scotia at -1.1%
- Yukon recorded strong growth of 8.5%, in contrast to declines seen in later months

</div>

Retail sales in Canada rose 0.9% in April 2024 to $66.8 billion, matching March's 0.9% gain. Year-over-year, sales were 1.7% higher than April 2023.

April 2024 marked a relative high point for retail trade, with only two provinces recording year-over-year declines. This contrasts with May and June 2024, when the number of declining provinces would increase to four and five respectively.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-05-01"), value: 65.70},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.90},
  {date: new Date("2023-08-01"), value: 65.90},
  {date: new Date("2023-09-01"), value: 66.60},
  {date: new Date("2023-10-01"), value: 66.50},
  {date: new Date("2023-11-01"), value: 66.60},
  {date: new Date("2023-12-01"), value: 66.30},
  {date: new Date("2024-01-01"), value: 66.10},
  {date: new Date("2024-02-01"), value: 66.20},
  {date: new Date("2024-03-01"), value: 66.20},
  {date: new Date("2024-04-01"), value: 66.78}
];

display(Plot.plot({
  title: "Retail sales, Canada, May 2023 to April 2024 ($ billions)",
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

## Atlantic provinces lead gains, Ontario and Nova Scotia decline

Newfoundland and Labrador led all provinces with 9.3% year-over-year growth, followed by Prince Edward Island at 8.9%. Yukon recorded 8.5% growth, a notably strong performance compared to declines the territory would experience in later months.

Two provinces recorded year-over-year declines. Nova Scotia fell 1.1%, while Ontario edged down 0.7%. These were the only provinces with negative year-over-year growth in April.

```js
const provincialData = [
  {province: "Newfoundland and Labrador", value: 9.3},
  {province: "Prince Edward Island", value: 8.9},
  {province: "Yukon", value: 8.5},
  {province: "New Brunswick", value: 7.5},
  {province: "Saskatchewan", value: 5.4},
  {province: "Manitoba", value: 3.2},
  {province: "Alberta", value: 3.2},
  {province: "British Columbia", value: 2.9},
  {province: "Quebec", value: 2.7},
  {province: "Ontario", value: -0.7},
  {province: "Nova Scotia", value: -1.1}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, April 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-4, 12]},
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
      x: 12,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.7, label: "Canada average"}], {
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

## Motor vehicle dealers remain top subsector

Motor vehicle and parts dealers remained the largest retail subsector in April, with sales of $17.8 billion. Food and beverage retailers recorded sales of $12.4 billion.

| Retail subsector | Sales (April 2024) |
|---|---:|
| Motor vehicle and parts dealers | $17.8B |
| Food and beverage retailers | $12.4B |
| General merchandise retailers | $8.7B |
| Gasoline stations and fuel vendors | $5.8B |
| Health and personal care retailers | $5.3B |
| Building materials and garden equipment dealers | $4.0B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and geographic area. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** April 2024
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-april-2024", "en"));
```
