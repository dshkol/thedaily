---
title: Bank of Canada policy rate at 2.25% in December 2025, down 275 basis points from peak
verification_json: output/data_10_10_0164_enhanced.json
---
# Bank of Canada policy rate at 2.25% in December 2025, down 275 basis points from peak

<p class="release-date">Released: 2026-01-07</p>

<div class="metric-box">
  <div class="value">2.25%</div>
  <div class="label">Policy rate, December 2025</div>
</div>

The Bank of Canada's policy rate stood at 2.25% in December 2025, unchanged from October. This marks a significant decline of 275 basis points from the 5.00% peak observed in June 2024, reflecting the central bank's monetary policy easing cycle that began in mid-2024.

<div class="highlights">

**Highlights**

- The Bank of Canada policy rate remained at 2.25% in December 2025
- The policy rate has declined 275 basis points from the June 2024 peak of 5.00%
- Government of Canada 2-year bond yields fell to 2.58%, down 45 basis points from December 2024
- The 10-year benchmark yield stood at 3.41% in December 2025

</div>

## Policy rate trend

The Bank of Canada began lowering its policy rate in June 2024, reducing it from the peak of 5.00% to 2.25% by October 2025, where it has remained. The rate cuts accelerated in late 2024 and early 2025.

```js
import * as Plot from "npm:@observablehq/plot";

const bankRateData = [
  {date: new Date("2024-01"), rate: 5.00},
  {date: new Date("2024-02"), rate: 5.00},
  {date: new Date("2024-03"), rate: 5.00},
  {date: new Date("2024-04"), rate: 5.00},
  {date: new Date("2024-05"), rate: 5.00},
  {date: new Date("2024-06"), rate: 4.75},
  {date: new Date("2024-07"), rate: 4.50},
  {date: new Date("2024-08"), rate: 4.50},
  {date: new Date("2024-09"), rate: 4.25},
  {date: new Date("2024-10"), rate: 3.75},
  {date: new Date("2024-11"), rate: 3.75},
  {date: new Date("2024-12"), rate: 3.25},
  {date: new Date("2025-01"), rate: 3.00},
  {date: new Date("2025-02"), rate: 3.00},
  {date: new Date("2025-03"), rate: 2.75},
  {date: new Date("2025-04"), rate: 2.75},
  {date: new Date("2025-05"), rate: 2.75},
  {date: new Date("2025-06"), rate: 2.75},
  {date: new Date("2025-07"), rate: 2.50},
  {date: new Date("2025-08"), rate: 2.50},
  {date: new Date("2025-09"), rate: 2.25},
  {date: new Date("2025-10"), rate: 2.25},
  {date: new Date("2025-11"), rate: 2.25},
  {date: new Date("2025-12"), rate: 2.25}
];

display(Plot.plot({
  title: "Bank of Canada policy rate (%)",
  width: 640,
  height: 280,
  y: {domain: [2, 6], grid: true, label: "Rate (%)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([2.25, 3, 4, 5], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.areaY(bankRateData, {x: "date", y: "rate", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(bankRateData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(bankRateData, {x: "date", y: "rate", fill: "#AF3C43", r: 3})
  ]
}));
```

## Government bond yields

Government of Canada benchmark bond yields fell across most maturities in 2025. The 2-year yield declined from 3.03% in December 2024 to 2.58% in December 2025, while longer-term yields showed more modest declines.

