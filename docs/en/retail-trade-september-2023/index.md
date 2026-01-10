---
title: Retail sales rise 1.0% in September, Yukon leads year-over-year gains
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales rise 1.0% in September, Yukon leads year-over-year gains

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 1.0% in September 2023 to $66.6 billion, rebounding from two months of modest declines
- Year over year, sales were up 2.7%, with Yukon leading provincial gains at 8.1%
- Ten of eleven provinces and territories posted positive year-over-year growth
- Newfoundland and Labrador was the only jurisdiction to decline, falling 0.6% year over year

</div>

Retail sales in Canada rose 1.0% in September 2023 to $66.6 billion, rebounding from the modest declines seen in July and August. Year over year, sales were 2.7% higher than September 2022.

September 2023 saw broad-based gains across most jurisdictions. Only Newfoundland and Labrador recorded a year-over-year decline, making this one of the strongest months for provincial performance in recent history.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-10-01"), value: 65.40},
  {date: new Date("2022-11-01"), value: 65.41},
  {date: new Date("2022-12-01"), value: 64.68},
  {date: new Date("2023-01-01"), value: 66.27},
  {date: new Date("2023-02-01"), value: 65.67},
  {date: new Date("2023-03-01"), value: 65.35},
  {date: new Date("2023-04-01"), value: 65.63},
  {date: new Date("2023-05-01"), value: 65.66},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.89},
  {date: new Date("2023-08-01"), value: 65.93},
  {date: new Date("2023-09-01"), value: 66.58}
];

display(Plot.plot({
  title: "Retail sales, Canada, October 2022 to September 2023 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [63, 70], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Yukon leads gains, Newfoundland the only decliner

Yukon led all provinces with year-over-year growth of 8.1%, continuing its strong performance. Quebec followed at 6.0%, with Nova Scotia and New Brunswick both exceeding 5%.

Newfoundland and Labrador was the only jurisdiction to record a year-over-year decline, falling 0.6%. All other provinces and territories posted positive growth.

```js
const provincialData = [
  {province: "Yukon", value: 8.1},
  {province: "Quebec", value: 6.0},
  {province: "Nova Scotia", value: 5.2},
  {province: "New Brunswick", value: 5.1},
  {province: "Prince Edward Island", value: 4.7},
  {province: "Alberta", value: 2.6},
  {province: "Manitoba", value: 2.1},
  {province: "Saskatchewan", value: 2.1},
  {province: "Ontario", value: 1.5},
  {province: "British Columbia", value: 0.5},
  {province: "Newfoundland and Labrador", value: -0.6}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, September 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-3, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([2.7], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 10,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 2.7, label: "Canada average"}], {
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

Motor vehicle and parts dealers remained the largest retail subsector in September, with sales of $17.4 billion. Food and beverage retailers recorded sales of $12.2 billion.

| Retail subsector | Sales (September 2023) |
|---|---:|
| Motor vehicle and parts dealers | $17.4B |
| Food and beverage retailers | $12.2B |
| General merchandise retailers | $8.5B |
| Gasoline stations and fuel vendors | $6.0B |
| Health and personal care retailers | $5.2B |
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
current <- total_retail %>% filter(REF_DATE == "2023-09") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2023-08") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2022-09") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2023-09",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2023-09", "2022-09"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2023-09` - `2022-09`) / `2022-09` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** September 2023
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-september-2023", "en"));
```
