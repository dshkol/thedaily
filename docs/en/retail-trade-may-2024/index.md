---
title: Retail sales decline 1.2% in May as four provinces post year-over-year declines
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales decline 1.2% in May as four provinces post year-over-year declines

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Historical</span></p>

<div class="highlights">

**Highlights**

- Retail sales fell 1.2% in May 2024 to $66.0 billion, declining from the April peak
- Year-over-year, sales were up 0.5%, with New Brunswick and Saskatchewan leading gains at 4.3%
- Four provinces posted year-over-year declines, led by British Columbia at -1.5%
- The May decline began a two-month slide in retail activity

</div>

Retail sales in Canada fell 1.2% in May 2024 to $66.0 billion, declining from the April peak of $66.8 billion. Year-over-year, sales were 0.5% higher than May 2023.

The May decline marked the beginning of a two-month slide in retail activity, with June recording an additional 0.1% drop. Four provinces recorded year-over-year declines, concentrated among the western and central provinces.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-06-01"), value: 66.00},
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
  {date: new Date("2024-05-01"), value: 65.96}
];

display(Plot.plot({
  title: "Retail sales, Canada, June 2023 to May 2024 ($ billions)",
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

## Atlantic provinces lead gains, western provinces lag

New Brunswick and Saskatchewan tied for the lead in year-over-year growth at 4.3%, followed by Newfoundland and Labrador at 3.8%. Quebec posted gains of 2.9%, while Yukon rose 2.2%.

Four provinces recorded year-over-year declines. British Columbia fell 1.5%, followed by Alberta at 1.1%. Ontario edged down 0.4%, while Manitoba posted a marginal decline of 0.3%.

```js
const provincialData = [
  {province: "New Brunswick", value: 4.3},
  {province: "Saskatchewan", value: 4.3},
  {province: "Newfoundland and Labrador", value: 3.8},
  {province: "Quebec", value: 2.9},
  {province: "Yukon", value: 2.2},
  {province: "Nova Scotia", value: 1.9},
  {province: "Prince Edward Island", value: 0.6},
  {province: "Manitoba", value: -0.3},
  {province: "Ontario", value: -0.4},
  {province: "Alberta", value: -1.1},
  {province: "British Columbia", value: -1.5}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, May 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-4, 8]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([0.5], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 8,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 0.5, label: "Canada average"}], {
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

## Motor vehicle dealers remain top subsector

Motor vehicle and parts dealers remained the largest retail subsector in May, with sales of $17.9 billion. Food and beverage retailers recorded sales of $12.5 billion.

| Retail subsector | Sales (May 2024) |
|---|---:|
| Motor vehicle and parts dealers | $17.9B |
| Food and beverage retailers | $12.5B |
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
current <- total_retail %>% filter(REF_DATE == "2024-05") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2024-04") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2023-05") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2024-05",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2024-05", "2023-05"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2024-05` - `2023-05`) / `2023-05` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** May 2024
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-may-2024", "en"));
```
