---
title: Retail sales rise 1.4% in June, the strongest monthly gain since April
toc: false
---

# Retail sales rise 1.4% in June, the strongest monthly gain since April

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales increased 1.4% in June 2025 to $70.1 billion, the strongest monthly gain since April
- Year over year, sales were up 6.4%, with British Columbia (+9.7%) leading provincial gains
- Motor vehicle and parts dealers remained the largest subsector at $19.2 billion
- Yukon was the only jurisdiction to record a year-over-year decline (-4.5%)

</div>

Retail sales in Canada increased 1.4% in June 2025 to $70.1 billion, recovering from the 1.4% decline recorded in May. This marked the strongest monthly gain since April. Year over year, sales were up 6.4% compared with June 2024.

The June increase was broad-based across retail subsectors. Motor vehicle and parts dealers led sales at $19.2 billion, while food and beverage retailers recorded $13.4 billion.

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
  {date: new Date("2025-05-01"), value: 69.16},
  {date: new Date("2025-06-01"), value: 70.14}
];

display(Plot.plot({
  title: "Retail sales, Canada, January 2024 to June 2025 ($ billions)",
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

## British Columbia leads year-over-year gains

British Columbia recorded the strongest year-over-year sales growth among provinces at 9.7%, with sales rising to $9.8 billion. Ontario (+6.9%) and Manitoba (+6.4%) also posted above-average gains.

Yukon was the only jurisdiction to record a year-over-year decline at -4.5%. All ten provinces saw higher sales compared with June 2024.

```js
const provincialData = [
  {province: "British Columbia", value: 9.7},
  {province: "Ontario", value: 6.9},
  {province: "Manitoba", value: 6.4},
  {province: "New Brunswick", value: 6.1},
  {province: "Prince Edward Island", value: 5.6},
  {province: "Alberta", value: 5.6},
  {province: "Quebec", value: 5.0},
  {province: "Newfoundland and Labrador", value: 4.6},
  {province: "Nova Scotia", value: 4.6},
  {province: "Saskatchewan", value: 4.1},
  {province: "Yukon", value: -4.5}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, June 2025 (%)",
  width: 680,
  height: 340,
  marginLeft: 170,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-6, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([6.4], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 6.4, label: "Canada average"}], {
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

Motor vehicle and parts dealers remained the largest retail subsector in June, with sales of $19.2 billion. Automobile dealers accounted for the majority at $16.8 billion.

Food and beverage retailers, the second-largest retail subsector, recorded sales of $13.4 billion. General merchandise retailers followed at $9.4 billion.

| Retail subsector | Sales (June 2025) |
|---|---:|
| Motor vehicle and parts dealers | $19.2 billion |
| Food and beverage retailers | $13.4 billion |
| General merchandise retailers | $9.4 billion |
| Gasoline stations and fuel vendors | $6.1 billion |
| Health and personal care retailers | $6.0 billion |
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
current <- total_retail %>% filter(REF_DATE == "2025-06") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2025-05") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2024-06") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-06",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2025-06", "2024-06"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2025-06` - `2024-06`) / `2024-06` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Retail Trade Survey
**Reference period:** June 2025
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-june-2025", "en"));
```
