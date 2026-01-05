---
title: Retail sales up 0.5% in June as year-over-year growth turns negative for first time
toc: false
---

# Retail sales up 0.5% in June as year-over-year growth turns negative for first time

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 0.5% in June 2023 to $66.0 billion, rebounding from May's slower pace
- Year over year, sales declined 1.2%, the first annual decline after months of positive growth
- New Brunswick led provincial gains at 5.0%, while Ontario and British Columbia fell over 4%
- Four provinces recorded year-over-year declines: Manitoba, Saskatchewan, Ontario, and British Columbia

</div>

Retail sales in Canada rose 0.5% in June 2023 to $66.0 billion, rebounding from the previous month's slower pace. However, year over year, sales were down 1.2% compared with June 2022—the first annual decline after an extended period of year-over-year gains.

June 2023 marked a turning point for retail performance, with the year-over-year comparison turning negative as the strong base from 2022 caught up with current sales levels. Atlantic Canada continued to outperform, while central and western Canada showed weakness.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-07-01"), value: 64.90},
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
  {date: new Date("2023-06-01"), value: 66.00}
];

display(Plot.plot({
  title: "Retail sales, Canada, July 2022 to June 2023 ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [63, 68], grid: true, label: "Billions ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Atlantic Canada leads while central Canada struggles

New Brunswick led all provinces with 5.0% year-over-year growth. Prince Edward Island followed at 3.4%, with Alberta posting gains of 3.3%.

Four provinces recorded year-over-year declines. Ontario fell 4.0% and British Columbia dropped 4.1%, both significantly below the national rate. Manitoba and Saskatchewan each declined 2.5%.

```js
const provincialData = [
  {province: "New Brunswick", value: 5.0},
  {province: "Prince Edward Island", value: 3.4},
  {province: "Alberta", value: 3.3},
  {province: "Nova Scotia", value: 2.2},
  {province: "Quebec", value: 2.2},
  {province: "Newfoundland and Labrador", value: 1.6},
  {province: "Yukon", value: 0.7},
  {province: "Manitoba", value: -2.5},
  {province: "Saskatchewan", value: -2.5},
  {province: "Ontario", value: -4.0},
  {province: "British Columbia", value: -4.1}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, June 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-6, 8]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([-1.2], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 8,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: -1.2, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "New Brunswick",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers lead subsectors

Motor vehicle and parts dealers remained the largest retail subsector in June, with sales of $17.1 billion. Food and beverage retailers recorded sales of $12.0 billion.

| Retail subsector | Sales (June 2023) |
|---|---:|
| Motor vehicle and parts dealers | $17.1B |
| Food and beverage retailers | $12.0B |
| General merchandise retailers | $8.3B |
| Gasoline stations and fuel vendors | $5.9B |
| Health and personal care retailers | $5.0B |
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
current <- total_retail %>% filter(REF_DATE == "2023-06") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2023-05") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2022-06") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2023-06",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2023-06", "2022-06"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2023-06` - `2022-06`) / `2022-06` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** June 2023
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-june-2023", "en"));
```
