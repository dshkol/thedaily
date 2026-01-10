---
title: Les stocks de volaille congelée en baisse de 9,5 % sur un an en décembre 2025
verification_json: output/data_23_10_0253_enhanced.json
---

# Les stocks de volaille congelée en baisse de 9,5 % sur un an en décembre 2025

<p class="release-date">Diffusion : 2026-01-07</p>

<div class="metric-box">
  <div class="value">82 810</div>
  <div class="label">tonnes, décembre 2025</div>
</div>

Les stocks totaux de viande de volaille congelée au Canada ont chuté à 82 810 tonnes en décembre 2025, en baisse de 9,5 % par rapport aux 91 542 tonnes enregistrées en décembre 2024. Sur une base mensuelle, les stocks ont diminué de 8,1 % par rapport aux 90 102 tonnes de novembre 2025, principalement en raison de l'écoulement des stocks de dinde après la période des Fêtes.

<div class="highlights">

**Faits saillants**

- Les stocks totaux de volaille congelée ont chuté à 82 810 tonnes en décembre 2025
- Baisse de 9,5 % sur un an par rapport à décembre 2024
- Les stocks de dinde ont diminué de 44,8 % par rapport au mois précédent, passant à 13 237 tonnes, la demande des Fêtes ayant épuisé les inventaires
- Le poulet demeure la catégorie dominante avec 62 393 tonnes (75 % du total)

</div>

## Tendance mensuelle

Les stocks de volaille congelée fluctuent généralement de façon saisonnière, augmentant avant la période des Fêtes et diminuant par la suite. Le niveau de décembre 2025 représente le point le plus bas depuis avril 2025.

```js
import * as Plot from "npm:@observablehq/plot";

const stocksData = [
  {date: new Date("2024-01"), value: 96379},
  {date: new Date("2024-02"), value: 94578},
  {date: new Date("2024-03"), value: 95295},
  {date: new Date("2024-04"), value: 95492},
  {date: new Date("2024-05"), value: 99589},
  {date: new Date("2024-06"), value: 101557},
  {date: new Date("2024-07"), value: 100460},
  {date: new Date("2024-08"), value: 100363},
  {date: new Date("2024-09"), value: 101740},
  {date: new Date("2024-10"), value: 99755},
  {date: new Date("2024-11"), value: 97496},
  {date: new Date("2024-12"), value: 91542},
  {date: new Date("2025-01"), value: 83706},
  {date: new Date("2025-02"), value: 87839},
  {date: new Date("2025-03"), value: 83253},
  {date: new Date("2025-04"), value: 82120},
  {date: new Date("2025-05"), value: 80894},
  {date: new Date("2025-06"), value: 85748},
  {date: new Date("2025-07"), value: 87611},
  {date: new Date("2025-08"), value: 91505},
  {date: new Date("2025-09"), value: 97568},
  {date: new Date("2025-10"), value: 87285},
  {date: new Date("2025-11"), value: 90102},
  {date: new Date("2025-12"), value: 82810}
];

display(Plot.plot({
  title: "Stocks de viande de volaille congelée (tonnes)",
  width: 640,
  height: 280,
  y: {domain: [75000, 110000], grid: true, label: "Tonnes"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([80000, 90000, 100000], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.areaY(stocksData, {x: "date", y: "value", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(stocksData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(stocksData, {x: "date", y: "value", fill: "#AF3C43", r: 3})
  ]
}));
```

## Stocks par type de volaille

Les produits de poulet représentent la majorité des stocks de volaille congelée. Les stocks de dinde ont affiché une forte baisse en décembre, chutant de 44,8 % par rapport à novembre, les détaillants et distributeurs ayant épuisé les inventaires constitués pour la période des Fêtes.

```js
const byType = [
  {type: "Poulet (transformé)", value: 61132},
  {type: "Découpes de poulet", value: 25903},
  {type: "Dinde", value: 13237},
  {type: "Autres volailles", value: 6538}
];

display(Plot.plot({
  title: "Stocks de volaille congelée par type, décembre 2025 (tonnes)",
  width: 640,
  height: 200,
  marginLeft: 140,
  x: {grid: true, label: "Tonnes"},
  y: {label: null},
  marks: [
    Plot.barX(byType, {
      y: "type",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(byType, {
      y: "type",
      x: "value",
      text: d => d.value.toLocaleString("fr-CA"),
      dx: 25,
      fill: "currentColor"
    })
  ]
}));
```

## Tendance saisonnière des stocks de dinde

