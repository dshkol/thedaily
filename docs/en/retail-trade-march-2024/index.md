---
title: Retail sales edge down 0.1% in March as Yukon leads year-over-year gains
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales edge down 0.1% in March as Yukon leads year-over-year gains

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Historical</span></p>

<div class="highlights">

**Highlights**

- Retail sales edged down 0.1% in March 2024 to $66.2 billion, following a marginal decline in February
- Year-over-year, sales were up 1.2%, with Yukon leading gains at 11.4%—the strongest provincial growth in the series
- Three western provinces posted year-over-year declines: Saskatchewan, British Columbia, and Alberta
- Atlantic provinces posted uniformly strong growth, with New Brunswick at 8.4%

</div>

Retail sales in Canada edged down 0.1% in March 2024 to $66.2 billion, following a marginal decline in February. Year-over-year, sales were 1.2% higher than March 2023.

March 2024 saw a notable divergence between eastern and western Canada. All Atlantic provinces posted strong year-over-year growth, while the three westernmost provinces—Saskatchewan, British Columbia, and Alberta—all recorded declines.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-04-01"), value: 65.60},
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
  {date: new Date("2024-03-01"), value: 66.16}
];

display(Plot.plot({
  title: "Retail sales, Canada, April 2023 to March 2024 ($ billions)",
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

## Yukon leads gains, western provinces lag

Yukon led all provinces with 11.4% year-over-year growth—the strongest provincial performance recorded in the retail trade series. New Brunswick followed at 8.4%, with Prince Edward Island at 6.5%.

Three western provinces recorded year-over-year declines. Saskatchewan and British Columbia both fell 0.6%, while Alberta declined 0.8%. These were the only provinces with negative year-over-year growth in March.

```js
const provincialData = [
  {province: "Yukon", value: 11.4},
  {province: "New Brunswick", value: 8.4},
  {province: "Prince Edward Island", value: 6.5},
  {province: "Nova Scotia", value: 5.1},
  {province: "Newfoundland and Labrador", value: 5.0},
  {province: "Ontario", value: 2.2},
  {province: "Quebec", value: 0.8},
  {province: "Manitoba", value: 0.6},
  {province: "Saskatchewan", value: -0.6},
  {province: "British Columbia", value: -0.6},
  {province: "Alberta", value: -0.8}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, March 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-4, 14]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.2], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 1.2, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "Yukon",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers remain top subsector

Motor vehicle and parts dealers remained the largest retail subsector in March, with sales of $17.6 billion. Food and beverage retailers recorded sales of $12.4 billion.

| Retail subsector | Sales (March 2024) |
|---|---:|
| Motor vehicle and parts dealers | $17.6B |
| Food and beverage retailers | $12.4B |
| General merchandise retailers | $8.6B |
| Gasoline stations and fuel vendors | $5.7B |
| Health and personal care retailers | $5.3B |
| Building materials and garden equipment dealers | $3.8B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and geographic area. Data for the most recent months are preliminary and subject to revision.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)
library(tidyr)

# Fetch retail trade data (seasonally adjusted)
retail <- get_cansim("20-10-0056")

# Total retail trade time series
total_retail <- retail %>%
  filter(GEO == "Canada",
         `North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         `Adjustments` == "Seasonally adjusted") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Month-over-month change
current <- total_retail %>% filter(REF_DATE == "2024-03") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2024-02") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2023-03") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2024-03",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2024-03", "2023-03"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2024-03` - `2023-03`) / `2023-03` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** March 2024
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-march-2024", "en"));
```
