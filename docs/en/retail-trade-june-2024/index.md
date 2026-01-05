---
title: Retail sales edge down 0.1% in June as five provinces post year-over-year declines
toc: false
---

# Retail sales edge down 0.1% in June as five provinces post year-over-year declines

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Historical</span></p>

<div class="highlights">

**Highlights**

- Retail sales edged down 0.1% in June 2024 to $65.9 billion, the second consecutive monthly decline
- Year-over-year, sales were down 0.2%, the first annual decline in the series
- Five provinces posted year-over-year declines, led by Prince Edward Island at -3.9%
- Newfoundland and Labrador led gains at 8.8%, while Yukon posted an unusual positive result at 5.4%

</div>

Retail sales in Canada edged down 0.1% in June 2024 to $65.9 billion, following a 1.2% decline in May. Year-over-year, sales were 0.2% lower than June 2023, marking the first annual decline in the series.

The June decline was part of a two-month slide in retail activity, with sales falling from the April peak of $66.8 billion. Five provinces recorded year-over-year declines—the highest count observed in the data.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-07-01"), value: 65.89},
  {date: new Date("2023-08-01"), value: 65.93},
  {date: new Date("2023-09-01"), value: 66.58},
  {date: new Date("2023-10-01"), value: 66.51},
  {date: new Date("2023-11-01"), value: 66.56},
  {date: new Date("2023-12-01"), value: 66.32},
  {date: new Date("2024-01-01"), value: 66.08},
  {date: new Date("2024-02-01"), value: 66.24},
  {date: new Date("2024-03-01"), value: 66.16},
  {date: new Date("2024-04-01"), value: 66.78},
  {date: new Date("2024-05-01"), value: 65.96},
  {date: new Date("2024-06-01"), value: 65.89}
];

display(Plot.plot({
  title: "Retail sales, Canada, July 2023 to June 2024 ($ billions)",
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

## Five provinces record year-over-year declines

Five provinces posted year-over-year declines in June, the highest count in the series. Prince Edward Island recorded the largest drop at 3.9%, followed by Ontario at 1.2%. British Columbia fell 0.6%, Nova Scotia declined 0.4%, and Manitoba edged down 0.1%.

Newfoundland and Labrador led gains at 8.8%, while Yukon posted a positive result at 5.4%—a reversal from later months when it would become the largest provincial decliner.

```js
const provincialData = [
  {province: "Newfoundland and Labrador", value: 8.8},
  {province: "Yukon", value: 5.4},
  {province: "Saskatchewan", value: 1.2},
  {province: "New Brunswick", value: 0.9},
  {province: "Quebec", value: 0.7},
  {province: "Alberta", value: 0.5},
  {province: "Manitoba", value: -0.1},
  {province: "Nova Scotia", value: -0.4},
  {province: "British Columbia", value: -0.6},
  {province: "Ontario", value: -1.2},
  {province: "Prince Edward Island", value: -3.9}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, June 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-6, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([-0.2], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: -0.2, label: "Canada average"}], {
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

## Motor vehicle dealers remain top subsector

Motor vehicle and parts dealers remained the largest retail subsector in June, with sales of $17.9 billion. Food and beverage retailers recorded sales of $12.6 billion.

| Retail subsector | Sales (June 2024) |
|---|---:|
| Motor vehicle and parts dealers | $17.9B |
| Food and beverage retailers | $12.6B |
| General merchandise retailers | $8.8B |
| Gasoline stations and fuel vendors | $5.8B |
| Health and personal care retailers | $5.4B |
| Building materials and garden equipment dealers | $3.9B |

<div class="note-to-readers">

## Note to readers

Retail trade data are collected from a sample of retail establishments across Canada. Sales figures are seasonally adjusted to account for regular patterns such as holiday shopping.

The Monthly Retail Trade Survey provides monthly estimates of sales by type of retail store and geographic area. Data for the most recent months are preliminary and subject to revision.

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
current <- total_retail %>% filter(REF_DATE == "2024-06") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2024-05") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2023-06") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2024-06",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2024-06", "2023-06"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2024-06` - `2023-06`) / `2023-06` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** June 2024
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-june-2024", "en"));
```
