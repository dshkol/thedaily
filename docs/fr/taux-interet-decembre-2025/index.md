---
title: Le taux directeur de la Banque du Canada à 2,25 % en décembre 2025, en baisse de 275 points de base par rapport au sommet
---

# Le taux directeur de la Banque du Canada à 2,25 % en décembre 2025, en baisse de 275 points de base par rapport au sommet

<p class="release-date">Diffusion : 2026-01-07</p>

<div class="metric-box">
  <div class="value">2,25 %</div>
  <div class="label">Taux directeur, décembre 2025</div>
</div>

Le taux directeur de la Banque du Canada s'établissait à 2,25 % en décembre 2025, inchangé depuis octobre. Cela représente une baisse significative de 275 points de base par rapport au taux de 5,00 % observé en juin 2024, reflétant le cycle d'assouplissement de la politique monétaire de la banque centrale qui a débuté à la mi-2024.

<div class="highlights">

**Faits saillants**

- Le taux directeur de la Banque du Canada est demeuré à 2,25 % en décembre 2025
- Le taux directeur a diminué de 275 points de base par rapport au sommet de 5,00 % atteint en juin 2024
- Les rendements des obligations du gouvernement du Canada à 2 ans ont chuté à 2,58 %, en baisse de 45 points de base par rapport à décembre 2024
- Le rendement de référence à 10 ans s'établissait à 3,41 % en décembre 2025

</div>

## Tendance du taux directeur

La Banque du Canada a commencé à abaisser son taux directeur en juin 2024, le faisant passer du sommet de 5,00 % à 2,25 % en octobre 2025, où il est demeuré. Les baisses de taux se sont accélérées à la fin de 2024 et au début de 2025.

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
  title: "Taux directeur de la Banque du Canada (%)",
  width: 640,
  height: 280,
  y: {domain: [2, 6], grid: true, label: "Taux (%)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([2.25, 3, 4, 5], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.areaY(bankRateData, {x: "date", y: "rate", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(bankRateData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(bankRateData, {x: "date", y: "rate", fill: "#AF3C43", r: 3})
  ]
}));
```

## Rendements des obligations gouvernementales

Les rendements des obligations de référence du gouvernement du Canada ont baissé pour la plupart des échéances en 2025. Le rendement à 2 ans est passé de 3,03 % en décembre 2024 à 2,58 % en décembre 2025, tandis que les rendements à long terme ont affiché des baisses plus modestes.

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
  title: "Rendements des obligations de référence du gouvernement du Canada (%)",
  width: 640,
  height: 300,
  y: {domain: [2, 5], grid: true, label: "Rendement (%)"},
  x: {type: "utc", label: null},
  color: {legend: true, domain: ["2 ans", "5 ans", "10 ans"]},
  marks: [
    Plot.lineY(bondYieldData, {x: "date", y: "y2", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.lineY(bondYieldData, {x: "date", y: "y5", stroke: "#1f77b4", strokeWidth: 2}),
    Plot.lineY(bondYieldData, {x: "date", y: "y10", stroke: "#2ca02c", strokeWidth: 2}),
    Plot.dot(bondYieldData, {x: "date", y: "y2", fill: "#AF3C43", r: 3}),
    Plot.dot(bondYieldData, {x: "date", y: "y5", fill: "#1f77b4", r: 3}),
    Plot.dot(bondYieldData, {x: "date", y: "y10", fill: "#2ca02c", r: 3}),
    Plot.text([{x: new Date("2025-12"), y: 2.58, label: "2 ans"}], {x: "x", y: "y", text: "label", dx: 30, fill: "#AF3C43"}),
    Plot.text([{x: new Date("2025-12"), y: 2.95, label: "5 ans"}], {x: "x", y: "y", text: "label", dx: 30, fill: "#1f77b4"}),
    Plot.text([{x: new Date("2025-12"), y: 3.41, label: "10 ans"}], {x: "x", y: "y", text: "label", dx: 35, fill: "#2ca02c"})
  ]
}));
```

## Taux clés, décembre 2025

| Taux | Décembre 2025 | Décembre 2024 | Variation |
|------|--------------|---------------|-----------|
| Taux directeur | 2,25 % | 3,25 % | -1,00 pp |
| Rendement à 2 ans | 2,58 % | 3,03 % | -0,45 pp |
| Rendement à 5 ans | 2,95 % | 3,05 % | -0,10 pp |
| Rendement à 10 ans | 3,41 % | 3,31 % | +0,10 pp |
| Bon du Trésor 3 mois | 2,19 % | 3,53 % | -1,34 pp |

## Rendements des bons du Trésor

Les rendements des bons du Trésor à court terme ont considérablement diminué, en ligne avec les baisses de taux de la Banque du Canada. Le rendement des bons du Trésor à 3 mois s'établissait à 2,19 % en décembre 2025, en baisse par rapport à environ 3,53 % un an plus tôt.

| Échéance du bon du Trésor | Rendement décembre 2025 |
|--------------------------|------------------------|
| 1 mois | 2,09 % |
| 2 mois | 2,16 % |
| 3 mois | 2,15 % |
| 6 mois | 2,24 % |
| 1 an | 2,38 % |

<div class="note-to-readers">

## Note aux lecteurs

Les statistiques des marchés financiers comprennent une variété de taux d'intérêt sur les titres gouvernementaux, les bons du Trésor et d'autres instruments financiers. Le taux directeur de la Banque du Canada est un indicateur clé de l'orientation de la politique monétaire et influence les coûts d'emprunt dans l'ensemble de l'économie.

Les rendements obligataires représentent le rendement que les investisseurs reçoivent pour détenir des titres de créance gouvernementaux jusqu'à l'échéance. Les courbes de rendement ont généralement une pente ascendante, les obligations à long terme offrant des rendements plus élevés que les titres à court terme pour compenser le risque supplémentaire de détenir des titres pendant de plus longues périodes.

</div>

<details>
<summary>Reproductibilité : Code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Télécharger les statistiques des marchés financiers
taux <- get_cansim("10-10-0122")

# Série chronologique du taux directeur
taux_directeur <- taux %>%
  filter(Rates == "Bank rate") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Taux directeur de décembre 2025
taux_dec2025 <- taux_directeur %>% filter(REF_DATE == "2025-12") %>% pull(VALUE)

# Rendements des obligations gouvernementales
rendements_obligations <- taux %>%
  filter(grepl("Selected Government of Canada benchmark bond yields", Rates)) %>%
  filter(REF_DATE >= "2024-01") %>%
  select(REF_DATE, Rates, VALUE) %>%
  tidyr::pivot_wider(names_from = Rates, values_from = VALUE)

# Rendements des bons du Trésor
bons_tresor <- taux %>%
  filter(grepl("Treasury bills:", Rates)) %>%
  filter(REF_DATE == "2025-12") %>%
  select(Rates, VALUE)
```

</details>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 10-10-0122](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1010012201)
**Enquête :** Banque du Canada
**Période de référence :** Décembre 2025

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "taux-interet-decembre-2025", "fr"));
```
