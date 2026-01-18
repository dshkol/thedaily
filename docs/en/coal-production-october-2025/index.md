---
title: Coal production up 13.2% in October 2025 after September decline
verification_json: output/coal_production.json
toc: false
---
# Coal production up 13.2% in October 2025 after September decline

<p class="release-date">Released: January 17, 2026 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Canada's coal production totalled 3,511 thousand tonnes in October 2025, up 13.2% from September
- Year-over-year, production was down 1.3% compared with October 2024
- The October rebound followed a decline in September, when output fell to 3,102 thousand tonnes
- Bituminous coal accounted for the majority of production at 2,976 thousand tonnes

</div>

Canada's coal production rose 13.2% in October 2025 to 3,511 thousand tonnes, rebounding from 3,102 thousand tonnes in September. Despite the monthly gain, production remained 1.3% below the level recorded in October 2024, when output totalled 3,557 thousand tonnes.

The October increase partially offset the decline recorded in September, when production fell to its lowest level of 2025. Monthly production has fluctuated throughout the year, ranging from a low of 2,695 thousand tonnes in February to a high of 3,901 thousand tonnes in April.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 25-10-0046
const productionData = [
  {date: new Date("2023-11-01"), value: 4099},
  {date: new Date("2023-12-01"), value: 4270},
  {date: new Date("2024-01-01"), value: 3366},
  {date: new Date("2024-02-01"), value: 3398},
  {date: new Date("2024-03-01"), value: 3889},
  {date: new Date("2024-04-01"), value: 3809},
  {date: new Date("2024-05-01"), value: 3949},
  {date: new Date("2024-06-01"), value: 3569},
  {date: new Date("2024-07-01"), value: 3486},
  {date: new Date("2024-08-01"), value: 3055},
  {date: new Date("2024-09-01"), value: 3546},
  {date: new Date("2024-10-01"), value: 3557},
  {date: new Date("2024-11-01"), value: 3245},
  {date: new Date("2024-12-01"), value: 3713},
  {date: new Date("2025-01-01"), value: 3687},
  {date: new Date("2025-02-01"), value: 2695},
  {date: new Date("2025-03-01"), value: 3816},
  {date: new Date("2025-04-01"), value: 3901},
  {date: new Date("2025-05-01"), value: 3780},
  {date: new Date("2025-06-01"), value: 3444},
  {date: new Date("2025-07-01"), value: 3826},
  {date: new Date("2025-08-01"), value: 3805},
  {date: new Date("2025-09-01"), value: 3102},
  {date: new Date("2025-10-01"), value: 3511}
];

display(Plot.plot({
  title: "Coal production, Canada, November 2023 to October 2025 (thousand tonnes)",
  width: 680,
  height: 300,
  y: {domain: [2500, 4500], grid: true, label: "Thousand tonnes"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(productionData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(productionData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(productionData.slice(-1), {x: "date", y: "value", text: d => d.value.toLocaleString(), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Production trends over the past year

Over the 12 months ending in October 2025, Canadian coal production has averaged 3,527 thousand tonnes per month. Production peaked in April 2025 at 3,901 thousand tonnes and reached its lowest point in February 2025 at 2,695 thousand tonnes.

Compared with the same period a year earlier, production has generally trended lower. In October 2024, output stood at 3,557 thousand tonnes, while the late 2023 period saw higher production levels, with December 2023 reaching 4,270 thousand tonnes.

## Bituminous coal dominates production

Bituminous coal, used for both metallurgical and thermal purposes, accounted for 2,976 thousand tonnes of production in October 2025. Detailed breakdowns by coal type for sub-bituminous and lignite coal are suppressed for confidentiality.

| Coal type | October 2025 (thousand tonnes) |
|---|---:|
| Bituminous, all uses | 2,976 |
| Sub-bituminous, thermal | suppressed |
| Lignite, thermal | suppressed |

## Provincial production

Provincial production data for October 2025 is largely suppressed for confidentiality reasons. Alberta reported production of 362 thousand tonnes, while data for other coal-producing provinces including British Columbia, Saskatchewan, and Nova Scotia are not available for release.

<div class="note-to-readers">

## Note to readers

Coal production data are collected monthly from mining operations across Canada. Production volumes include coal extracted from both surface and underground mines.

Data are subject to suppression when disclosure could identify individual operations or compromise confidentiality requirements. This affects provincial breakdowns and detailed coal type classifications.

Production is reported in tonnes. The scalar factor is thousands, meaning values represent thousands of tonnes.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch coal production data
coal <- get_cansim("25-10-0046")

# National production time series
national <- coal %>%
  filter(GEO == "Canada",
         `Coal types and uses` == "Total all coal types and uses",
         `Coal volume` == "Production") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Calculate month-over-month change
current <- national %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
previous <- national %>% filter(REF_DATE == "2025-09") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Calculate year-over-year change
year_ago <- national %>% filter(REF_DATE == "2024-10") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Provincial breakdown
provincial <- coal %>%
  filter(`Coal types and uses` == "Total all coal types and uses",
         `Coal volume` == "Production",
         REF_DATE == "2025-10",
         GEO != "Canada") %>%
  select(GEO, VALUE, STATUS)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 25-10-0046](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2510004601)
**Survey:** Monthly Coal Survey
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/2510004601-eng](https://doi.org/10.25318/2510004601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "coal-production-october-2025", "en"));
```
