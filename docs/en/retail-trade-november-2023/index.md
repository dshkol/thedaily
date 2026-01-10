---
title: Retail sales edge up 0.1% in November, New Brunswick leads year-over-year gains
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales edge up 0.1% in November, New Brunswick leads year-over-year gains

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag backfill">Backfill</span></p>

<div class="highlights">

**Highlights**

- Retail sales edged up 0.1% in November 2023 to $66.6 billion, continuing a modest upward trend
- Year over year, sales were up 1.8%, with New Brunswick leading provincial gains at 7.4%
- British Columbia posted exactly flat growth (0.0%) year over year—an unusual result
- Three provinces recorded year-over-year declines: Nova Scotia, Manitoba, and Saskatchewan

</div>

Retail sales in Canada edged up 0.1% in November 2023 to $66.6 billion, continuing a modest upward trend from October. Year over year, sales were 1.8% higher than November 2022.

November 2023 marked the beginning of the holiday shopping season. New Brunswick led all provinces with 7.4% year-over-year growth, while British Columbia posted an unusual flat result at exactly 0.0%.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-12-01"), value: 64.68},
  {date: new Date("2023-01-01"), value: 66.27},
  {date: new Date("2023-02-01"), value: 65.67},
  {date: new Date("2023-03-01"), value: 65.35},
  {date: new Date("2023-04-01"), value: 65.63},
  {date: new Date("2023-05-01"), value: 65.66},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.89},
  {date: new Date("2023-08-01"), value: 65.93},
  {date: new Date("2023-09-01"), value: 66.58},
  {date: new Date("2023-10-01"), value: 66.51},
  {date: new Date("2023-11-01"), value: 66.56}
];

display(Plot.plot({
  title: "Retail sales, Canada, December 2022 to November 2023 ($ billions)",
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

## New Brunswick leads gains, Saskatchewan lags

New Brunswick led all provinces with year-over-year growth of 7.4%, continuing its strong performance. Yukon followed at 5.4%, with Quebec at 3.3%.

British Columbia posted an unusual flat result at exactly 0.0% year over year. Three provinces recorded declines: Nova Scotia and Manitoba both fell 1.1%, while Saskatchewan dropped 3.3%—the steepest provincial decline.

```js
const provincialData = [
  {province: "New Brunswick", value: 7.4},
  {province: "Yukon", value: 5.4},
  {province: "Quebec", value: 3.3},
  {province: "Prince Edward Island", value: 2.8},
  {province: "Ontario", value: 2.0},
  {province: "Alberta", value: 1.9},
  {province: "Newfoundland and Labrador", value: 1.3},
  {province: "British Columbia", value: 0.0},
  {province: "Nova Scotia", value: -1.1},
  {province: "Manitoba", value: -1.1},
  {province: "Saskatchewan", value: -3.3}
];

display(Plot.plot({
  title: "Year-over-year change in retail sales by province, November 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 160,
  x: {grid: true, label: "Year-over-year change (%)", domain: [-6, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.8], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 10,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.8, label: "Canada average"}], {
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

Motor vehicle and parts dealers remained the largest retail subsector in November, with sales of $17.5 billion. Food and beverage retailers recorded sales of $12.3 billion.

| Retail subsector | Sales (November 2023) |
|---|---:|
| Motor vehicle and parts dealers | $17.5B |
| Food and beverage retailers | $12.3B |
| General merchandise retailers | $8.6B |
| Gasoline stations and fuel vendors | $5.7B |
| Health and personal care retailers | $5.2B |
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
current <- total_retail %>% filter(REF_DATE == "2023-11") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2023-10") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2022-11") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2023-11",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2023-11", "2022-11"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2023-11` - `2022-11`) / `2022-11` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** November 2023
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-november-2023", "en"));
```
