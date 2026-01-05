---
title: Retail sales rise 1.5% in July, rebounding from two months of declines
toc: false
---

# Retail sales rise 1.5% in July, rebounding from two months of declines

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Historical</span></p>

<div class="highlights">

**Highlights**

- Retail sales rose 1.5% in July 2024 to $66.9 billion, rebounding from declines in May and June
- Year-over-year, sales were up 1.5%, with Saskatchewan (+7.3%) leading provincial gains
- Three provinces recorded year-over-year declines: British Columbia (-0.2%), Prince Edward Island (-0.9%), and Yukon (-5.6%)
- The July gain marked the end of a two-month slide in retail activity

</div>

Retail sales in Canada rose 1.5% in July 2024 to $66.9 billion, rebounding from declines of 0.1% in June and 1.2% in May. Year-over-year, sales were 1.5% higher than July 2023.

The July rebound followed two consecutive months of decline, bringing sales back to levels last seen in April. Eight provinces and territories posted year-over-year gains.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
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
  {date: new Date("2024-06-01"), value: 65.89},
  {date: new Date("2024-07-01"), value: 66.89}
];

display(Plot.plot({
  title: "Retail sales, Canada, August 2023 to July 2024 ($ billions)",
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

## Saskatchewan leads provincial gains, three provinces decline

Saskatchewan led year-over-year growth at 7.3%, followed by Newfoundland and Labrador at 5.9% and Alberta at 5.3%. The Prairie provinces showed particular strength, with Manitoba also posting gains of 3.1%.

Three provinces recorded year-over-year declines. British Columbia saw a marginal decrease of 0.2%, while Prince Edward Island fell 0.9%. Yukon continued its pattern of decline with a 5.6% drop.

```js
const provincialData = [
  {province: "Saskatchewan", value: 7.3},
  {province: "Newfoundland and Labrador", value: 5.9},
  {province: "Alberta", value: 5.3},
  {province: "Nova Scotia", value: 3.2},
  {province: "Manitoba", value: 3.1},
  {province: "Quebec", value: 1.2},
  {province: "New Brunswick", value: 0.4},
  {province: "Ontario", value: 0.3},
  {province: "British Columbia", value: -0.2},
  {province: "Prince Edward Island", value: -0.9},
  {province: "Yukon", value: -5.6}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, July 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-8, 10]},
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
      x: 10,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.5, label: "Canada average"}], {
      x: "x",
      text: "label",
      y: "Saskatchewan",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Motor vehicle dealers remain top subsector

Motor vehicle and parts dealers remained the largest retail subsector in July, with sales of $18.0 billion. Food and beverage retailers recorded sales of $12.7 billion.

| Retail subsector | Sales (July 2024) |
|---|---:|
| Motor vehicle and parts dealers | $18.0B |
| Food and beverage retailers | $12.7B |
| General merchandise retailers | $8.9B |
| Gasoline stations and fuel vendors | $5.8B |
| Health and personal care retailers | $5.5B |
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
current <- total_retail %>% filter(REF_DATE == "2024-07") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2024-06") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2023-07") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2024-07",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2024-07", "2023-07"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2024-07` - `2023-07`) / `2023-07` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** July 2024
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-july-2024", "en"));
```
