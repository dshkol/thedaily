---
title: Le Canada affiche un déficit commercial de 583 millions de dollars en octobre 2025
verification_json: output/merchandise_trade.json
toc: false
---
# Le Canada affiche un déficit commercial de 583 millions de dollars en octobre 2025

<p class="release-date">Diffusion : 17 janvier 2026 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- Le Canada a enregistré un déficit commercial de marchandises de 583 millions de dollars en octobre 2025, inversant l'excédent de septembre
- Les exportations ont augmenté de 2,1 % pour atteindre 65,6 milliards de dollars, tandis que les importations ont progressé de 3,4 % pour s'établir à 66,2 milliards de dollars
- Les États-Unis ont représenté 67 % des exportations canadiennes de marchandises, soit 44,1 milliards de dollars
- D'une année à l'autre, les exportations et les importations ont toutes deux augmenté de 0,9 %

</div>

La balance commerciale de marchandises du Canada est passée à un déficit de 583 millions de dollars en octobre 2025, après un excédent de 243 millions de dollars en septembre. Ce renversement reflète une augmentation plus rapide des importations par rapport aux exportations au cours du mois.

Les exportations de marchandises ont totalisé 65,6 milliards de dollars en octobre, en hausse de 2,1 % par rapport aux 64,3 milliards de dollars de septembre. Les importations ont augmenté de 3,4 % pour atteindre 66,2 milliards de dollars, comparativement à 64,0 milliards de dollars le mois précédent. D'une année à l'autre, les exportations et les importations ont toutes deux progressé de 0,9 % par rapport à octobre 2024.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles de Statistique Canada, Tableau 12-10-0011
const exportsData = [
  {date: new Date("2023-11-01"), value: 65272.0},
  {date: new Date("2023-12-01"), value: 63178.6},
  {date: new Date("2024-01-01"), value: 61007.6},
  {date: new Date("2024-02-01"), value: 65145.2},
  {date: new Date("2024-03-01"), value: 63144.4},
  {date: new Date("2024-04-01"), value: 65302.2},
  {date: new Date("2024-05-01"), value: 63470.0},
  {date: new Date("2024-06-01"), value: 65848.7},
  {date: new Date("2024-07-01"), value: 65096.0},
  {date: new Date("2024-08-01"), value: 64124.5},
  {date: new Date("2024-09-01"), value: 63893.2},
  {date: new Date("2024-10-01"), value: 64989.5},
  {date: new Date("2024-11-01"), value: 66006.0},
  {date: new Date("2024-12-01"), value: 69585.3},
  {date: new Date("2025-01-01"), value: 72924.4},
  {date: new Date("2025-02-01"), value: 68813.3},
  {date: new Date("2025-03-01"), value: 67521.5},
  {date: new Date("2025-04-01"), value: 60099.1},
  {date: new Date("2025-05-01"), value: 61110.3},
  {date: new Date("2025-06-01"), value: 61522.1},
  {date: new Date("2025-07-01"), value: 62345.2},
  {date: new Date("2025-08-01"), value: 60252.5},
  {date: new Date("2025-09-01"), value: 64286.6},
  {date: new Date("2025-10-01"), value: 65606.7}
];

const importsData = [
  {date: new Date("2023-11-01"), value: 64682.3},
  {date: new Date("2023-12-01"), value: 64802.4},
  {date: new Date("2024-01-01"), value: 61988.9},
  {date: new Date("2024-02-01"), value: 64503.9},
  {date: new Date("2024-03-01"), value: 63954.5},
  {date: new Date("2024-04-01"), value: 66067.3},
  {date: new Date("2024-05-01"), value: 64923.0},
  {date: new Date("2024-06-01"), value: 66712.1},
  {date: new Date("2024-07-01"), value: 65449.0},
  {date: new Date("2024-08-01"), value: 65892.6},
  {date: new Date("2024-09-01"), value: 65243.6},
  {date: new Date("2024-10-01"), value: 65606.1},
  {date: new Date("2024-11-01"), value: 66617.1},
  {date: new Date("2024-12-01"), value: 67828.3},
  {date: new Date("2025-01-01"), value: 69212.0},
  {date: new Date("2025-02-01"), value: 69879.8},
  {date: new Date("2025-03-01"), value: 69408.7},
  {date: new Date("2025-04-01"), value: 67334.6},
  {date: new Date("2025-05-01"), value: 66803.0},
  {date: new Date("2025-06-01"), value: 67140.8},
  {date: new Date("2025-07-01"), value: 66243.7},
  {date: new Date("2025-08-01"), value: 66905.5},
  {date: new Date("2025-09-01"), value: 64044.1},
  {date: new Date("2025-10-01"), value: 66189.8}
];

