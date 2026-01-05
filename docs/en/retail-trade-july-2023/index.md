---
title: Retail sales edge down 0.2% in July, Yukon continues exceptional growth at 15.2%
toc: false
---

# Retail sales edge down 0.2% in July, Yukon continues exceptional growth at 15.2%

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales edged down 0.2% in July 2023 to $65.9 billion, a slight pullback from June
- Year over year, sales were up 1.5%, with Yukon continuing its exceptional growth at 15.2%
- Four provinces recorded year-over-year declines: Saskatchewan, Alberta, Manitoba, and Nova Scotia
- New Brunswick and Quebec also posted strong gains above the national average

</div>

Retail sales in Canada edged down 0.2% in July 2023 to $65.9 billion, a slight pullback from June's level. Year over year, sales were 1.5% higher than July 2022.

July 2023 saw Yukon continue its exceptional performance with 15.2% year-over-year growth, the second consecutive month of double-digit gains. Four provinces recorded declines, with weakness concentrated in western Canada and Nova Scotia.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-08-01"), value: 65.16},
  {date: new Date("2022-09-01"), value: 64.85},
  {date: new Date("2022-10-01"), value: 65.40},
  {date: new Date("2022-11-01"), value: 65.41},
  {date: new Date("2022-12-01"), value: 64.68},
  {date: new Date("2023-01-01"), value: 66.27},
  {date: new Date("2023-02-01"), value: 65.67},
  {date: new Date("2023-03-01"), value: 65.35},
  {date: new Date("2023-04-01"), value: 65.63},
  {date: new Date("2023-05-01"), value: 65.66},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.89}
];

display(Plot.plot({
  title: "Retail sales, Canada, August 2022 to July 2023 ($ billions)",
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

## Yukon continues exceptional growth

Yukon led all provinces for the second consecutive month with exceptional year-over-year growth of 15.2%. New Brunswick followed at 5.1%, with Quebec at 4.7% and Newfoundland and Labrador at 4.4%.

Four provinces recorded year-over-year declines. Saskatchewan fell 0.4% and Alberta dropped 0.5%, while Manitoba declined 2.0% and Nova Scotia fell 2.1%—the steepest provincial decline.

```js
const provincialData = [
  {province: "Yukon", value: 15.2},
  {province: "New Brunswick", value: 5.1},
  {province: "Quebec", value: 4.7},
  {province: "Newfoundland and Labrador", value: 4.4},
  {province: "Prince Edward Island", value: 2.1},
  {province: "Ontario", value: 1.2},
  {province: "British Columbia", value: 0.2},
  {province: "Saskatchewan", value: -0.4},
  {province: "Alberta", value: -0.5},
  {province: "Manitoba", value: -2.0},
  {province: "Nova Scotia", value: -2.1}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, July 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-5, 18]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.5], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 18,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.5, label: "Canada average"}], {
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

Motor vehicle and parts dealers remained the largest retail subsector in July, with sales of $17.3 billion. Food and beverage retailers recorded sales of $12.1 billion.

| Retail subsector | Sales (July 2023) |
|---|---:|
| Motor vehicle and parts dealers | $17.3B |
| Food and beverage retailers | $12.1B |
| General merchandise retailers | $8.4B |
| Gasoline stations and fuel vendors | $5.9B |
| Health and personal care retailers | $5.1B |
| Building material and garden equipment dealers | $3.8B |

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
current <- total_retail %>% filter(REF_DATE == "2023-07") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2023-06") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2022-07") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2023-07",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2023-07", "2022-07"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2023-07` - `2022-07`) / `2022-07` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** July 2023
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-july-2023", "en"));
```
