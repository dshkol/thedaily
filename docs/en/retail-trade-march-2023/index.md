---
title: Retail sales down 0.5% in March, Prince Edward Island leads provinces at 5.8%
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales down 0.5% in March, Prince Edward Island leads provinces at 5.8%

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales declined 0.5% in March 2023 to $65.3 billion, pulling back from February
- Year over year, sales were up 1.9%, maintaining positive annual growth
- Prince Edward Island led provincial gains at 5.8%, followed by Alberta at 5.6%
- Only two provinces declined year over year: New Brunswick and Ontario

</div>

Retail sales in Canada declined 0.5% in March 2023 to $65.3 billion, pulling back from February's level. Despite the monthly decline, year over year sales were up 1.9% compared with March 2022.

March 2023 showed broad strength across most provinces, with only New Brunswick and Ontario posting year-over-year declines. Atlantic Canada's Prince Edward Island led all provinces, while Quebec and Alberta also posted solid gains above 5%.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
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
  {date: new Date("2023-02-01"), value: 65.67},
  {date: new Date("2023-03-01"), value: 65.35}
];

display(Plot.plot({
  title: "Retail sales, Canada, April 2022 to March 2023 ($ billions)",
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

## Prince Edward Island posts strongest gains

Prince Edward Island led all provinces with 5.8% year-over-year growth. Alberta followed at 5.6%, with Quebec at 5.4%. Manitoba posted gains of 2.3%, while Nova Scotia and Yukon each grew around 2%.

Only two provinces recorded year-over-year declines. New Brunswick fell 0.4% and Ontario dropped 1.0%, the only significant drag on national performance.

```js
const provincialData = [
  {province: "Prince Edward Island", value: 5.8},
  {province: "Alberta", value: 5.6},
  {province: "Quebec", value: 5.4},
  {province: "Manitoba", value: 2.3},
  {province: "Nova Scotia", value: 2.0},
  {province: "Yukon", value: 1.9},
  {province: "British Columbia", value: 1.6},
  {province: "Saskatchewan", value: 1.5},
  {province: "Newfoundland and Labrador", value: 0.8},
  {province: "New Brunswick", value: -0.4},
  {province: "Ontario", value: -1.0}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, March 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-3, 8]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.9], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 8,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.9, label: "Canada average"}], {
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

Motor vehicle and parts dealers remained the largest retail subsector in March, with sales of $16.8 billion. Food and beverage retailers recorded sales of $11.9 billion.

| Retail subsector | Sales (March 2023) |
|---|---:|
| Motor vehicle and parts dealers | $16.8B |
| Food and beverage retailers | $11.9B |
| General merchandise retailers | $8.3B |
| Gasoline stations and fuel vendors | $5.9B |
| Health and personal care retailers | $5.0B |
| Building material and garden equipment dealers | $3.5B |

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
current <- total_retail %>% filter(REF_DATE == "2023-03") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2023-02") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2022-03") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2023-03",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2023-03", "2022-03"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2023-03` - `2022-03`) / `2022-03` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** March 2023
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-march-2023", "en"));
```
