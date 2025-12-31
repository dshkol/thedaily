---
title: Crude oil production up 9% year over year in September despite monthly decline
toc: false
---

# Crude oil production up 9% year over year in September despite monthly decline

<p class="release-date">Released: December 28, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Canada's crude oil production totalled 145.1 million barrels in September 2025, down 4.0% from August but up 9.0% year over year
- Daily production averaged 4.8 million barrels, compared with 4.4 million barrels in September 2024
- Alberta accounted for 85% of national production and led year-over-year gains (+10.7%)
- Exports to the United States totalled 113 million barrels, representing 91% of total crude oil exports

</div>

Canada's crude oil production declined 4.0% in September 2025 to 145.1 million barrels, down from 151.1 million barrels in August. Despite the monthly decline, production was 9.0% higher than in September 2024, when output totalled 133.1 million barrels.

The September decline followed strong gains in July and August, when production reached 153.0 million and 151.1 million barrels respectively. On a daily basis, production averaged 4.8 million barrels in September 2025, compared with 4.4 million barrels in September 2024.

```js
import * as Plot from "npm:@observablehq/plot";

const productionData = [
  {date: new Date("2024-01-01"), value: 137.2},
  {date: new Date("2024-02-01"), value: 133.4},
  {date: new Date("2024-03-01"), value: 144.7},
  {date: new Date("2024-04-01"), value: 137.7},
  {date: new Date("2024-05-01"), value: 133.8},
  {date: new Date("2024-06-01"), value: 134.7},
  {date: new Date("2024-07-01"), value: 143.4},
  {date: new Date("2024-08-01"), value: 145.1},
  {date: new Date("2024-09-01"), value: 133.1},
  {date: new Date("2024-10-01"), value: 147.2},
  {date: new Date("2024-11-01"), value: 144.2},
  {date: new Date("2024-12-01"), value: 152.2},
  {date: new Date("2025-01-01"), value: 150.0},
  {date: new Date("2025-02-01"), value: 129.1},
  {date: new Date("2025-03-01"), value: 151.3},
  {date: new Date("2025-04-01"), value: 140.1},
  {date: new Date("2025-05-01"), value: 131.8},
  {date: new Date("2025-06-01"), value: 140.2},
  {date: new Date("2025-07-01"), value: 153.0},
  {date: new Date("2025-08-01"), value: 151.1},
  {date: new Date("2025-09-01"), value: 145.1}
];

display(Plot.plot({
  title: "Crude oil production, Canada, January 2024 to September 2025 (million barrels)",
  width: 680,
  height: 300,
  y: {domain: [120, 160], grid: true, label: "Million barrels"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(productionData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(productionData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(productionData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1) + "M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Alberta drives national production gains

Alberta produced 123.7 million barrels in September 2025, accounting for 85% of national crude oil production. The province's output was up 10.7% from September 2024, when it produced 111.8 million barrels.

Saskatchewan, the second-largest producing province, saw production decline 3.5% year over year to 12.6 million barrels. British Columbia recorded the largest percentage decline among producing provinces, with output falling 19.9% to 0.3 million barrels.

**Newfoundland and Labrador** posted the second-highest growth rate at 8.6%, with production rising to 7.1 million barrels from 6.6 million barrels in September 2024.

```js
const provincialData = [
  {province: "Alberta", value: 10.7, production: 123.7},
  {province: "Newfoundland and Labrador", value: 8.6, production: 7.1},
  {province: "Ontario", value: 6.0, production: 0.02},
  {province: "Manitoba", value: 2.4, production: 1.3},
  {province: "Saskatchewan", value: -3.5, production: 12.6},
  {province: "Northwest Territories", value: -4.2, production: 0.1},
  {province: "British Columbia", value: -19.9, production: 0.3}
];

display(Plot.plot({
  title: "Year-over-year change in crude oil production by province, September 2025 (%)",
  width: 680,
  height: 280,
  marginLeft: 170,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-25, 15]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 15,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    })
  ]
}));
```

## Crude bitumen largest production component

Non-upgraded crude bitumen production totalled 67.9 million barrels in September 2025, representing the largest component of Canada's crude oil supply. Synthetic crude oil production, derived from upgraded bitumen, added another 39.3 million barrels.

Light and medium crude oil production reached 24.8 million barrels, while heavy crude oil production totalled 13.2 million barrels.

| Production type | September 2025 (million barrels) | Share of total |
|---|---:|---:|
| Non-upgraded crude bitumen | 67.9 | 47% |
| Synthetic crude oil | 39.3 | 27% |
| Light and medium crude oil | 24.8 | 17% |
| Heavy crude oil | 13.2 | 9% |

## Exports down from August but up year over year

Canada exported 124.3 million barrels of crude oil in September 2025, down from 132.6 million barrels in August but up from 115.7 million barrels in September 2024.

Exports to the United States totalled 113.0 million barrels, representing 91% of total crude oil exports. Exports to other countries amounted to 11.6 million barrels.

| Destination | September 2025 (million barrels) | Share of exports |
|---|---:|---:|
| United States | 113.0 | 91% |
| Other countries | 11.6 | 9% |
| **Total exports** | **124.3** | **100%** |

<div class="note-to-readers">

## Note to readers

Crude oil production includes conventional crude oil (light, medium, and heavy), crude bitumen from oil sands operations (both mined and in-situ), and synthetic crude oil produced from upgraded bitumen.

Data are collected through the Monthly Oil and Gas Survey and are subject to revision as more complete information becomes available.

Production volumes are reported in barrels. One barrel equals approximately 159 litres.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 25-10-0063](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2510006301)
**Survey:** Monthly Oil and Gas Survey
**Reference period:** September 2025
**DOI:** [https://doi.org/10.25318/2510006301-eng](https://doi.org/10.25318/2510006301-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "crude-oil-production-september-2025", "en"));
```
