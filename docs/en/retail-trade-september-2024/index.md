---
title: Retail sales rise 0.6% in September as Newfoundland posts double-digit year-over-year growth
toc: false
---

# Retail sales rise 0.6% in September as Newfoundland posts double-digit year-over-year growth

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales increased 0.6% in September 2024 to $67.5 billion, the third consecutive monthly gain
- Year over year, sales were up 1.4%, with Newfoundland and Labrador (+10.6%) posting double-digit growth
- Ten of eleven provinces and territories posted positive year-over-year growth
- Manitoba (-0.3%) was the only province to record a decline

</div>

Retail sales in Canada rose 0.6% in September 2024 to $67.5 billion, marking the third consecutive monthly gain. Year over year, sales were 1.4% higher than in September 2023.

The September increase followed gains of 0.3% in August and 1.5% in July. Ten of eleven provinces and territories recorded positive year-over-year growth.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-10-01"), value: 66.51},
  {date: new Date("2023-11-01"), value: 66.56},
  {date: new Date("2023-12-01"), value: 66.32},
  {date: new Date("2024-01-01"), value: 66.08},
  {date: new Date("2024-02-01"), value: 66.24},
  {date: new Date("2024-03-01"), value: 66.16},
  {date: new Date("2024-04-01"), value: 66.78},
  {date: new Date("2024-05-01"), value: 65.96},
  {date: new Date("2024-06-01"), value: 65.89},
  {date: new Date("2024-07-01"), value: 66.89},
  {date: new Date("2024-08-01"), value: 67.10},
  {date: new Date("2024-09-01"), value: 67.51}
];

display(Plot.plot({
  title: "Retail sales, Canada, October 2023 to September 2024 ($ billions)",
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

Newfoundland and Labrador led year-over-year growth at 10.6%, the only province to post double-digit growth. Alberta followed at 4.5%, with Prince Edward Island at 3.1%.

Manitoba recorded the only decline at -0.3%, an unusual result as the province typically posts positive growth. All other jurisdictions recorded gains, including Yukon at +0.7%.

```js
const provincialData = [
  {province: "Newfoundland and Labrador", value: 10.6},
  {province: "Alberta", value: 4.5},
  {province: "Prince Edward Island", value: 3.1},
  {province: "New Brunswick", value: 2.2},
  {province: "Quebec", value: 1.6},
  {province: "Nova Scotia", value: 1.3},
  {province: "Saskatchewan", value: 0.7},
  {province: "British Columbia", value: 0.7},
  {province: "Yukon", value: 0.7},
  {province: "Ontario", value: 0.2},
  {province: "Manitoba", value: -0.3}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, September 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-2, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.4], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 1.4, label: "Canada average"}], {
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

Motor vehicle and parts dealers remained the largest retail subsector in September, with sales of $18.1 billion. Food and beverage retailers recorded sales of $12.8 billion.

| Retail subsector | Sales (September 2024) |
|---|---:|
| Motor vehicle and parts dealers | $18.1B |
| Food and beverage retailers | $12.8B |
| General merchandise retailers | $9.0B |
| Gasoline stations and fuel vendors | $5.8B |
| Health and personal care retailers | $5.6B |
| Building material and garden equipment dealers | $3.9B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and by geographic area. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** September 2024
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-september-2024", "en"));
```
