---
title: Retail sales rise 0.8% in February to $63.4 billion, up 7.9% year over year
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales rise 0.8% in February to $63.4 billion, up 7.9% year over year

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 0.8% in February 2022 to $63.4 billion
- Year over year, sales were up 7.9%, continuing the recovery trend
- Ontario led all provinces with 12.4% year-over-year growth
- Only the Northwest Territories posted a year-over-year decline

</div>

Retail sales in Canada rose 0.8% in February 2022 to $63.4 billion. Year-over-year growth remained solid at 7.9%, reflecting continued consumer spending momentum compared to February 2021, when pandemic restrictions affected several provinces.

Ontario continued to lead provincial performance with a 12.4% year-over-year gain, followed by Saskatchewan at 10.9%. These two provinces were the only ones to post double-digit growth, though most provinces recorded positive year-over-year gains.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-03-01"), value: 61.77},
  {date: new Date("2021-04-01"), value: 58.40},
  {date: new Date("2021-05-01"), value: 56.95},
  {date: new Date("2021-06-01"), value: 59.65},
  {date: new Date("2021-07-01"), value: 60.15},
  {date: new Date("2021-08-01"), value: 61.11},
  {date: new Date("2021-09-01"), value: 60.84},
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40}
];

display(Plot.plot({
  title: "Retail sales, Canada, March 2021 to February 2022 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [54, 66], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Ontario and Saskatchewan lead provincial growth

Ontario led all provinces with year-over-year growth of 12.4%, followed by Saskatchewan at 10.9%. These were the only provinces to post double-digit gains. Newfoundland and Labrador (+9.6%) rounded out the top three.

All provinces and territories except the Northwest Territories recorded positive year-over-year growth, with the territories declining 7.8%.

```js
const provincialData = [
  {province: "Ontario", value: 12.4},
  {province: "Saskatchewan", value: 10.9},
  {province: "Newfoundland and Labrador", value: 9.6},
  {province: "Quebec", value: 8.0},
  {province: "New Brunswick", value: 8.0},
  {province: "Nova Scotia", value: 7.4},
  {province: "Manitoba", value: 3.4},
  {province: "Alberta", value: 2.8},
  {province: "Nunavut", value: 2.5},
  {province: "Yukon", value: 2.1},
  {province: "British Columbia", value: 1.8},
  {province: "Prince Edward Island", value: 1.7},
  {province: "Northwest Territories", value: -7.8}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, February 2022 (%)",
  width: 680,
  height: 380,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-10, 14]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([7.9], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 7.9, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "Ontario",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in February, with sales of $15.9 billion. Food and beverage retailers recorded sales of $10.9 billion.

| Retail subsector | Sales (February 2022) |
|---|---:|
| Motor vehicle and parts dealers | $15.9B |
| Food and beverage retailers | $10.9B |
| General merchandise retailers | $7.6B |
| Gasoline stations and fuel vendors | $5.3B |
| Health and personal care retailers | $4.6B |
| Building material and garden equipment dealers | $3.1B |

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
current <- total_retail %>% filter(REF_DATE == "2022-02") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2022-01") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2021-02") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2022-02",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2022-02", "2021-02"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2022-02` - `2021-02`) / `2021-02` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** February 2022
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-february-2022", "en"));
```
