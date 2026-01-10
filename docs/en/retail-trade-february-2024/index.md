---
title: Retail sales edge up 0.2% in February, Alberta posts steepest decline
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales edge up 0.2% in February, Alberta posts steepest decline

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales edged up 0.2% in February 2024 to $66.2 billion, rebounding from January's decline
- Year over year, sales were up 0.9%, with Yukon leading provincial gains at 7.9%
- Three provinces posted year-over-year declines: New Brunswick, Prince Edward Island, and Alberta
- Alberta recorded the steepest decline at -2.9%, the only province with a drop exceeding 2 percentage points

</div>

Retail sales in Canada edged up 0.2% in February 2024 to $66.2 billion, a modest rebound from January's decline. Year over year, sales were 0.9% higher than February 2023.

February 2024 saw Alberta emerge as a notable laggard, posting the steepest year-over-year decline at -2.9%—significantly below the national average. Meanwhile, Yukon continued its strong performance, leading all provinces with a 7.9% gain.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-03-01"), value: 65.39},
  {date: new Date("2023-04-01"), value: 65.60},
  {date: new Date("2023-05-01"), value: 65.70},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.90},
  {date: new Date("2023-08-01"), value: 65.90},
  {date: new Date("2023-09-01"), value: 66.60},
  {date: new Date("2023-10-01"), value: 66.50},
  {date: new Date("2023-11-01"), value: 66.60},
  {date: new Date("2023-12-01"), value: 66.30},
  {date: new Date("2024-01-01"), value: 66.10},
  {date: new Date("2024-02-01"), value: 66.24}
];

display(Plot.plot({
  title: "Retail sales, Canada, March 2023 to February 2024 ($ billions)",
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

## Yukon leads gains, Alberta lags

Yukon led all provinces with year-over-year growth of 7.9%, continuing its streak of strong performance. Newfoundland and Labrador followed at 4.7%, with Saskatchewan at 3.6%.

Three provinces recorded year-over-year declines. Alberta's 2.9% drop was the steepest, followed by Prince Edward Island at -1.4% and New Brunswick at -1.2%. These were the only provinces posting negative year-over-year growth.

```js
const provincialData = [
  {province: "Yukon", value: 7.9},
  {province: "Newfoundland and Labrador", value: 4.7},
  {province: "Saskatchewan", value: 3.6},
  {province: "Nova Scotia", value: 3.3},
  {province: "British Columbia", value: 3.1},
  {province: "Ontario", value: 1.3},
  {province: "Manitoba", value: 0.6},
  {province: "Quebec", value: 0.3},
  {province: "New Brunswick", value: -1.2},
  {province: "Prince Edward Island", value: -1.4},
  {province: "Alberta", value: -2.9}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, February 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-6, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([0.9], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 10,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 0.9, label: "Canada average"}], {
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

Motor vehicle and parts dealers remained the largest retail subsector in February, with sales of $17.5 billion. Food and beverage retailers recorded sales of $12.3 billion.

| Retail subsector | Sales (February 2024) |
|---|---:|
| Motor vehicle and parts dealers | $17.5B |
| Food and beverage retailers | $12.3B |
| General merchandise retailers | $8.6B |
| Gasoline stations and fuel vendors | $5.7B |
| Health and personal care retailers | $5.2B |
| Building material and garden equipment dealers | $3.7B |

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
current <- total_retail %>% filter(REF_DATE == "2024-02") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2024-01") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2023-02") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2024-02",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2024-02", "2023-02"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2024-02` - `2023-02`) / `2023-02` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** February 2024
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-february-2024", "en"));
```
