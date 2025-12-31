---
title: Average weekly earnings down 0.2% in October, ending four-month streak
toc: false
---

# Average weekly earnings down 0.2% in October, ending four-month streak

<p class="release-date">Released: December 28, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Average weekly earnings declined 0.2% in October 2025 to $1,312.16, ending a four-month streak of increases
- Year over year, earnings were up 2.2%, slower than the 2.9% gain recorded in September
- Prince Edward Island led provincial gains (+4.3% year over year), while Alberta recorded the smallest increase (+0.5%)
- All 13 provinces and territories posted year-over-year gains despite the monthly decline

</div>

Average weekly earnings for employees paid by the hour declined 0.2% in October 2025 to $1,312.16, ending a four-month streak of consecutive increases that began in June. Despite the monthly decline, earnings remained 2.2% higher than in October 2024.

The decline in October partially offset gains recorded since June, when earnings began climbing from $1,300.24. The year-over-year growth rate of 2.2% was slower than the 2.9% pace observed in September.

```js
import * as Plot from "npm:@observablehq/plot";

const earningsData = [
  {date: new Date("2023-11-01"), value: 1223.83},
  {date: new Date("2023-12-01"), value: 1219.19},
  {date: new Date("2024-01-01"), value: 1227.18},
  {date: new Date("2024-02-01"), value: 1231.65},
  {date: new Date("2024-03-01"), value: 1237.47},
  {date: new Date("2024-04-01"), value: 1242.41},
  {date: new Date("2024-05-01"), value: 1252.05},
  {date: new Date("2024-06-01"), value: 1255.15},
  {date: new Date("2024-07-01"), value: 1265.97},
  {date: new Date("2024-08-01"), value: 1273.80},
  {date: new Date("2024-09-01"), value: 1277.47},
  {date: new Date("2024-10-01"), value: 1284.22},
  {date: new Date("2024-11-01"), value: 1285.64},
  {date: new Date("2024-12-01"), value: 1291.17},
  {date: new Date("2025-01-01"), value: 1295.73},
  {date: new Date("2025-02-01"), value: 1294.91},
  {date: new Date("2025-03-01"), value: 1287.74},
  {date: new Date("2025-04-01"), value: 1295.29},
  {date: new Date("2025-05-01"), value: 1293.24},
  {date: new Date("2025-06-01"), value: 1300.24},
  {date: new Date("2025-07-01"), value: 1306.77},
  {date: new Date("2025-08-01"), value: 1307.87},
  {date: new Date("2025-09-01"), value: 1314.87},
  {date: new Date("2025-10-01"), value: 1312.16}
];

display(Plot.plot({
  title: "Average weekly earnings, Canada, November 2023 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [1200, 1350], grid: true, label: "Dollars ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(earningsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(earningsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(earningsData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(2), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Atlantic provinces lead year-over-year gains

Prince Edward Island recorded the largest year-over-year increase in average weekly earnings at 4.3%, followed by Newfoundland and Labrador (+4.0%) and Nova Scotia (+3.5%). All three Atlantic provinces outpaced the national average of 2.2%.

Alberta posted the smallest year-over-year gain among provinces at 0.5%, despite having one of the highest average weekly earnings levels at $1,353.54. British Columbia (+1.7%) and Manitoba (+1.8%) also recorded below-average growth.

```js
const provincialData = [
  {province: "Prince Edward Island", value: 4.3},
  {province: "Newfoundland and Labrador", value: 4.0},
  {province: "Nova Scotia", value: 3.5},
  {province: "Saskatchewan", value: 3.3},
  {province: "Yukon", value: 3.2},
  {province: "Ontario", value: 2.9},
  {province: "New Brunswick", value: 2.1},
  {province: "Quebec", value: 2.0},
  {province: "Manitoba", value: 1.8},
  {province: "British Columbia", value: 1.7},
  {province: "Nunavut", value: 0.8},
  {province: "Northwest Territories", value: 0.8},
  {province: "Alberta", value: 0.5}
];

display(Plot.plot({
  title: "Year-over-year change in average weekly earnings by province, October 2025 (%)",
  width: 680,
  height: 380,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [0, 5]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: d => d.value >= 2.2 ? "#AF3C43" : "#666666"
    }),
    Plot.text(provincialData, {
      x: "value",
      y: "province",
      text: d => d.value.toFixed(1) + "%",
      dx: 4,
      textAnchor: "start",
      fontSize: 11
    }),
    Plot.ruleX([2.2], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.text([{x: 2.2, label: "Canada average"}], {
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

## Provincial earnings by level

While year-over-year growth varied widely across provinces, the territories continued to record the highest average weekly earnings levels. Nunavut led at $1,774.16, followed by the Northwest Territories at $1,753.40.

Among provinces, Alberta ($1,353.54), Ontario ($1,357.26), and British Columbia ($1,310.62) had the highest earnings levels. Prince Edward Island recorded the lowest provincial average at $1,141.86.

| Province/Territory | Earnings (October 2025) | Year-over-year change |
|---|---:|---:|
| Nunavut | $1,774.16 | +0.8% |
| Northwest Territories | $1,753.40 | +0.8% |
| Yukon | $1,514.94 | +3.2% |
| Ontario | $1,357.26 | +2.9% |
| Alberta | $1,353.54 | +0.5% |
| British Columbia | $1,310.62 | +1.7% |
| Newfoundland and Labrador | $1,293.43 | +4.0% |
| Saskatchewan | $1,277.40 | +3.3% |
| Quebec | $1,259.63 | +2.0% |
| New Brunswick | $1,193.47 | +2.1% |
| Nova Scotia | $1,179.42 | +3.5% |
| Manitoba | $1,177.18 | +1.8% |
| Prince Edward Island | $1,141.86 | +4.3% |

<div class="note-to-readers">

## Note to readers

Average weekly earnings are calculated by dividing total weekly earnings by the number of employees. Data are seasonally adjusted to account for regular patterns such as increased hiring around holidays.

The Survey of Employment, Payrolls and Hours provides monthly estimates of employment, earnings, and hours worked by industry and geography. It covers employees paid through payroll deduction who receive a T4 slip.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 14-10-0223](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410022301)
**Survey:** Survey of Employment, Payrolls and Hours
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/1410022301-eng](https://doi.org/10.25318/1410022301-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "weekly-earnings-october-2025", "en"));
```
