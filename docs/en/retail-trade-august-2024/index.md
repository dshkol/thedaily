---
title: Retail sales rise 0.3% in August, Yukon posts largest provincial decline at 9.0%
toc: false
---

# Retail sales rise 0.3% in August, Yukon posts largest provincial decline at 9.0%

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 0.3% in August 2024 to $67.1 billion, marking the second consecutive month of gains
- Year over year, sales were up 1.8%, with Newfoundland and Labrador (+11.3%) continuing double-digit growth
- Two provinces recorded year-over-year declines: British Columbia (-0.1%) and Yukon (-9.0%)
- Yukon's 9.0% decline was the largest provincial drop observed in the backfill series

</div>

Retail sales in Canada increased 0.3% in August 2024 to $67.1 billion, building on the 1.5% gain recorded in July. Year over year, sales were 1.8% higher than in August 2023.

The August increase marked the second consecutive month of growth following a two-month decline in May and June. Nine of eleven provinces and territories posted year-over-year gains.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-09-01"), value: 66.58},
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
  {date: new Date("2024-08-01"), value: 67.10}
];

display(Plot.plot({
  title: "Retail sales, Canada, September 2023 to August 2024 ($ billions)",
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

## Newfoundland and Labrador leads provincial gains, Yukon records sharp decline

Newfoundland and Labrador led year-over-year growth at 11.3%, maintaining its position as the only province with double-digit growth for the second consecutive month. New Brunswick followed at 4.4%, with Saskatchewan at 3.2%.

Two provinces recorded year-over-year declines. British Columbia posted a marginal decrease of 0.1%, while Yukon recorded a 9.0% decline—the largest provincial drop observed across the entire backfill series.

```js
const provincialData = [
  {province: "Newfoundland and Labrador", value: 11.3},
  {province: "New Brunswick", value: 4.4},
  {province: "Saskatchewan", value: 3.2},
  {province: "Nova Scotia", value: 2.9},
  {province: "Manitoba", value: 2.4},
  {province: "Quebec", value: 2.2},
  {province: "Alberta", value: 2.0},
  {province: "Prince Edward Island", value: 1.9},
  {province: "Ontario", value: 1.3},
  {province: "British Columbia", value: -0.1},
  {province: "Yukon", value: -9.0}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, August 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-12, 14]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.8], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 14,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.8, label: "Canada average"}], {
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

## Motor vehicle and parts dealers lead subsector sales

Motor vehicle and parts dealers remained the largest retail subsector in August, with sales of $18.0 billion. Food and beverage retailers recorded $12.7 billion in sales.

| Retail trade subsector | Sales (August 2024) |
|---|---:|
| Motor vehicle and parts dealers | $18.0B |
| Food and beverage retailers | $12.7B |
| General merchandise retailers | $8.9B |
| Gasoline stations and fuel vendors | $5.8B |
| Health and personal care retailers | $5.5B |
| Building material and garden equipment dealers | $3.9B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and by geographic area. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** August 2024
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-august-2024", "en"));
```
