---
title: Retail sales rise 0.4% in April, Nova Scotia leads provinces with 9.0% annual gain
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales rise 0.4% in April, Nova Scotia leads provinces with 9.0% annual gain

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 0.4% in April 2023 to $65.6 billion, building on March's gains
- Year over year, sales were up 2.4%, a solid pace of growth compared with April 2022
- Nova Scotia led all provinces with exceptional 9.0% year-over-year growth
- Three provinces recorded declines: Saskatchewan, Newfoundland and Labrador, and British Columbia

</div>

Retail sales in Canada rose 0.4% in April 2023 to $65.6 billion, building on the previous month's gains. Year over year, sales were up 2.4% compared with April 2022, a solid pace of annual growth.

April 2023 saw wide regional divergence in retail performance, with Nova Scotia posting exceptional growth at 9.0% year over year while British Columbia lagged at -1.8%. Atlantic Canada broadly outperformed, while western provinces showed mixed results.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.90},
  {date: new Date("2022-08-01"), value: 65.16},
  {date: new Date("2022-09-01"), value: 64.85},
  {date: new Date("2022-10-01"), value: 65.40},
  {date: new Date("2022-11-01"), value: 65.41},
  {date: new Date("2022-12-01"), value: 64.68},
  {date: new Date("2023-01-01"), value: 66.27},
  {date: new Date("2023-02-01"), value: 65.67},
  {date: new Date("2023-03-01"), value: 65.35},
  {date: new Date("2023-04-01"), value: 65.63}
];

display(Plot.plot({
  title: "Retail sales, Canada, May 2022 to April 2023 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [63, 68], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Nova Scotia posts exceptional growth

Nova Scotia led all provinces with exceptional year-over-year growth of 9.0%, far ahead of any other province. Yukon followed at 6.2%, with Manitoba at 5.9% and Alberta at 5.6%.

Three provinces recorded year-over-year declines. Saskatchewan fell 0.7%, Newfoundland and Labrador declined 1.5%, and British Columbia dropped 1.8%.

```js
const provincialData = [
  {province: "Nova Scotia", value: 9.0},
  {province: "Yukon", value: 6.2},
  {province: "Manitoba", value: 5.9},
  {province: "Alberta", value: 5.6},
  {province: "Quebec", value: 5.2},
  {province: "Prince Edward Island", value: 3.9},
  {province: "New Brunswick", value: 3.7},
  {province: "Ontario", value: 0.9},
  {province: "Saskatchewan", value: -0.7},
  {province: "Newfoundland and Labrador", value: -1.5},
  {province: "British Columbia", value: -1.8}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, April 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-4, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([2.4], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 12,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 2.4, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "Nova Scotia",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in April, with sales of $17.0 billion. Food and beverage retailers recorded sales of $11.9 billion.

| Retail subsector | Sales (April 2023) |
|---|---:|
| Motor vehicle and parts dealers | $17.0B |
| Food and beverage retailers | $11.9B |
| General merchandise retailers | $8.3B |
| Gasoline stations and fuel vendors | $5.8B |
| Health and personal care retailers | $5.0B |
| Building material and garden equipment dealers | $3.6B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and geographic region. Data for the most recent months are preliminary and subject to revision.

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
current <- total_retail %>% filter(REF_DATE == "2023-04") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2023-03") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2022-04") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2023-04",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2023-04", "2022-04"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2023-04` - `2022-04`) / `2022-04` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** April 2023
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-april-2023", "en"));
```
