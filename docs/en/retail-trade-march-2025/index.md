---
title: Retail sales increase 0.9% in March as Newfoundland leads year-over-year growth
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales increase 0.9% in March as Newfoundland leads year-over-year growth

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales increased 0.9% in March 2025 to $69.8 billion, following a 0.9% decline in February
- Year over year, sales were up 5.5%, with Newfoundland and Labrador (+10.3%) leading provincial gains
- Ten of eleven jurisdictions recorded positive year-over-year growth
- Yukon was the only jurisdiction to post a year-over-year decline (-2.4%)

</div>

Retail sales in Canada increased 0.9% in March 2025 to $69.8 billion, reversing the 0.9% decline recorded in February. Year over year, sales were up 5.5% compared with March 2024.

The March increase ended a one-month decline. Ten of eleven provinces and territories recorded positive year-over-year growth, with Newfoundland and Labrador leading gains at 10.3%.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2024-01-01"), value: 66.08},
  {date: new Date("2024-02-01"), value: 66.24},
  {date: new Date("2024-03-01"), value: 66.16},
  {date: new Date("2024-04-01"), value: 66.78},
  {date: new Date("2024-05-01"), value: 65.96},
  {date: new Date("2024-06-01"), value: 65.89},
  {date: new Date("2024-07-01"), value: 66.89},
  {date: new Date("2024-08-01"), value: 67.10},
  {date: new Date("2024-09-01"), value: 67.51},
  {date: new Date("2024-10-01"), value: 68.04},
  {date: new Date("2024-11-01"), value: 68.30},
  {date: new Date("2024-12-01"), value: 70.03},
  {date: new Date("2025-01-01"), value: 69.65},
  {date: new Date("2025-02-01"), value: 69.19},
  {date: new Date("2025-03-01"), value: 69.80}
];

display(Plot.plot({
  title: "Retail sales, Canada, January 2024 to March 2025 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [64, 72], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Newfoundland leads year-over-year gains

Newfoundland and Labrador led year-over-year sales growth at 10.3%, followed by Saskatchewan at 7.7%. New Brunswick posted the third-highest gain at 7.2%.

Yukon was the only jurisdiction to record a year-over-year decline at -2.4%. Prince Edward Island posted the smallest gain among provinces at 2.0%.

```js
const provincialData = [
  {province: "Newfoundland and Labrador", value: 10.3},
  {province: "Saskatchewan", value: 7.7},
  {province: "New Brunswick", value: 7.2},
  {province: "Alberta", value: 7.1},
  {province: "Manitoba", value: 6.7},
  {province: "British Columbia", value: 5.6},
  {province: "Nova Scotia", value: 5.2},
  {province: "Ontario", value: 5.0},
  {province: "Quebec", value: 4.5},
  {province: "Prince Edward Island", value: 2.0},
  {province: "Yukon", value: -2.4}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, March 2025 (%)",
  width: 680,
  height: 340,
  marginLeft: 170,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-5, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([5.5], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 5.5, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "Newfoundland and Labrador",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead retail sales

Motor vehicle and parts dealers remained the largest retail subsector in March, with sales of $19.2 billion. Food and beverage retailers recorded sales of $13.2 billion.

| Retail subsector | Sales (March 2025) |
|---|---:|
| Motor vehicle and parts dealers | $19.2 billion |
| Food and beverage retailers | $13.2 billion |
| General merchandise retailers | $9.4 billion |
| Gasoline stations and fuel vendors | $6.2 billion |
| Health and personal care retailers | $5.8 billion |
| Building material and garden equipment dealers | $4.2 billion |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Retail Trade Survey provides monthly estimates of sales by retail store type and geography. Data for the most recent months are preliminary and subject to revision.

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
current <- total_retail %>% filter(REF_DATE == "2025-03") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2025-02") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2024-03") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-03",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2025-03", "2024-03"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2025-03` - `2024-03`) / `2024-03` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Retail Trade Survey
**Reference period:** March 2025
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-march-2025", "en"));
```
