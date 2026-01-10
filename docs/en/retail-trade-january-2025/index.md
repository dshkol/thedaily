---
title: Retail sales decline 0.5% in January as Newfoundland leads year-over-year gains
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales decline 0.5% in January as Newfoundland leads year-over-year gains

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales declined 0.5% in January 2025 to $69.7 billion, following the December holiday peak
- Year over year, sales were up 5.4%, with Newfoundland and Labrador (+12.8%) leading provincial gains
- All eleven provinces and territories recorded positive year-over-year growth
- Prince Edward Island posted the smallest gain at 0.5%

</div>

Retail sales in Canada declined 0.5% in January 2025 to $69.7 billion, retreating from the December holiday peak of $70.0 billion. Year over year, sales were up 5.4% compared with January 2024.

The January decline was a typical post-holiday adjustment following strong December sales. All eleven provinces and territories recorded positive year-over-year growth, led by Newfoundland and Labrador at 12.8%.

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
  {date: new Date("2025-01-01"), value: 69.65}
];

display(Plot.plot({
  title: "Retail sales, Canada, January 2024 to January 2025 ($ billions)",
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

Newfoundland and Labrador led year-over-year sales growth at 12.8%, the highest provincial growth rate. British Columbia followed at 9.9%, with Saskatchewan and Alberta both posting gains above 7%.

All provinces recorded positive year-over-year growth in January 2025, with Prince Edward Island posting the smallest gain at 0.5%.

```js
const provincialData = [
  {province: "Newfoundland and Labrador", value: 12.8},
  {province: "British Columbia", value: 9.9},
  {province: "Saskatchewan", value: 7.3},
  {province: "Alberta", value: 7.3},
  {province: "Manitoba", value: 5.0},
  {province: "Quebec", value: 4.3},
  {province: "Nova Scotia", value: 4.2},
  {province: "Ontario", value: 3.7},
  {province: "New Brunswick", value: 3.2},
  {province: "Yukon", value: 2.8},
  {province: "Prince Edward Island", value: 0.5}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, January 2025 (%)",
  width: 680,
  height: 340,
  marginLeft: 170,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-2, 15]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([5.4], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 15,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 5.4, label: "Canada average"}], {
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

Motor vehicle and parts dealers remained the largest retail subsector in January, with sales of $18.7 billion. Food and beverage retailers recorded sales of $12.9 billion.

| Retail subsector | Sales (January 2025) |
|---|---:|
| Motor vehicle and parts dealers | $18.7 billion |
| Food and beverage retailers | $12.9 billion |
| General merchandise retailers | $9.1 billion |
| Gasoline stations and fuel vendors | $5.9 billion |
| Health and personal care retailers | $5.6 billion |
| Building material and garden equipment dealers | $3.9 billion |

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
current <- total_retail %>% filter(REF_DATE == "2025-01") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2024-12") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2024-01") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-01",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2025-01", "2024-01"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2025-01` - `2024-01`) / `2024-01` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Retail Trade Survey
**Reference period:** January 2025
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-january-2025", "en"));
```
