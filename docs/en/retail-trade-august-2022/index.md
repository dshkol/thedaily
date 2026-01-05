---
title: Retail sales up 0.4% in August, four provinces post double-digit annual growth
toc: false
---

# Retail sales up 0.4% in August, four provinces post double-digit annual growth

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 0.4% in August 2022 to $65.2 billion
- Year over year, sales were up 6.6%, continuing strong annual growth
- Four provinces posted double-digit year-over-year growth: Newfoundland and Labrador, Yukon, Manitoba, and Alberta
- Only the Northwest Territories recorded a year-over-year decline (-0.9%)

</div>

Retail sales in Canada rose 0.4% in August 2022 to $65.2 billion, a modest gain following a pullback in July. Year-over-year growth remained robust at 6.6%.

August 2022 was notable for its exceptionally strong regional performance, with four provinces posting double-digit year-over-year gains. Newfoundland and Labrador led at 11.5%, followed closely by Yukon, Manitoba, and Alberta all above 10%.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-09-01"), value: 60.84},
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.89},
  {date: new Date("2022-08-01"), value: 65.16}
];

display(Plot.plot({
  title: "Retail sales, Canada, September 2021 to August 2022 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [59, 68], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Newfoundland and Labrador leads provincial growth

Newfoundland and Labrador led all provinces with exceptional year-over-year growth of 11.5%, followed by Yukon at 10.9%, Manitoba at 10.7%, and Alberta at 10.4%. These four provinces all posted double-digit gains.

Nearly all provinces recorded positive year-over-year growth. Only the Northwest Territories posted a decline, and by less than 1%.

```js
const provincialData = [
  {province: "Newfoundland and Labrador", value: 11.5},
  {province: "Yukon", value: 10.9},
  {province: "Manitoba", value: 10.7},
  {province: "Alberta", value: 10.4},
  {province: "Quebec", value: 7.9},
  {province: "Saskatchewan", value: 7.5},
  {province: "Prince Edward Island", value: 7.2},
  {province: "New Brunswick", value: 6.7},
  {province: "British Columbia", value: 5.7},
  {province: "Nova Scotia", value: 4.8},
  {province: "Ontario", value: 4.6},
  {province: "Northwest Territories", value: -0.9}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, August 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-2, 14]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([6.6], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 14,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 6.6, label: "Canada average"}], {
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

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in August, with sales of $16.6 billion. Food and beverage retailers recorded sales of $11.4 billion.

| Retail subsector | Sales (August 2022) |
|---|---:|
| Motor vehicle and parts dealers | $16.6B |
| Food and beverage retailers | $11.4B |
| General merchandise retailers | $7.9B |
| Gasoline stations and fuel vendors | $6.0B |
| Health and personal care retailers | $4.8B |
| Building material and garden equipment dealers | $3.5B |

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
current <- total_retail %>% filter(REF_DATE == "2022-08") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2022-07") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2021-08") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2022-08",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2022-08", "2021-08"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2022-08` - `2021-08`) / `2021-08` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** August 2022
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-august-2022", "en"));
```
