---
title: Retail sales down 0.4% in January, first year-over-year decline
toc: false
---

# Retail sales down 0.4% in January, first year-over-year decline

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales fell 0.4% in January 2024 to $66.1 billion, declining from December's holiday peak
- Year over year, sales were down 0.3%—the first year-over-year decline recorded in the series
- Five provinces posted year-over-year declines, with Alberta's 5.0% drop the steepest
- New Brunswick led all provinces with 10.3% year-over-year growth

</div>

Retail sales in Canada fell 0.4% in January 2024 to $66.1 billion, declining from December's holiday shopping peak. Year over year, sales were 0.3% lower than January 2023—marking the first year-over-year decline recorded in the retail trade series.

January 2024 saw a notable divergence between Atlantic and Western Canada. New Brunswick posted exceptional growth of 10.3%, leading all provinces, while Alberta (-5.0%) and British Columbia (-4.7%) recorded the steepest declines.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-02-01"), value: 65.67},
  {date: new Date("2023-03-01"), value: 65.35},
  {date: new Date("2023-04-01"), value: 65.63},
  {date: new Date("2023-05-01"), value: 65.66},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.89},
  {date: new Date("2023-08-01"), value: 65.93},
  {date: new Date("2023-09-01"), value: 66.58},
  {date: new Date("2023-10-01"), value: 66.51},
  {date: new Date("2023-11-01"), value: 66.56},
  {date: new Date("2023-12-01"), value: 66.32},
  {date: new Date("2024-01-01"), value: 66.08}
];

display(Plot.plot({
  title: "Retail sales, Canada, February 2023 to January 2024 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [64, 70], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## New Brunswick leads gains, Alberta lags

New Brunswick led all provinces with year-over-year growth of 10.3%, the only province to post double-digit gains in January. Prince Edward Island followed at 3.5%, with Nova Scotia at 3.4%.

Five provinces recorded year-over-year declines. Alberta's 5.0% drop was the steepest, followed by British Columbia at -4.7% and Saskatchewan at -3.4%. Newfoundland and Labrador (-2.8%) and Manitoba (-1.9%) rounded out the decliners.

```js
const provincialData = [
  {province: "New Brunswick", value: 10.3},
  {province: "Prince Edward Island", value: 3.5},
  {province: "Nova Scotia", value: 3.4},
  {province: "Yukon", value: 3.3},
  {province: "Ontario", value: 1.9},
  {province: "Quebec", value: 0.9},
  {province: "Manitoba", value: -1.9},
  {province: "Newfoundland and Labrador", value: -2.8},
  {province: "Saskatchewan", value: -3.4},
  {province: "British Columbia", value: -4.7},
  {province: "Alberta", value: -5.0}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, January 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-8, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([-0.3], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: -0.3, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "New Brunswick",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in January, with sales of $17.4 billion. Food and beverage retailers recorded sales of $12.2 billion.

| Retail subsector | Sales (January 2024) |
|---|---:|
| Motor vehicle and parts dealers | $17.4B |
| Food and beverage retailers | $12.2B |
| General merchandise retailers | $8.5B |
| Gasoline stations and fuel vendors | $5.6B |
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
current <- total_retail %>% filter(REF_DATE == "2024-01") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2023-12") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2023-01") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2024-01",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2024-01", "2023-01"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2024-01` - `2023-01`) / `2023-01` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** January 2024
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-january-2024", "en"));
```
