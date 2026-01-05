---
title: Retail sales down 0.9% in February but up 3.6% year over year
toc: false
---

# Retail sales down 0.9% in February but up 3.6% year over year

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales declined 0.9% in February 2023 to $65.7 billion, pulling back from January
- Year over year, sales were up 3.6%, a strong pace of annual growth
- Prince Edward Island and New Brunswick both posted exceptional year-over-year gains above 11%
- Only two provinces declined year over year: Saskatchewan and British Columbia

</div>

Retail sales in Canada declined 0.9% in February 2023 to $65.7 billion, pulling back from January's strong level. Despite the monthly decline, year over year sales were up 3.6% compared with February 2022—a robust annual growth rate.

February 2023 showed exceptionally strong regional performance across Atlantic Canada, with Prince Edward Island and New Brunswick both posting double-digit gains. Only Saskatchewan and British Columbia saw year-over-year declines.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.90},
  {date: new Date("2022-08-01"), value: 65.16},
  {date: new Date("2022-09-01"), value: 64.85},
  {date: new Date("2022-10-01"), value: 65.40},
  {date: new Date("2022-11-01"), value: 65.41},
  {date: new Date("2022-12-01"), value: 64.68},
  {date: new Date("2023-01-01"), value: 66.27},
  {date: new Date("2023-02-01"), value: 65.67}
];

display(Plot.plot({
  title: "Retail sales, Canada, March 2022 to February 2023 ($ billions)",
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

## Atlantic Canada posts exceptional gains

Prince Edward Island led all provinces with exceptional year-over-year growth of 12.1%, followed by New Brunswick at 11.2%. Alberta also posted strong double-digit growth at 10.0%.

Only two provinces recorded year-over-year declines. Saskatchewan fell 0.8% and British Columbia dropped 1.9%, the only regions underperforming.

```js
const provincialData = [
  {province: "Prince Edward Island", value: 12.1},
  {province: "New Brunswick", value: 11.2},
  {province: "Alberta", value: 10.0},
  {province: "Newfoundland and Labrador", value: 7.0},
  {province: "Yukon", value: 7.0},
  {province: "Quebec", value: 5.2},
  {province: "Nova Scotia", value: 3.7},
  {province: "Manitoba", value: 3.2},
  {province: "Ontario", value: 2.2},
  {province: "Saskatchewan", value: -0.8},
  {province: "British Columbia", value: -1.9}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, February 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-4, 15]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([3.6], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 15,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 3.6, label: "Canada average"}], {
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

Motor vehicle and parts dealers remained the largest retail subsector in February, with sales of $16.9 billion. Food and beverage retailers recorded sales of $11.8 billion.

| Retail subsector | Sales (February 2023) |
|---|---:|
| Motor vehicle and parts dealers | $16.9B |
| Food and beverage retailers | $11.8B |
| General merchandise retailers | $8.2B |
| Gasoline stations and fuel vendors | $6.0B |
| Health and personal care retailers | $5.0B |
| Building material and garden equipment dealers | $3.4B |

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
current <- total_retail %>% filter(REF_DATE == "2023-02") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2023-01") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2022-02") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2023-02",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2023-02", "2022-02"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2023-02` - `2022-02`) / `2022-02` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** February 2023
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-february-2023", "en"));
```
