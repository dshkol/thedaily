---
title: Retail sales hit record $66.8 billion in June, all provinces post double-digit-worthy gains
toc: false
---

# Retail sales hit record $66.8 billion in June, all provinces post double-digit-worthy gains

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 1.5% in June 2022 to a record $66.8 billion
- Year over year, sales were up 12.0%, the strongest annual growth in recent months
- Yukon led all provinces with exceptional 20.9% year-over-year growth
- All provinces and territories recorded positive year-over-year gains, with seven exceeding 10%

</div>

Retail sales in Canada rose 1.5% in June 2022 to a record $66.8 billion, the highest level on record. Year-over-year growth was exceptionally strong at 12.0%, reflecting robust consumer spending.

June 2022 was remarkable for its universally strong regional performance. All provinces and territories posted positive year-over-year gains, with seven exceeding 10%. Yukon led with exceptional growth of 20.9%, while Ontario posted a strong 17.1%.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-07-01"), value: 60.15},
  {date: new Date("2021-08-01"), value: 61.11},
  {date: new Date("2021-09-01"), value: 60.84},
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82}
];

display(Plot.plot({
  title: "Retail sales, Canada, July 2021 to June 2022 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [58, 68], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Yukon leads exceptional provincial growth

Yukon led all provinces with exceptional year-over-year growth of 20.9%, followed by Ontario at 17.1% and Prince Edward Island at 15.6%. Seven provinces posted double-digit gains, demonstrating broad-based strength.

For the first time in recent memory, every province and territory recorded positive year-over-year growth, with even the lowest performer (British Columbia) posting a solid 6.1% gain.

```js
const provincialData = [
  {province: "Yukon", value: 20.9},
  {province: "Ontario", value: 17.1},
  {province: "Prince Edward Island", value: 15.6},
  {province: "Manitoba", value: 12.5},
  {province: "New Brunswick", value: 11.6},
  {province: "Quebec", value: 10.9},
  {province: "Saskatchewan", value: 10.4},
  {province: "Newfoundland and Labrador", value: 8.5},
  {province: "Alberta", value: 7.7},
  {province: "Nova Scotia", value: 7.3},
  {province: "Northwest Territories", value: 6.7},
  {province: "British Columbia", value: 6.1}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, June 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [0, 24]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([12.0], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 12.0, label: "Canada average"}], {
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

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in June, with sales of $17.0 billion. Food and beverage retailers recorded sales of $11.4 billion.

| Retail subsector | Sales (June 2022) |
|---|---:|
| Motor vehicle and parts dealers | $17.0B |
| Food and beverage retailers | $11.4B |
| General merchandise retailers | $8.0B |
| Gasoline stations and fuel vendors | $6.3B |
| Health and personal care retailers | $4.8B |
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
current <- total_retail %>% filter(REF_DATE == "2022-06") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2022-05") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2021-06") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2022-06",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2022-06", "2021-06"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2022-06` - `2021-06`) / `2021-06` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** June 2022
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-june-2022", "en"));
```
