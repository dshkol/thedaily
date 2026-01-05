---
title: Retail sales decline 1.2% in May while all provinces post year-over-year gains
toc: false
---

# Retail sales decline 1.2% in May while all provinces post year-over-year gains

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales declined 1.2% in May 2025 to $69.2 billion, following a 0.3% increase in April
- Year over year, sales were up 4.8%, with British Columbia (+7.7%) leading provincial gains
- All eleven provinces and territories recorded year-over-year growth
- Motor vehicle and parts dealers remained the largest subsector at $19.3 billion

</div>

Retail sales in Canada declined 1.2% in May 2025 to $69.2 billion, partially reversing the 0.3% gain recorded in April. Despite the monthly decline, sales remained 4.8% higher than in May 2024.

The May decline was widespread, though all provinces and territories continued to post positive year-over-year growth. Motor vehicle and parts dealers remained the largest retail subsector at $19.3 billion.

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
  {date: new Date("2025-03-01"), value: 69.80},
  {date: new Date("2025-04-01"), value: 70.02},
  {date: new Date("2025-05-01"), value: 69.16}
];

display(Plot.plot({
  title: "Retail sales, Canada, January 2024 to May 2025 ($ billions)",
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

## All provinces post year-over-year gains

British Columbia led year-over-year sales growth at 7.7%, with sales rising to $9.6 billion. Manitoba (+5.5%) and Saskatchewan (+5.5%) also posted strong gains.

Notably, all eleven provinces and territories recorded positive year-over-year growth in May. Yukon posted the smallest gain at 1.3%.

```js
const provincialData = [
  {province: "British Columbia", value: 7.7},
  {province: "Manitoba", value: 5.5},
  {province: "Saskatchewan", value: 5.5},
  {province: "Alberta", value: 4.9},
  {province: "Newfoundland and Labrador", value: 4.9},
  {province: "Quebec", value: 4.6},
  {province: "Prince Edward Island", value: 4.2},
  {province: "Ontario", value: 3.9},
  {province: "Nova Scotia", value: 3.9},
  {province: "New Brunswick", value: 3.7},
  {province: "Yukon", value: 1.3}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, May 2025 (%)",
  width: 680,
  height: 340,
  marginLeft: 170,
  x: {grid: true, label: "Year-over-year change (%)", domain: [0, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([4.8], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: "value",
      y: "province",
      text: d => "+" + d.value.toFixed(1) + "%",
      dx: 4,
      textAnchor: "start",
      fontSize: 10
    }),
    Plot.text([{x: 4.8, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "British Columbia",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers remain the largest subsector

Motor vehicle and parts dealers led retail sales in May, with sales of $19.3 billion. Automobile dealers accounted for the majority at $16.9 billion.

Food and beverage retailers recorded sales of $13.4 billion, while general merchandise retailers followed at $9.5 billion.

| Retail subsector | Sales (May 2025) |
|---|---:|
| Motor vehicle and parts dealers | $19.3 billion |
| Food and beverage retailers | $13.4 billion |
| General merchandise retailers | $9.5 billion |
| Gasoline stations and fuel vendors | $6.2 billion |
| Health and personal care retailers | $5.9 billion |
| Building material and garden equipment dealers | $4.1 billion |

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
current <- total_retail %>% filter(REF_DATE == "2025-05") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2025-04") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2024-05") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-05",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2025-05", "2024-05"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2025-05` - `2024-05`) / `2024-05` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Retail Trade Survey
**Reference period:** May 2025
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-may-2025", "en"));
```
