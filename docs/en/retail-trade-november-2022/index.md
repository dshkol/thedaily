---
title: Retail sales flat in November, Manitoba leads provincial growth at 11.2%
toc: false
---

# Retail sales flat in November, Manitoba leads provincial growth at 11.2%

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales were essentially unchanged (0.0%) in November 2022 at $65.4 billion
- Year over year, sales rose 4.8%, maintaining solid annual growth momentum
- Manitoba led all provinces with 11.2% year-over-year growth
- Only the Northwest Territories recorded a year-over-year decline (-3.3%)

</div>

Retail sales in Canada were essentially unchanged in November 2022, holding steady at $65.4 billion. Year-over-year growth remained solid at 4.8%, reflecting continued consumer spending despite broader economic uncertainties.

November's flat monthly performance followed several months of elevated sales earlier in the year, with sales stabilizing after the summer peak of $66.8 billion in June.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.89},
  {date: new Date("2022-08-01"), value: 65.16},
  {date: new Date("2022-09-01"), value: 64.85},
  {date: new Date("2022-10-01"), value: 65.40},
  {date: new Date("2022-11-01"), value: 65.41}
];

display(Plot.plot({
  title: "Retail sales, Canada, December 2021 to November 2022 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [60, 68], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Manitoba leads provincial growth

Manitoba led all provinces with exceptional year-over-year growth of 11.2%, followed by Prince Edward Island at 10.0%. Nova Scotia and Yukon also posted strong gains above 7%.

Nearly all provinces recorded positive year-over-year growth, with only the Northwest Territories posting a decline at -3.3%.

```js
const provincialData = [
  {province: "Manitoba", value: 11.2},
  {province: "Prince Edward Island", value: 10.0},
  {province: "Nova Scotia", value: 7.5},
  {province: "Yukon", value: 7.1},
  {province: "Quebec", value: 6.5},
  {province: "Saskatchewan", value: 5.2},
  {province: "New Brunswick", value: 4.7},
  {province: "Alberta", value: 4.7},
  {province: "British Columbia", value: 3.9},
  {province: "Newfoundland and Labrador", value: 3.4},
  {province: "Ontario", value: 3.4},
  {province: "Northwest Territories", value: -3.3}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, November 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-5, 14]},
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
      x: 14,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 4.8, label: "Canada average"}], {
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

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in November, with sales of $16.8 billion. Food and beverage retailers recorded sales of $11.6 billion.

| Retail subsector | Sales (November 2022) |
|---|---:|
| Motor vehicle and parts dealers | $16.8B |
| Food and beverage retailers | $11.6B |
| General merchandise retailers | $8.1B |
| Gasoline stations and fuel vendors | $5.9B |
| Health and personal care retailers | $4.9B |
| Building material and garden equipment dealers | $3.3B |

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
current <- total_retail %>% filter(REF_DATE == "2022-11") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2022-10") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2021-11") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2022-11",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2022-11", "2021-11"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2022-11` - `2021-11`) / `2021-11` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** November 2022
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-november-2022", "en"));
```
