---
title: Natural gas production up 3.2% year over year in October 2025
verification_json: output/natural_gas_supply.json
toc: false
---
# Natural gas production up 3.2% year over year in October 2025

<p class="release-date">Released: January 17, 2026 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Canadian natural gas production totalled 17,109 million cubic metres in October 2025, up 3.2% from October 2024
- Production increased 8.9% from September as seasonal demand rose
- Alberta accounted for 62.9% of national production at 10,760 million cubic metres
- Exports totalled 7,442 million cubic metres, representing 43.5% of production

</div>

Canadian natural gas production totalled 17,109 million cubic metres in October 2025, up 3.2% from the 16,573 million cubic metres produced in October 2024. Month over month, production increased 8.9% from September's 15,713 million cubic metres as cooler temperatures and seasonal heating demand contributed to higher output.

October production remained within the typical range observed over the past two years, with monthly volumes generally fluctuating between 15,500 and 17,500 million cubic metres.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 25-10-0055
const gasData = [
  {date: new Date("2023-11-01"), value: 16208.0},
  {date: new Date("2023-12-01"), value: 17064.5},
  {date: new Date("2024-01-01"), value: 16487.3},
  {date: new Date("2024-02-01"), value: 15956.1},
  {date: new Date("2024-03-01"), value: 16796.9},
  {date: new Date("2024-04-01"), value: 16053.9},
  {date: new Date("2024-05-01"), value: 16007.5},
  {date: new Date("2024-06-01"), value: 15645.9},
  {date: new Date("2024-07-01"), value: 15804.1},
  {date: new Date("2024-08-01"), value: 16294.9},
  {date: new Date("2024-09-01"), value: 15084.9},
  {date: new Date("2024-10-01"), value: 16573.4},
  {date: new Date("2024-11-01"), value: 16920.0},
  {date: new Date("2024-12-01"), value: 17519.0},
  {date: new Date("2025-01-01"), value: 17477.1},
  {date: new Date("2025-02-01"), value: 15559.9},
  {date: new Date("2025-03-01"), value: 17475.8},
  {date: new Date("2025-04-01"), value: 16423.8},
  {date: new Date("2025-05-01"), value: 16955.5},
  {date: new Date("2025-06-01"), value: 15837.0},
  {date: new Date("2025-07-01"), value: 16859.8},
  {date: new Date("2025-08-01"), value: 16524.7},
  {date: new Date("2025-09-01"), value: 15713.0},
  {date: new Date("2025-10-01"), value: 17109.4}
];

display(Plot.plot({
  title: "Canadian natural gas production, November 2023 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [14500, 18000], grid: true, label: "Million cubic metres"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(gasData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(gasData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(gasData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(0), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Alberta dominates national production

Alberta produced 10,760 million cubic metres in October 2025, accounting for 62.9% of national output. British Columbia followed with 6,186 million cubic metres (36.2%), while Saskatchewan contributed 144 million cubic metres.

Production from other provinces and territories was minimal, with Quebec, Ontario, and the Northwest Territories together contributing less than 20 million cubic metres.

| Province | Production (million m³) | Share |
|---|---:|---:|
| Alberta | 10,760 | 62.9% |
| British Columbia | 6,186 | 36.2% |
| Saskatchewan | 144 | 0.8% |
| Other | 19 | 0.1% |

```js
const provincialData = [
  {province: "Alberta", value: 10760},
  {province: "British Columbia", value: 6186},
  {province: "Saskatchewan", value: 144}
];

display(Plot.plot({
  title: "Natural gas production by province, October 2025",
  width: 640,
  height: 200,
  marginLeft: 120,
  x: {grid: true, label: "Million cubic metres"},
  y: {label: null},
  marks: [
    Plot.barX(provincialData, {x: "value", y: "province", fill: "#AF3C43", sort: {y: "-x"}}),
    Plot.text(provincialData, {x: "value", y: "province", text: d => d.value.toLocaleString(), dx: 35, fill: "currentColor"})
  ]
}));
```

## Export volumes remain substantial

Natural gas exports totalled 7,442 million cubic metres in October 2025, representing 43.5% of total production. The majority of Canadian natural gas exports are destined for the United States through the extensive pipeline network connecting the two countries.

<div class="note-to-readers">

## Note to readers

Natural gas production data measure the gross volume of marketable natural gas produced in Canada. Data are reported by province and territory based on the location of production.

Production volumes are expressed in million cubic metres at standard conditions (15 degrees Celsius and 101.325 kilopascals).

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch natural gas supply data
gas <- get_cansim("25-10-0055")

# National production time series
national <- gas %>%
  filter(GEO == "Canada",
         `Supply and disposition` == "Marketable production") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Calculate changes
current <- national %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
previous <- national %>% filter(REF_DATE == "2025-09") %>% pull(VALUE)
year_ago <- national %>% filter(REF_DATE == "2024-10") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100
yoy_change <- (current - year_ago) / year_ago * 100

# Provincial breakdown
by_province <- gas %>%
  filter(GEO != "Canada",
         `Supply and disposition` == "Marketable production",
         REF_DATE == "2025-10") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))

# Exports
exports <- gas %>%
  filter(GEO == "Canada",
         `Supply and disposition` == "Exports",
         REF_DATE == "2025-10") %>%
  pull(VALUE)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 25-10-0055](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2510005501)
**Survey:** Supply and Disposition of Natural Gas
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/2510005501-eng](https://doi.org/10.25318/2510005501-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "natural-gas-october-2025", "en"));
```
