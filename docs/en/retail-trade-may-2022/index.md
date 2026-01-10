---
title: Retail sales surge 15.6% year over year in May, Ontario posts exceptional 27.8% gain
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales surge 15.6% year over year in May, Ontario posts exceptional 27.8% gain

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 2.7% in May 2022 to $65.8 billion
- Year over year, sales were up 15.6%, reflecting continued reopening momentum
- Ontario led all provinces with exceptional 27.8% year-over-year growth
- All provinces and territories except Nunavut recorded positive year-over-year gains

</div>

Retail sales in Canada rose 2.7% in May 2022 to $65.8 billion. Year-over-year growth was exceptionally strong at 15.6%, reflecting continued post-pandemic reopening momentum and pent-up consumer demand.

May 2022 was notable for the divergence in provincial performance. Ontario posted a remarkable 27.8% year-over-year gain, far outpacing all other provinces. Nova Scotia followed with a strong 23.3% increase. All provinces and territories except Nunavut recorded positive growth compared to May 2021.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-06-01"), value: 59.65},
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
  {date: new Date("2022-05-01"), value: 65.84}
];

display(Plot.plot({
  title: "Retail sales, Canada, June 2021 to May 2022 ($ billions)",
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

## Ontario leads exceptional provincial growth

Ontario led all provinces with exceptional year-over-year growth of 27.8%, nearly double the national average. This reflects the province's prolonged pandemic restrictions through early 2022, which depressed the May 2021 comparison base. Nova Scotia followed with a strong 23.3% gain.

All provinces and territories except Nunavut recorded positive year-over-year growth, with seven exceeding 10%.

```js
const provincialData = [
  {province: "Ontario", value: 27.8},
  {province: "Nova Scotia", value: 23.3},
  {province: "Prince Edward Island", value: 13.1},
  {province: "Manitoba", value: 11.4},
  {province: "Alberta", value: 10.9},
  {province: "Quebec", value: 10.9},
  {province: "New Brunswick", value: 10.7},
  {province: "Northwest Territories", value: 7.5},
  {province: "Newfoundland and Labrador", value: 6.8},
  {province: "Yukon", value: 6.3},
  {province: "Saskatchewan", value: 5.0},
  {province: "British Columbia", value: 3.0},
  {province: "Nunavut", value: -1.3}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, May 2022 (%)",
  width: 680,
  height: 380,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-4, 30]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([15.6], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 30,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 15.6, label: "Canada average"}], {
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

Motor vehicle and parts dealers remained the largest retail subsector in May, with sales of $16.5 billion. Food and beverage retailers recorded sales of $11.2 billion.

| Retail subsector | Sales (May 2022) |
|---|---:|
| Motor vehicle and parts dealers | $16.5B |
| Food and beverage retailers | $11.2B |
| General merchandise retailers | $7.9B |
| Gasoline stations and fuel vendors | $6.1B |
| Health and personal care retailers | $4.7B |
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
current <- total_retail %>% filter(REF_DATE == "2022-05") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2022-04") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2021-05") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2022-05",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2022-05", "2021-05"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2022-05` - `2021-05`) / `2021-05` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** May 2022
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-may-2022", "en"));
```