Les stocks de dinde suivent un profil saisonnier prononcé, s'accumulant à l'automne pour répondre à la demande de l'Action de grâce et de Noël, puis diminuant fortement en décembre et janvier.

```js
const turkeyData = [
  {date: new Date("2024-01"), value: 21456},
  {date: new Date("2024-02"), value: 19892},
  {date: new Date("2024-03"), value: 19547},
  {date: new Date("2024-04"), value: 17994},
  {date: new Date("2024-05"), value: 18738},
  {date: new Date("2024-06"), value: 19802},
  {date: new Date("2024-07"), value: 20584},
  {date: new Date("2024-08"), value: 22106},
  {date: new Date("2024-09"), value: 26583},
  {date: new Date("2024-10"), value: 26754},
  {date: new Date("2024-11"), value: 24186},
  {date: new Date("2024-12"), value: 19234},
  {date: new Date("2025-01"), value: 18880},
  {date: new Date("2025-02"), value: 20730},
  {date: new Date("2025-03"), value: 19515},
  {date: new Date("2025-04"), value: 18747},
  {date: new Date("2025-05"), value: 18603},
  {date: new Date("2025-06"), value: 20380},
  {date: new Date("2025-07"), value: 21705},
  {date: new Date("2025-08"), value: 24549},
  {date: new Date("2025-09"), value: 28436},
  {date: new Date("2025-10"), value: 21442},
  {date: new Date("2025-11"), value: 23992},
  {date: new Date("2025-12"), value: 13237}
];

display(Plot.plot({
  title: "Stocks de dinde congelée (tonnes)",
  width: 640,
  height: 260,
  y: {domain: [10000, 30000], grid: true, label: "Tonnes"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([15000, 20000, 25000], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.areaY(turkeyData, {x: "date", y: "value", fill: "#2e7d32", fillOpacity: 0.1}),
    Plot.lineY(turkeyData, {x: "date", y: "value", stroke: "#2e7d32", strokeWidth: 2}),
    Plot.dot(turkeyData, {x: "date", y: "value", fill: "#2e7d32", r: 3})
  ]
}));
```

## Décembre 2025 par catégorie

| Catégorie | Tonnes | Part |
|-----------|--------|------|
| Poulet (transformé) | 61 132 | 73,8 % |
| Découpes de poulet | 25 903 | 31,3 % |
| Dinde | 13 237 | 16,0 % |
| Canards | 2 084 | 2,5 % |
| Autres volailles | 4 280 | 5,2 % |

*Remarque : Certains produits de poulet sont comptés dans plusieurs catégories; les pourcentages dépassent 100 %*

<div class="note-to-readers">

## Note aux lecteurs

Les stocks de viande de volaille congelée désignent la quantité de poulet, dinde, canard, oie et autres produits de volaille congelés entreposés dans les installations d'entreposage frigorifique au Canada. Ces données sont recueillies mensuellement auprès des établissements de transformation, d'entreposage ou de distribution de produits de volaille congelés.

Les stocks augmentent généralement dans les mois précédant les grandes fêtes (Action de grâce en octobre et Noël en décembre) alors que les producteurs et distributeurs constituent des inventaires pour répondre à la demande anticipée. Les baisses post-fêtes reflètent la consommation de ces inventaires accumulés.

</div>

<details>
<summary>Reproductibilité : Code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Télécharger les données sur les stocks de volaille congelée
volaille <- get_cansim("32-10-0122")

# Filtrer pour les totaux canadiens
stocks_canada <- volaille %>%
  filter(GEO == "Canada")

# Total de toutes les volailles - historique
total_hist <- stocks_canada %>%
  filter(Commodity == "All poultry meat, total") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Ventilation de décembre 2025
ventilation_dec <- stocks_canada %>%
  filter(REF_DATE == "2025-12") %>%
  select(Commodity, VALUE) %>%
  arrange(desc(VALUE))

# Variation sur un an
dec_2025 <- total_hist %>% filter(REF_DATE == "2025-12") %>% pull(VALUE)
dec_2024 <- total_hist %>% filter(REF_DATE == "2024-12") %>% pull(VALUE)
var_annuelle <- (dec_2025 - dec_2024) / dec_2024 * 100

# Stocks de dinde
dinde <- stocks_canada %>%
  filter(Commodity == "Turkeys, total") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))
```

</details>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 32-10-0122](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=3210012201)
**Enquête :** Enquête sur les stocks de viande de volaille congelée
**Période de référence :** Décembre 2025

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "stocks-volaille-congelee-decembre-2025", "fr"));
```