display(Plot.plot({
  title: "Exportations et importations de marchandises, novembre 2023 à octobre 2025 (millions $)",
  width: 680,
  height: 300,
  y: {domain: [58000, 75000], grid: true, label: "Millions $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(exportsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.lineY(importsData, {x: "date", y: "value", stroke: "#666", strokeWidth: 2}),
    Plot.dot(exportsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.dot(importsData.slice(-1), {x: "date", y: "value", fill: "#666", r: 5}),
    Plot.text([{x: new Date("2025-10-01"), y: 65606.7, label: "Export."}], {x: "x", y: "y", text: "label", dy: -12, fill: "#AF3C43", fontWeight: 600}),
    Plot.text([{x: new Date("2025-10-01"), y: 66189.8, label: "Import."}], {x: "x", y: "y", text: "label", dy: 18, fill: "#666", fontWeight: 600})
  ]
}));
```

## La balance commerciale fluctue tout au long de 2025

Le déficit d'octobre a suivi plusieurs mois de volatilité de la balance commerciale en 2025. Le Canada a enregistré des excédents en janvier (3,7 milliards de dollars) et en septembre (243 millions de dollars), mais des déficits la plupart des autres mois, notamment un déficit important de 7,2 milliards de dollars en avril.

```js
const balanceData = [
  {date: new Date("2023-11-01"), value: 589.7},
  {date: new Date("2023-12-01"), value: -1623.8},
  {date: new Date("2024-01-01"), value: -981.3},
  {date: new Date("2024-02-01"), value: 641.3},
  {date: new Date("2024-03-01"), value: -810.1},
  {date: new Date("2024-04-01"), value: -765.1},
  {date: new Date("2024-05-01"), value: -1453.0},
  {date: new Date("2024-06-01"), value: -863.4},
  {date: new Date("2024-07-01"), value: -353.0},
  {date: new Date("2024-08-01"), value: -1768.1},
  {date: new Date("2024-09-01"), value: -1350.4},
  {date: new Date("2024-10-01"), value: -616.7},
  {date: new Date("2024-11-01"), value: -611.1},
  {date: new Date("2024-12-01"), value: 1757.0},
  {date: new Date("2025-01-01"), value: 3712.4},
  {date: new Date("2025-02-01"), value: -1066.5},
  {date: new Date("2025-03-01"), value: -1887.3},
  {date: new Date("2025-04-01"), value: -7235.5},
  {date: new Date("2025-05-01"), value: -5692.8},
  {date: new Date("2025-06-01"), value: -5618.7},
  {date: new Date("2025-07-01"), value: -3898.5},
  {date: new Date("2025-08-01"), value: -6653.0},
  {date: new Date("2025-09-01"), value: 242.5},
  {date: new Date("2025-10-01"), value: -583.1}
];

display(Plot.plot({
  title: "Balance commerciale de marchandises, novembre 2023 à octobre 2025 (millions $)",
  width: 680,
  height: 280,
  y: {grid: true, label: "Millions $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0], {stroke: "#333"}),
    Plot.barY(balanceData, {x: "date", y: "value", fill: d => d.value >= 0 ? "#AF3C43" : "#2e7d32"}),
    Plot.text(balanceData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(0).replace(".", ",") + " M$", dy: d => d.value >= 0 ? -12 : 12, fill: "#2e7d32", fontWeight: 600})
  ]
}));
```

## Les États-Unis dominent les exportations canadiennes

Les États-Unis sont demeurés de loin la principale destination des exportations canadiennes, recevant 44,1 milliards de dollars en exportations de marchandises en octobre 2025, soit 67 % des exportations totales du Canada. Le Royaume-Uni était la deuxième destination en importance avec 5,9 milliards de dollars (9 %), suivi de l'Union européenne avec 4,2 milliards de dollars (6 %) et de la Chine avec 3,3 milliards de dollars (5 %).

| Partenaire commercial | Exportations (millions $) | Part |
|---|---:|---:|
| États-Unis | 44 126 | 67,3 % |
| Royaume-Uni | 5 905 | 9,0 % |
| Union européenne | 4 206 | 6,4 % |
| Chine | 3 327 | 5,1 % |
| Pays-Bas | 1 298 | 2,0 % |
| Japon | 1 233 | 1,9 % |
| Mexique | 819 | 1,2 % |
| Autres pays | 4 693 | 7,2 % |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce international de marchandises sont compilées selon la balance des paiements, qui ajuste les données douanières pour la couverture, le calendrier et l'évaluation afin de se conformer aux concepts utilisés dans le Système de comptabilité nationale du Canada.

Les données sont désaisonnalisées pour tenir compte des tendances saisonnières régulières des flux commerciaux. Toutes les valeurs sont exprimées en dollars canadiens.

</div>

<details>
<summary>Reproductibilité : code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Fetch merchandise trade data
trade <- get_cansim("12-10-0011")

# Filter for Canada, seasonally adjusted, balance of payments, all countries
canada_trade <- trade %>%
  filter(GEO == "Canada",
         `Seasonal adjustment` == "Seasonally adjusted",
         Basis == "Balance of payments",
         `Principal trading partners` == "All countries")

# Get exports, imports, and balance
exports <- canada_trade %>% filter(Trade == "Export") %>% select(REF_DATE, VALUE)
imports <- canada_trade %>% filter(Trade == "Import") %>% select(REF_DATE, VALUE)
balance <- canada_trade %>% filter(Trade == "Trade Balance") %>% select(REF_DATE, VALUE)

# Calculate changes
current_exp <- exports %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
previous_exp <- exports %>% filter(REF_DATE == "2025-09") %>% pull(VALUE)
mom_change_exp <- (current_exp - previous_exp) / previous_exp * 100
```

</details>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 12-10-0011](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1210001101)
**Enquête :** Commerce international de marchandises
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/1210001101-fra](https://doi.org/10.25318/1210001101-fra)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-marchandises-octobre-2025", "fr"));
```
