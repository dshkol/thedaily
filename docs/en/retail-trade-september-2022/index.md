---
title: Retail sales dip 0.5% in September, Manitoba leads 6.6% annual growth
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales dip 0.5% in September, Manitoba leads 6.6% annual growth

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales fell 0.5% in September 2022 to $64.9 billion, a modest pullback after a strong summer
- Year over year, sales were up 6.6%, continuing robust annual growth
- Manitoba led all provinces with 10.4% year-over-year growth
- Only Nova Scotia recorded a year-over-year decline (-0.2%)

</div>

Retail sales in Canada fell 0.5% in September 2022 to $64.9 billion, a modest pullback after elevated summer spending. Despite the monthly decline, year-over-year growth remained robust at 6.6%.

The Prairie provinces led regional performance, with Manitoba, Saskatchewan, and Alberta all posting strong annual gains. Only Nova Scotia recorded a year-over-year decline, and by just 0.2%.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.89},
  {date: new Date("2022-08-01"), value: 65.16},
  {date: new Date("2022-09-01"), value: 64.85}
];

display(Plot.plot({
  title: "Retail sales, Canada, October 2021 to September 2022 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [60, 68], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Prairie provinces lead growth

Manitoba led all provinces with year-over-year growth of 10.4%, followed by Saskatchewan at 8.9% and New Brunswick at 8.8%. Ontario and Alberta also posted strong gains above 7%.

Nearly all provinces recorded positive year-over-year growth. Only Nova Scotia posted a decline, and by a marginal 0.2%.

```js
const provincialData = [
  {province: "Manitoba", value: 10.4},
  {province: "Saskatchewan", value: 8.9},
  {province: "New Brunswick", value: 8.8},
  {province: "Ontario", value: 8.3},
  {province: "Alberta", value: 7.5},
  {province: "Northwest Territories", value: 7.5},
  {province: "Newfoundland and Labrador", value: 7.0},
  {province: "Prince Edward Island", value: 5.7},
  {province: "Yukon", value: 5.6},
  {province: "Quebec", value: 5.1},
  {province: "British Columbia", value: 3.0},
  {province: "Nova Scotia", value: -0.2}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, September 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-2, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([6.6], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 12,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 6.6, label: "Canada average"}], {
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

Motor vehicle and parts dealers remained the largest retail subsector in September, with sales of $16.6 billion. Food and beverage retailers recorded sales of $11.5 billion.

| Retail subsector | Sales (September 2022) |
|---|---:|
| Motor vehicle and parts dealers | $16.6B |
| Food and beverage retailers | $11.5B |
| General merchandise retailers | $7.9B |
| Gasoline stations and fuel vendors | $5.9B |
| Health and personal care retailers | $4.8B |
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
current <- total_retail %>% filter(REF_DATE == "2022-09") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2022-08") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2021-09") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2022-09",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2022-09", "2021-09"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2022-09` - `2021-09`) / `2021-09` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** September 2022
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-september-2022", "en"));
```
