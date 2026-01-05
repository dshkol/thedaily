---
title: Retail sales rise 0.8% in October as Newfoundland leads year-over-year gains
toc: false
---

# Retail sales rise 0.8% in October as Newfoundland leads year-over-year gains

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales increased 0.8% in October 2024 to $68.0 billion, the third consecutive monthly gain
- Year over year, sales were up 2.3%, with Newfoundland and Labrador (+8.9%) leading provincial gains
- Nine of eleven provinces and territories posted positive year-over-year growth
- Saskatchewan (-4.0%) recorded the largest decline, with Yukon also slightly negative (-0.1%)

</div>

Retail sales in Canada rose 0.8% in October 2024 to $68.0 billion, marking the third consecutive monthly gain. Year over year, sales were 2.3% higher than in October 2023.

The October increase built on gains of 0.4% in November and 0.8% in September. Nine of eleven provinces and territories recorded positive year-over-year growth.

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
  {date: new Date("2024-10-01"), value: 68.04}
];

display(Plot.plot({
  title: "Retail sales, Canada, January to October 2024 ($ billions)",
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

## Newfoundland and Labrador leads provincial gains

Newfoundland and Labrador led year-over-year growth at 8.9%, followed by Alberta at 4.8% and Nova Scotia at 3.2%. Manitoba posted gains of 3.0%.

Saskatchewan recorded the largest decline at -4.0%, an unusual result for the province. Yukon was the only other jurisdiction with a negative year-over-year change at -0.1%.

```js
const provincialData = [
  {province: "Newfoundland and Labrador", value: 8.9},
  {province: "Alberta", value: 4.8},
  {province: "Nova Scotia", value: 3.2},
  {province: "Manitoba", value: 3.0},
  {province: "British Columbia", value: 2.6},
  {province: "Quebec", value: 2.3},
  {province: "Ontario", value: 1.7},
  {province: "New Brunswick", value: 1.4},
  {province: "Prince Edward Island", value: 0.0},
  {province: "Yukon", value: -0.1},
  {province: "Saskatchewan", value: -4.0}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, October 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-6, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([2.3], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 2.3, label: "Canada average"}], {
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

## Motor vehicle dealers lead retail subsectors

Motor vehicle and parts dealers remained the largest retail subsector in October, with sales of $18.4 billion. Food and beverage retailers recorded sales of $13.0 billion.

| Retail subsector | Sales (October 2024) |
|---|---:|
| Motor vehicle and parts dealers | $18.4B |
| Food and beverage retailers | $13.0B |
| General merchandise retailers | $9.2B |
| Gasoline stations and fuel vendors | $5.9B |
| Health and personal care retailers | $5.7B |
| Building material and garden equipment dealers | $3.9B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and by geographic area. Data for the most recent months are preliminary and subject to revision.

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
current <- total_retail %>% filter(REF_DATE == "2024-10") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2024-09") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2023-10") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2024-10",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2024-10", "2023-10"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2024-10` - `2023-10`) / `2023-10` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** October 2024
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-october-2024", "en"));
```
