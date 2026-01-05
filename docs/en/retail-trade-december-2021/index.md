---
title: Retail sales down 1.8% in December, up 8.8% year over year
toc: false
---

# Retail sales down 1.8% in December, up 8.8% year over year

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales fell 1.8% in December 2021 to $61.3 billion
- Year over year, sales were up 8.8%, as 2021 ended strongly
- Manitoba led all provinces with exceptional 20.4% year-over-year growth
- Only the Northwest Territories and Nunavut posted year-over-year declines

</div>

Retail sales in Canada declined 1.8% in December 2021 to $61.3 billion, following strong gains in November. Despite the monthly decline, year-over-year growth remained robust at 8.8%, capping a strong year for retail.

Manitoba stood out with exceptional year-over-year growth of 20.4%, more than double the national average. Atlantic Canada also showed widespread strength, with all four provinces posting double-digit gains.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-01-01"), value: 55.15},
  {date: new Date("2021-02-01"), value: 58.78},
  {date: new Date("2021-03-01"), value: 61.77},
  {date: new Date("2021-04-01"), value: 58.40},
  {date: new Date("2021-05-01"), value: 56.95},
  {date: new Date("2021-06-01"), value: 59.65},
  {date: new Date("2021-07-01"), value: 60.15},
  {date: new Date("2021-08-01"), value: 61.11},
  {date: new Date("2021-09-01"), value: 60.84},
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33}
];

display(Plot.plot({
  title: "Retail sales, Canada, 2021 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [52, 65], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Manitoba leads exceptional provincial growth

Manitoba led all provinces with exceptional year-over-year growth of 20.4%, more than double the national average. This remarkable gain reflected the province's recovery from pandemic restrictions that affected December 2020.

Atlantic Canada showed widespread strength, with New Brunswick (+13.2%), Prince Edward Island (+13.0%), Nova Scotia (+12.9%), and Newfoundland and Labrador (+12.5%) all posting strong double-digit gains. Only the Northwest Territories (-0.9%) and Nunavut (-5.1%) recorded year-over-year declines.

```js
const provincialData = [
  {province: "Manitoba", value: 20.4},
  {province: "New Brunswick", value: 13.2},
  {province: "Prince Edward Island", value: 13.0},
  {province: "Nova Scotia", value: 12.9},
  {province: "Newfoundland and Labrador", value: 12.5},
  {province: "Saskatchewan", value: 12.4},
  {province: "Quebec", value: 11.0},
  {province: "Ontario", value: 10.4},
  {province: "Yukon", value: 4.9},
  {province: "Alberta", value: 3.5},
  {province: "British Columbia", value: 1.6},
  {province: "Northwest Territories", value: -0.9},
  {province: "Nunavut", value: -5.1}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, December 2021 (%)",
  width: 680,
  height: 380,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-8, 24]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([8.8], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 24,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 8.8, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "Manitoba",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in December, with sales of $15.3 billion. Food and beverage retailers recorded sales of $10.6 billion.

| Retail subsector | Sales (December 2021) |
|---|---:|
| Motor vehicle and parts dealers | $15.3B |
| Food and beverage retailers | $10.6B |
| General merchandise retailers | $7.6B |
| Gasoline stations and fuel vendors | $4.8B |
| Health and personal care retailers | $4.5B |
| Building material and garden equipment dealers | $2.9B |

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
current <- total_retail %>% filter(REF_DATE == "2021-12") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2021-11") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2020-12") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2021-12",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2021-12", "2020-12"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2021-12` - `2020-12`) / `2020-12` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** December 2021
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-december-2021", "en"));
```
