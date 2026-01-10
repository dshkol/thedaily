---
title: Canadian dollar strengthens 3.1% against U.S. dollar year over year in December 2025
verification_json: output/data_33_10_0163_enhanced.json
---
# Canadian dollar strengthens 3.1% against U.S. dollar year over year in December 2025

<p class="release-date">Released: 2026-01-06</p>

<div class="metric-box">
  <div class="value">1.38</div>
  <div class="label">CAD per USD, December 2025</div>
</div>

The Canadian dollar strengthened against the U.S. dollar in December 2025, with the exchange rate averaging 1.3802 Canadian dollars per U.S. dollar. This represents a 3.1% appreciation compared with December 2024, when the rate stood at 1.4240. On a monthly basis, the Canadian dollar strengthened 1.8% from November 2025.

<div class="highlights">

**Highlights**

- The Canadian dollar strengthened 3.1% year over year against the U.S. dollar
- Monthly average exchange rate was 1.3802 CAD per USD in December 2025
- The Canadian dollar weakened against European currencies, with the euro and Swiss franc both up over 8%
- The Swedish krona showed the largest gain against the Canadian dollar at 14.4%

</div>

## U.S. dollar exchange rate trend

The exchange rate has fluctuated through 2025, reaching a peak of 1.4390 CAD per USD in January before declining through the spring. After a brief recovery in the fall, the rate fell back to 1.3802 in December.

```js
import * as Plot from "npm:@observablehq/plot";

const exchangeData = [
  {date: new Date("2024-01"), rate: 1.3425},
  {date: new Date("2024-02"), rate: 1.3501},
  {date: new Date("2024-03"), rate: 1.3539},
  {date: new Date("2024-04"), rate: 1.3674},
  {date: new Date("2024-05"), rate: 1.3670},
  {date: new Date("2024-06"), rate: 1.3707},
  {date: new Date("2024-07"), rate: 1.3712},
  {date: new Date("2024-08"), rate: 1.3652},
  {date: new Date("2024-09"), rate: 1.3546},
  {date: new Date("2024-10"), rate: 1.3755},
  {date: new Date("2024-11"), rate: 1.3975},
  {date: new Date("2024-12"), rate: 1.4240},
  {date: new Date("2025-01"), rate: 1.4390},
  {date: new Date("2025-02"), rate: 1.4301},
  {date: new Date("2025-03"), rate: 1.4359},
  {date: new Date("2025-04"), rate: 1.3988},
  {date: new Date("2025-05"), rate: 1.3860},
  {date: new Date("2025-06"), rate: 1.3674},
  {date: new Date("2025-07"), rate: 1.3691},
  {date: new Date("2025-08"), rate: 1.3802},
  {date: new Date("2025-09"), rate: 1.3833},
  {date: new Date("2025-10"), rate: 1.3992},
  {date: new Date("2025-11"), rate: 1.4055},
  {date: new Date("2025-12"), rate: 1.3802}
];

display(Plot.plot({
  title: "CAD per USD exchange rate (monthly average)",
  width: 640,
  height: 280,
  y: {domain: [1.30, 1.50], grid: true, label: "CAD per USD"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([1.35, 1.40, 1.45], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.areaY(exchangeData, {x: "date", y: "rate", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(exchangeData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(exchangeData, {x: "date", y: "rate", fill: "#AF3C43", r: 3})
  ]
}));
```

## Currency performance versus Canadian dollar

The Canadian dollar's performance varied widely across major trading partner currencies in December 2025. European currencies strengthened significantly against the Canadian dollar, while most Asian currencies weakened.

```js
const currencies = [
  {name: "Swedish krona", change: 14.4},
  {name: "Euro", change: 8.4},
  {name: "Swiss franc", change: 8.4},
  {name: "Mexican peso", change: 8.6},
  {name: "Brazilian real", change: 8.4},
  {name: "Peruvian sol", change: 7.5},
  {name: "Norwegian krone", change: 7.5},
  {name: "South African rand", change: 4.7},
  {name: "U.K. pound", change: 2.5},
  {name: "Singapore dollar", change: 1.4},
  {name: "Australian dollar", change: 1.5},
  {name: "Chinese renminbi", change: 0.2},
  {name: "New Zealand dollar", change: -2.5},
  {name: "Saudi riyal", change: -2.9},
  {name: "U.S. dollar", change: -3.1},
  {name: "Hong Kong dollar", change: -3.2},
  {name: "Japanese yen", change: -4.4},
  {name: "South Korean won", change: -5.0},
  {name: "Indian rupee", change: -8.5}
];

display(Plot.plot({
  title: "Year-over-year change vs CAD by currency (%)",
  width: 640,
  height: 480,
  marginLeft: 120,
  x: {domain: [-15, 20], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(currencies, {
      y: "name",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(currencies, {
      y: "name",
      x: "change",
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      dx: d => d.change >= 0 ? 20 : -20,
      fill: "currentColor"
    })
  ]
}));
```

## Major currencies December 2025

| Currency | CAD per unit | Year-over-year change |
|----------|-------------|----------------------|
| U.K. pound sterling | 1.8469 | +2.5% |
| Swiss franc | 1.7317 | +8.4% |
| European euro | 1.6162 | +8.4% |
| U.S. dollar | 1.3802 | -3.1% |
| Singapore dollar | 1.0689 | +1.4% |
| Australian dollar | 0.9164 | +1.5% |
| New Zealand dollar | 0.7983 | -2.5% |

<div class="note-to-readers">

## Note to readers

These exchange rates represent monthly averages as calculated by the Bank of Canada. Exchange rates are expressed as Canadian dollars per unit of foreign currency. A decrease in the rate indicates that the Canadian dollar has strengthened against the foreign currency.

The Bank of Canada publishes daily noon and closing exchange rates as well as monthly averages for a range of currencies.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch exchange rate data
fx <- get_cansim("33-10-0163")

# USD/CAD time series
usd_cad <- fx %>%
  filter(`Type of currency` == "U.S. dollar, monthly average") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# December 2025 rate
dec2025 <- usd_cad %>% filter(REF_DATE == "2025-12") %>% pull(VALUE)
dec2024 <- usd_cad %>% filter(REF_DATE == "2024-12") %>% pull(VALUE)
yoy_change <- (dec2025 - dec2024) / dec2024 * 100

# All currencies December 2025
all_currencies <- fx %>%
  filter(REF_DATE == "2025-12") %>%
  select(`Type of currency`, VALUE) %>%
  arrange(desc(VALUE))

# Year-over-year changes by currency
yoy_by_currency <- fx %>%
  filter(REF_DATE %in% c("2025-12", "2024-12")) %>%
  select(`Type of currency`, REF_DATE, VALUE) %>%
  tidyr::pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2025-12` - `2024-12`) / `2024-12` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 33-10-0163](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3310016301)
**Survey:** Bank of Canada
**Reference period:** December 2025

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "exchange-rates-december-2025", "en"));
```
