---
title: Retail sales decline 0.7% in February as Manitoba leads year-over-year gains
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales decline 0.7% in February as Manitoba leads year-over-year gains

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales declined 0.7% in February 2025 to $69.2 billion, following a 0.5% decline in January
- Year over year, sales were up 4.4%, with Manitoba (+9.0%) leading provincial gains
- Ten of eleven jurisdictions recorded positive year-over-year growth
- Yukon was the only jurisdiction to post a year-over-year decline (-2.1%)

</div>

Retail sales in Canada declined 0.7% in February 2025 to $69.2 billion, extending the decline from January. Year over year, sales were up 4.4% compared with February 2024.

The February decline marked the second consecutive monthly decrease. Ten of eleven provinces and territories recorded positive year-over-year growth, with Manitoba leading gains at 9.0%.

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
  {date: new Date("2025-02-01"), value: 69.19}
];

display(Plot.plot({
  title: "Retail sales, Canada, January 2024 to February 2025 ($ billions)",
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

## Manitoba leads year-over-year gains

Manitoba led year-over-year sales growth at 9.0%, followed by Newfoundland and Labrador at 8.3%. Alberta posted the third-highest gain at 6.8%.

Yukon was the only jurisdiction to record a year-over-year decline at -2.1%. Nova Scotia posted the smallest gain among provinces at 1.3%.

```js
const provincialData = [
  {province: "Manitoba", value: 9.0},
  {province: "Newfoundland and Labrador", value: 8.3},
  {province: "Alberta", value: 6.8},
  {province: "Saskatchewan", value: 6.1},
  {province: "New Brunswick", value: 5.4},
  {province: "British Columbia", value: 4.5},
  {province: "Ontario", value: 4.1},
  {province: "Quebec", value: 2.9},
  {province: "Prince Edward Island", value: 2.6},
  {province: "Nova Scotia", value: 1.3},
  {province: "Yukon", value: -2.1}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, February 2025 (%)",
  width: 680,
  height: 340,
  marginLeft: 170,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-4, 11]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([4.4], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 11,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 4.4, label: "Canada average"}], {
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

## Motor vehicle dealers lead retail sales

Motor vehicle and parts dealers remained the largest retail subsector in February, with sales of $18.9 billion. Food and beverage retailers recorded sales of $13.1 billion.

| Retail subsector | Sales (February 2025) |
|---|---:|
| Motor vehicle and parts dealers | $18.9 billion |
| Food and beverage retailers | $13.1 billion |
| General merchandise retailers | $9.3 billion |
| Gasoline stations and fuel vendors | $6.1 billion |
| Health and personal care retailers | $5.7 billion |
| Building material and garden equipment dealers | $4.0 billion |

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
current <- total_retail %>% filter(REF_DATE == "2025-02") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2025-01") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2024-02") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-02",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2025-02", "2024-02"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2025-02` - `2024-02`) / `2024-02` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Retail Trade Survey
**Reference period:** February 2025
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-february-2025", "en"));
```
