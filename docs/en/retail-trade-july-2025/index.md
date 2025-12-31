---
title: Retail sales edge down 0.9% in July as motor vehicle sales slip
toc: false
---

# Retail sales edge down 0.9% in July as motor vehicle sales slip

<p class="release-date">Released: December 28, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales declined 0.9% in July 2025 to $69.5 billion, following a 1.4% increase in June
- Year over year, sales were up 4.0%, with British Columbia (+6.6%) leading provincial gains
- Motor vehicle and parts dealers recorded the largest dollar decline, falling $579 million from June
- Three provinces posted year-over-year declines: Newfoundland and Labrador (-2.1%), Yukon (-1.2%), and Saskatchewan (-0.9%)

</div>

Retail sales in Canada edged down 0.9% in July 2025 to $69.5 billion, partially offsetting the 1.4% gain recorded in June. Despite the monthly decline, sales remained 4.0% higher than in July 2024.

The July decline was broad-based, with 7 of 11 retail subsectors recording lower sales. Motor vehicle and parts dealers saw the largest dollar decline, while food and beverage retailers bucked the trend with a modest increase.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2024-01-01"), value: 67.28},
  {date: new Date("2024-02-01"), value: 67.44},
  {date: new Date("2024-03-01"), value: 67.02},
  {date: new Date("2024-04-01"), value: 66.89},
  {date: new Date("2024-05-01"), value: 66.74},
  {date: new Date("2024-06-01"), value: 67.40},
  {date: new Date("2024-07-01"), value: 66.87},
  {date: new Date("2024-08-01"), value: 67.03},
  {date: new Date("2024-09-01"), value: 67.45},
  {date: new Date("2024-10-01"), value: 67.89},
  {date: new Date("2024-11-01"), value: 68.30},
  {date: new Date("2024-12-01"), value: 70.03},
  {date: new Date("2025-01-01"), value: 69.65},
  {date: new Date("2025-02-01"), value: 69.19},
  {date: new Date("2025-03-01"), value: 69.80},
  {date: new Date("2025-04-01"), value: 70.02},
  {date: new Date("2025-05-01"), value: 69.16},
  {date: new Date("2025-06-01"), value: 70.14},
  {date: new Date("2025-07-01"), value: 69.53}
];

display(Plot.plot({
  title: "Retail sales, Canada, January 2024 to July 2025 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [64, 72], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## British Columbia leads year-over-year gains

British Columbia recorded the strongest year-over-year sales growth among provinces at 6.6%, with sales rising to $9.6 billion. Ontario (+4.5%) and Quebec (+3.6%) also posted above-average gains.

Three jurisdictions recorded year-over-year declines: Newfoundland and Labrador (-2.1%), Yukon (-1.2%), and Saskatchewan (-0.9%). These were the only regions to see lower sales compared with July 2024.

```js
const provincialData = [
  {province: "British Columbia", value: 6.6},
  {province: "Prince Edward Island", value: 5.3},
  {province: "New Brunswick", value: 4.6},
  {province: "Ontario", value: 4.5},
  {province: "Quebec", value: 3.6},
  {province: "Manitoba", value: 3.4},
  {province: "Nova Scotia", value: 3.3},
  {province: "Alberta", value: 2.6},
  {province: "Saskatchewan", value: -0.9},
  {province: "Yukon", value: -1.2},
  {province: "Newfoundland and Labrador", value: -2.1}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, July 2025 (%)",
  width: 680,
  height: 340,
  marginLeft: 170,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-4, 8]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([4.0], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 8,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 4.0, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "British Columbia",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers record largest decline

Motor vehicle and parts dealers led the decline in July, with sales falling to $19.3 billion from $19.9 billion in June. Automobile dealers accounted for most of this decrease.

Food and beverage retailers, the second-largest retail subsector, recorded a modest increase to $13.2 billion. Grocery and convenience retailers drove the gain.

| Retail subsector | Sales (July 2025) | Change from June |
|---|---:|---:|
| Motor vehicle and parts dealers | $19.3 billion | -3.0% |
| Food and beverage retailers | $13.2 billion | +0.5% |
| General merchandise retailers | $9.4 billion | -0.8% |
| Gasoline stations and fuel vendors | $6.1 billion | -1.6% |
| Health and personal care retailers | $6.0 billion | +0.2% |
| Building material and garden equipment dealers | $4.0 billion | -2.3% |
| Clothing and accessories retailers | $3.0 billion | -1.1% |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Retail Trade Survey provides monthly estimates of sales by retail store type and geography. Data for the most recent months are preliminary and subject to revision.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Retail Trade Survey
**Reference period:** July 2025
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-july-2025", "en"));
```