```js
const bondYieldData = [
  {date: new Date("2024-01"), y2: 4.00, y5: 3.43, y10: 3.33},
  {date: new Date("2024-02"), y2: 4.19, y5: 3.60, y10: 3.45},
  {date: new Date("2024-03"), y2: 4.13, y5: 3.50, y10: 3.36},
  {date: new Date("2024-04"), y2: 4.27, y5: 3.82, y10: 3.76},
  {date: new Date("2024-05"), y2: 4.31, y5: 3.81, y10: 3.70},
  {date: new Date("2024-06"), y2: 4.04, y5: 3.51, y10: 3.40},
  {date: new Date("2024-07"), y2: 3.46, y5: 3.09, y10: 3.30},
  {date: new Date("2024-08"), y2: 3.27, y5: 2.97, y10: 3.13},
  {date: new Date("2024-09"), y2: 2.95, y5: 2.79, y10: 2.95},
  {date: new Date("2024-10"), y2: 3.09, y5: 3.05, y10: 3.27},
  {date: new Date("2024-11"), y2: 3.20, y5: 3.09, y10: 3.24},
  {date: new Date("2024-12"), y2: 3.03, y5: 3.05, y10: 3.31},
  {date: new Date("2025-01"), y2: 2.79, y5: 2.87, y10: 3.15},
  {date: new Date("2025-02"), y2: 2.65, y5: 2.70, y10: 3.02},
  {date: new Date("2025-03"), y2: 2.61, y5: 2.76, y10: 3.15},
  {date: new Date("2025-04"), y2: 2.47, y5: 2.67, y10: 3.11},
  {date: new Date("2025-05"), y2: 2.62, y5: 2.85, y10: 3.29},
  {date: new Date("2025-06"), y2: 2.65, y5: 2.90, y10: 3.24},
  {date: new Date("2025-07"), y2: 2.79, y5: 3.05, y10: 3.39},
  {date: new Date("2025-08"), y2: 2.69, y5: 2.95, y10: 3.28},
  {date: new Date("2025-09"), y2: 2.45, y5: 2.73, y10: 3.08},
  {date: new Date("2025-10"), y2: 2.43, y5: 2.73, y10: 3.21},
  {date: new Date("2025-11"), y2: 2.40, y5: 2.72, y10: 3.22},
  {date: new Date("2025-12"), y2: 2.58, y5: 2.95, y10: 3.41}
];

display(Plot.plot({
  title: "Government of Canada benchmark bond yields (%)",
  width: 640,
  height: 300,
  y: {domain: [2, 5], grid: true, label: "Yield (%)"},
  x: {type: "utc", label: null},
  color: {legend: true, domain: ["2-year", "5-year", "10-year"]},
  marks: [
    Plot.lineY(bondYieldData, {x: "date", y: "y2", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.lineY(bondYieldData, {x: "date", y: "y5", stroke: "#1f77b4", strokeWidth: 2}),
    Plot.lineY(bondYieldData, {x: "date", y: "y10", stroke: "#2ca02c", strokeWidth: 2}),
    Plot.dot(bondYieldData, {x: "date", y: "y2", fill: "#AF3C43", r: 3}),
    Plot.dot(bondYieldData, {x: "date", y: "y5", fill: "#1f77b4", r: 3}),
    Plot.dot(bondYieldData, {x: "date", y: "y10", fill: "#2ca02c", r: 3}),
    Plot.text([{x: new Date("2025-12"), y: 2.58, label: "2-year"}], {x: "x", y: "y", text: "label", dx: 35, fill: "#AF3C43"}),
    Plot.text([{x: new Date("2025-12"), y: 2.95, label: "5-year"}], {x: "x", y: "y", text: "label", dx: 35, fill: "#1f77b4"}),
    Plot.text([{x: new Date("2025-12"), y: 3.41, label: "10-year"}], {x: "x", y: "y", text: "label", dx: 40, fill: "#2ca02c"})
  ]
}));
```

## Key rates, December 2025

| Rate | December 2025 | December 2024 | Change |
|------|--------------|---------------|--------|
| Policy rate | 2.25% | 3.25% | -1.00 pp |
| 2-year bond yield | 2.58% | 3.03% | -0.45 pp |
| 5-year bond yield | 2.95% | 3.05% | -0.10 pp |
| 10-year bond yield | 3.41% | 3.31% | +0.10 pp |
| 3-month T-bill | 2.19% | 3.53% | -1.34 pp |

## Treasury bill yields

Short-term treasury bill yields have fallen substantially in line with the Bank of Canada's rate cuts. The 3-month treasury bill yield stood at 2.19% in December 2025, down from approximately 3.53% a year earlier.

| Treasury bill maturity | December 2025 yield |
|----------------------|-------------------|
| 1 month | 2.09% |
| 2 month | 2.16% |
| 3 month | 2.15% |
| 6 month | 2.24% |
| 1 year | 2.38% |

<div class="note-to-readers">

## Note to readers

Financial market statistics include a variety of interest rates on government securities, treasury bills, and other financial instruments. The Bank of Canada's policy interest rate is a key indicator of monetary policy stance and influences borrowing costs across the economy.

Bond yields represent the return investors receive for holding government debt securities to maturity. Yield curves typically slope upward, with longer-term bonds offering higher yields than shorter-term securities to compensate for the additional risk of holding debt for longer periods.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Download financial market statistics
rates <- get_cansim("10-10-0122")

# Bank rate time series
bank_rate <- rates %>%
  filter(Rates == "Bank rate") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# December 2025 bank rate
dec2025_rate <- bank_rate %>% filter(REF_DATE == "2025-12") %>% pull(VALUE)

# Government bond yields
bond_yields <- rates %>%
  filter(grepl("Selected Government of Canada benchmark bond yields", Rates)) %>%
  filter(REF_DATE >= "2024-01") %>%
  select(REF_DATE, Rates, VALUE) %>%
  tidyr::pivot_wider(names_from = Rates, values_from = VALUE)

# Treasury bill yields
tbills <- rates %>%
  filter(grepl("Treasury bills:", Rates)) %>%
  filter(REF_DATE == "2025-12") %>%
  select(Rates, VALUE)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 10-10-0122](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1010012201)
**Survey:** Bank of Canada
**Reference period:** December 2025

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "interest-rates-december-2025", "en"));
```
