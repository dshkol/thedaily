---
title: Household credit up 4.5% year over year in October 2025
verification_json: output/data_36_10_0639_enhanced.json
toc: false
---
# Household credit up 4.5% year over year in October 2025

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Total household credit liabilities reached $3.2 trillion in October 2025, up 4.5% year over year
- Mortgage debt accounted for 74.7% of total household credit, rising 4.8% from a year earlier
- Non-mortgage credit grew 3.8% year over year, reaching $807.3 billion
- Credit card balances rose 3.8% while auto loans increased 1.0% year over year
- Household credit has increased 29.7% over the past five years

</div>

Total household credit liabilities stood at $3,196.2 billion in October 2025, up 4.5% compared with the same month a year earlier. On a monthly basis, household credit increased 0.4% from September 2025.

The year-over-year growth rate of 4.5% was marginally lower than the 4.6% recorded in September, though it remained elevated compared with the 3.5% to 4.0% range observed through most of 2023 and early 2024.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 36-10-0639
const creditData = [
  {date: new Date("2022-11"), value: 2844600},
  {date: new Date("2022-12"), value: 2851266},
  {date: new Date("2023-01"), value: 2857472},
  {date: new Date("2023-02"), value: 2865330},
  {date: new Date("2023-03"), value: 2872325},
  {date: new Date("2023-04"), value: 2881997},
  {date: new Date("2023-05"), value: 2892052},
  {date: new Date("2023-06"), value: 2899507},
  {date: new Date("2023-07"), value: 2909464},
  {date: new Date("2023-08"), value: 2919393},
  {date: new Date("2023-09"), value: 2927265},
  {date: new Date("2023-10"), value: 2936552},
  {date: new Date("2023-11"), value: 2945689},
  {date: new Date("2023-12"), value: 2954074},
  {date: new Date("2024-01"), value: 2962347},
  {date: new Date("2024-02"), value: 2972701},
  {date: new Date("2024-03"), value: 2978688},
  {date: new Date("2024-04"), value: 2989278},
  {date: new Date("2024-05"), value: 2997656},
  {date: new Date("2024-06"), value: 3007111},
  {date: new Date("2024-07"), value: 3019472},
  {date: new Date("2024-08"), value: 3030663},
  {date: new Date("2024-09"), value: 3043684},
  {date: new Date("2024-10"), value: 3057598},
  {date: new Date("2024-11"), value: 3070687},
  {date: new Date("2024-12"), value: 3085072},
  {date: new Date("2025-01"), value: 3093948},
  {date: new Date("2025-02"), value: 3104648},
  {date: new Date("2025-03"), value: 3116469},
  {date: new Date("2025-04"), value: 3127749},
  {date: new Date("2025-05"), value: 3135920},
  {date: new Date("2025-06"), value: 3148601},
  {date: new Date("2025-07"), value: 3155593},
  {date: new Date("2025-08"), value: 3168322},
  {date: new Date("2025-09"), value: 3182185},
  {date: new Date("2025-10"), value: 3196170}
];

