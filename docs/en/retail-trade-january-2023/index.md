---
title: Retail sales surge 2.5% in January, all provinces post year-over-year gains
toc: false
---

# Retail sales surge 2.5% in January, all provinces post year-over-year gains

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 2.5% in January 2023 to $66.3 billion, a strong start to the year
- Year over year, sales were up 5.4%, the strongest annual growth rate in recent months
- Alberta led all provinces with exceptional 14.9% year-over-year growth
- All provinces recorded positive year-over-year gains—the first such universal performance

</div>

Retail sales in Canada rose 2.5% in January 2023 to $66.3 billion, marking a strong start to the year. Year over year, sales were up 5.4% compared with January 2022—a robust pace of annual growth.

January 2023 was remarkable for its universally positive regional performance, with every province posting year-over-year gains. Alberta led with exceptional double-digit growth, while prairie provinces broadly outperformed.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-02-01"), value: 63.40},
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
  {date: new Date("2023-01-01"), value: 66.27}
];

display(Plot.plot({
  title: "Retail sales, Canada, February 2022 to January 2023 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [62, 68], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## All provinces record gains, Alberta leads

Alberta led all provinces with exceptional year-over-year growth of 14.9%, far ahead of any other province. Nova Scotia followed at 12.6%, with Manitoba at 11.0% and Prince Edward Island at 9.4%.

For the first time in recent memory, every province recorded positive year-over-year growth. Even the lowest performer, Ontario, still posted gains of 2.6%.

```js
const provincialData = [
  {province: "Alberta", value: 14.9},
  {province: "Nova Scotia", value: 12.6},
  {province: "Manitoba", value: 11.0},
  {province: "Prince Edward Island", value: 9.4},
  {province: "Yukon", value: 8.4},
  {province: "Saskatchewan", value: 8.1},
  {province: "Newfoundland and Labrador", value: 6.9},
  {province: "New Brunswick", value: 4.2},
  {province: "Quebec", value: 4.2},
  {province: "British Columbia", value: 3.2},
  {province: "Ontario", value: 2.6}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, January 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [0, 18]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([5.4], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: "value",
      y: "province",
      text: d => "+" + d.value.toFixed(1) + "%",
      dx: 4,
      textAnchor: "start",
      fontSize: 10
    }),
    Plot.text([{x: 5.4, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "Alberta",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in January, with sales of $17.2 billion. Food and beverage retailers recorded sales of $11.8 billion.

| Retail subsector | Sales (January 2023) |
|---|---:|
| Motor vehicle and parts dealers | $17.2B |
| Food and beverage retailers | $11.8B |
| General merchandise retailers | $8.3B |
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
current <- total_retail %>% filter(REF_DATE == "2023-01") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2022-12") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2022-01") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2023-01",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2023-01", "2022-01"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2023-01` - `2022-01`) / `2022-01` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** January 2023
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-january-2023", "en"));
```