display(Plot.plot({
  title: "Total household credit liabilities, November 2022 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [2800000, 3300000], grid: true, label: "Millions $", tickFormat: d => (d/1000000).toFixed(1) + "T"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(creditData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(creditData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(creditData.slice(-1), {x: "date", y: "value", text: d => "$" + (d.value/1000000).toFixed(2) + "T", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Mortgage vs. non-mortgage debt

Mortgage loans represented 74.7% of total household credit liabilities in October 2025, totalling $2,388.9 billion. This represented a 4.8% increase from October 2024.

Non-mortgage credit, which includes consumer loans and lines of credit, reached $807.3 billion, up 3.8% year over year. Non-mortgage credit growth has been slower than mortgage credit growth in recent months.

```js
// Real data from Statistics Canada Table 36-10-0639
const compositionData = [
  {date: new Date("2022-11"), mortgage: 2119149, nonMortgage: 725452},
  {date: new Date("2023-02"), mortgage: 2136550, nonMortgage: 728780},
  {date: new Date("2023-05"), mortgage: 2155545, nonMortgage: 736508},
  {date: new Date("2023-08"), mortgage: 2179361, nonMortgage: 740033},
  {date: new Date("2023-11"), mortgage: 2199709, nonMortgage: 745980},
  {date: new Date("2024-02"), mortgage: 2215413, nonMortgage: 757288},
  {date: new Date("2024-05"), mortgage: 2235556, nonMortgage: 762101},
  {date: new Date("2024-08"), mortgage: 2259570, nonMortgage: 771093},
  {date: new Date("2024-11"), mortgage: 2290441, nonMortgage: 780245},
  {date: new Date("2025-02"), mortgage: 2317477, nonMortgage: 787171},
  {date: new Date("2025-05"), mortgage: 2343238, nonMortgage: 792682},
  {date: new Date("2025-08"), mortgage: 2367218, nonMortgage: 801104},
  {date: new Date("2025-10"), mortgage: 2388867, nonMortgage: 807302}
];

const stackData = compositionData.flatMap(d => [
  {date: d.date, type: "Mortgage loans", value: d.mortgage},
  {date: d.date, type: "Non-mortgage credit", value: d.nonMortgage}
]);

display(Plot.plot({
  title: "Household credit by type, November 2022 to October 2025",
  width: 680,
  height: 320,
  y: {grid: true, label: "Millions $", tickFormat: d => (d/1000000).toFixed(1) + "T"},
  x: {type: "utc", label: null},
  color: {
    domain: ["Mortgage loans", "Non-mortgage credit"],
    range: ["#AF3C43", "#E57373"],
    legend: true
  },
  marks: [
    Plot.areaY(stackData, Plot.stackY({
      x: "date",
      y: "value",
      fill: "type",
      order: ["Mortgage loans", "Non-mortgage credit"]
    })),
    Plot.ruleY([0])
  ]
}));
```

| Credit type | Value ($ billions) | Share | YoY change |
|------------|-------------------|-------|------------|
| Mortgage loans | 2,388.9 | 74.7% | +4.8% |
| Non-mortgage credit | 807.3 | 25.3% | +3.8% |
| **Total** | **3,196.2** | **100%** | **+4.5%** |

## Consumer credit components

Within non-mortgage credit, lines of credit represented the largest component at $246.6 billion, followed by personal loans at $128.2 billion.

Credit card balances rose 3.8% year over year to $113.9 billion. Auto loans, at $109.3 billion, grew more slowly at 1.0% year over year.

```js
// Real data from Statistics Canada Table 36-10-0639
const consumerComponents = [
  {category: "Lines of credit", value: 246.6, yoy: 3.75},
  {category: "Personal loans", value: 128.2, yoy: 1.27},
  {category: "Credit cards", value: 113.9, yoy: 3.79},
  {category: "Auto loans", value: 109.3, yoy: 1.01}
];

display(Plot.plot({
  title: "Consumer credit components, October 2025 ($ billions)",
  width: 640,
  height: 280,
  marginLeft: 120,
  marginRight: 60,
  x: {domain: [0, 280], grid: true, label: "Billions $"},
  y: {label: null},
  marks: [
    Plot.barX(consumerComponents, {
      y: "category",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(consumerComponents, {
      y: "category",
      x: 270,
      text: d => "$" + d.value.toFixed(1) + "B (+" + d.yoy.toFixed(1) + "%)",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

| Component | Value ($ billions) | Year-over-year change |
|-----------|-------------------|----------------------|
| Lines of credit | 246.6 | +3.8% |
| Personal loans | 128.2 | +1.3% |
| Credit cards | 113.9 | +3.8% |
| Auto loans | 109.3 | +1.0% |

## Mortgage debt composition

Residential mortgages made up the vast majority of mortgage debt at $2,379.7 billion, rising 4.9% year over year. Non-residential mortgages, at $9.1 billion, declined 10.6% from October 2024.

The residential mortgage market continued to drive the bulk of household credit growth, consistent with elevated housing prices and ongoing mortgage activity.

## Long-term growth in household credit

Over the past three decades, household credit liabilities have grown substantially. In October 1995, total household credit stood at $488.5 billion. By October 2025, this had increased more than six-fold to $3,196.2 billion.

```js
// Real data from Statistics Canada Table 36-10-0639 (October values each year)
const historicalData = [
  {year: 1990, value: 376213},
  {year: 1995, value: 488526},
  {year: 2000, value: 663752},
  {year: 2005, value: 998902},
  {year: 2010, value: 1549693},
  {year: 2015, value: 1973397},
  {year: 2020, value: 2464577},
  {year: 2025, value: 3196170}
];

display(Plot.plot({
  title: "Total household credit liabilities, 1990 to 2025 (October values)",
  width: 680,
  height: 320,
  y: {domain: [0, 3500000], grid: true, label: "Millions $", tickFormat: d => "$" + (d/1000000).toFixed(1) + "T"},
  x: {label: null, tickFormat: d => d.toString()},
  marks: [
    Plot.line(historicalData, {x: "year", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(historicalData, {x: "year", y: "value", fill: "#AF3C43", r: 4}),
    Plot.text(historicalData.filter(d => d.year === 2025), {
      x: "year",
      y: "value",
      text: d => "$" + (d.value/1000000).toFixed(2) + "T",
      dy: -12,
      fill: "#AF3C43",
      fontWeight: 600
    })
  ]
}));
```

| Period | Total credit ($ billions) | Growth since previous |
|--------|--------------------------|----------------------|
| October 1995 | 488.5 | -- |
| October 2000 | 663.8 | +35.9% |
| October 2005 | 998.9 | +50.5% |
| October 2010 | 1,549.7 | +55.1% |
| October 2015 | 1,973.4 | +27.3% |
| October 2020 | 2,464.6 | +24.9% |
| October 2025 | 3,196.2 | +29.7% |

Over the past five years (October 2020 to October 2025), household credit has increased by 29.7%, or approximately $731.6 billion.

<div class="note-to-readers">

## Note to readers

This article uses seasonally adjusted data from the monthly credit aggregates. Credit liabilities of households include both mortgage and non-mortgage loans from chartered banks, non-bank financial corporations, government, and other lenders.

Residential mortgages include loans secured by residential properties. Non-mortgage loans include personal loans, credit cards, lines of credit, and auto loans.

For more information on the concepts, methodologies, and classifications used, see the [Guide to the Monthly Credit Aggregates](https://www150.statcan.gc.ca/n1/en/catalogue/13-605-X202000100004).

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch household credit data
credit <- get_cansim("36-10-0668")

# Total household credit
total_credit <- credit %>%
  filter(`Type of credit` == "Total household credit") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 36-10-0639](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3610063901)
**Survey:** Monthly Credit Aggregates
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/3610063901-eng](https://doi.org/10.25318/3610063901-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "household-credit-october-2025", "en"));
```
