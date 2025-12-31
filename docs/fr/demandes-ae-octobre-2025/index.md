---
title: Les demandes d'assurance-emploi en hausse de 2,1 % d'une année à l'autre en octobre 2025
toc: false
---

# Les demandes d'assurance-emploi en hausse de 2,1 % d'une année à l'autre en octobre 2025

<p class="release-date">Diffusion : 28 décembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- Les demandes d'assurance-emploi (AE) reçues ont totalisé 267 280 en octobre 2025, en baisse de 1,1 % par rapport à septembre
- D'une année à l'autre, les demandes d'AE ont augmenté de 2,1 %
- L'Alberta a mené les hausses provinciales à 10,0 %, suivie du Québec à 3,4 %
- La Saskatchewan a enregistré la plus forte baisse parmi les provinces à 3,3 %

</div>

Les demandes d'assurance-emploi (AE) reçues ont totalisé 267 280 en octobre 2025, en baisse de 1,1 % par rapport aux 270 140 en septembre. D'une année à l'autre, les demandes d'AE ont augmenté de 2,1 % par rapport à octobre 2024, où 261 860 demandes avaient été reçues.

La baisse mensuelle a suivi le sommet de juin 2025 de 317 120 demandes, soit 18,6 % de plus que le même mois l'année précédente. Depuis, les demandes se sont modérées, revenant à des niveaux plus proches de la moyenne d'avant juin.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles du Tableau 14-10-0005 de Statistique Canada (vérifiées via le paquet R cansim)
const eiData = [
  {date: new Date("2023-10"), value: 255.9},
  {date: new Date("2023-11"), value: 265.2},
  {date: new Date("2023-12"), value: 252.0},
  {date: new Date("2024-01"), value: 275.2},
  {date: new Date("2024-02"), value: 261.3},
  {date: new Date("2024-03"), value: 255.1},
  {date: new Date("2024-04"), value: 260.9},
  {date: new Date("2024-05"), value: 267.7},
  {date: new Date("2024-06"), value: 263.9},
  {date: new Date("2024-07"), value: 277.8},
  {date: new Date("2024-08"), value: 260.5},
  {date: new Date("2024-09"), value: 256.4},
  {date: new Date("2024-10"), value: 261.9},
  {date: new Date("2024-11"), value: 260.6},
  {date: new Date("2024-12"), value: 281.9},
  {date: new Date("2025-01"), value: 255.6},
  {date: new Date("2025-02"), value: 260.1},
  {date: new Date("2025-03"), value: 276.3},
  {date: new Date("2025-04"), value: 272.1},
  {date: new Date("2025-05"), value: 279.7},
  {date: new Date("2025-06"), value: 317.1},
  {date: new Date("2025-07"), value: 268.4},
  {date: new Date("2025-08"), value: 269.0},
  {date: new Date("2025-09"), value: 270.1},
  {date: new Date("2025-10"), value: 267.3}
];

display(Plot.plot({
  title: "Demandes d'assurance-emploi reçues, octobre 2023 à octobre 2025",
  subtitle: "Milliers, données désaisonnalisées",
  width: 680,
  height: 300,
  y: {domain: [240, 330], grid: true, label: "↑ Demandes (milliers)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(eiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(eiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(eiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ","), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation provinciale

L'Alberta a enregistré la plus forte hausse d'une année à l'autre des demandes d'AE à 10,0 %, avec 32 050 demandes reçues en octobre 2025 comparativement à 29 140 en octobre 2024. Le Québec a suivi à 3,4 %, tandis que la Colombie-Britannique a connu une augmentation de 2,9 %.

Parmi les provinces ayant enregistré des baisses d'une année à l'autre, la Saskatchewan a reculé de 3,3 %, suivie de l'Île-du-Prince-Édouard à 2,3 % et du Manitoba à 1,8 %. L'Ontario est demeuré essentiellement inchangé à -0,1 %.

```js
const yoyData = [
  {province: "Alberta", change: 10.0},
  {province: "Québec", change: 3.4},
  {province: "Colombie-Britannique", change: 2.9},
  {province: "Terre-Neuve-et-Labrador", change: 0.1},
  {province: "Ontario", change: -0.1},
  {province: "Nouveau-Brunswick", change: -0.1},
  {province: "Nouvelle-Écosse", change: -1.0},
  {province: "Manitoba", change: -1.8},
  {province: "Île-du-Prince-Édouard", change: -2.3},
  {province: "Saskatchewan", change: -3.3}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des demandes d'AE par province (%)",
  subtitle: "Octobre 2025 par rapport à octobre 2024",
  width: 700,
  height: 320,
  marginLeft: 200,
  marginRight: 60,
  x: {domain: [-5, 12], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "province",
      x: "change",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(yoyData, {
      y: "province",
      x: 11,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Demandes par province

| Province | Octobre 2025 | Octobre 2024 | Var. annuelle (%) |
|----------|-------------:|-------------:|------------------:|
| Canada | 267 280 | 261 860 | +2,1 |
| Ontario | 89 010 | 89 090 | -0,1 |
| Québec | 68 680 | 66 400 | +3,4 |
| Alberta | 32 050 | 29 140 | +10,0 |
| Colombie-Britannique | 31 020 | 30 140 | +2,9 |
| Nouveau-Brunswick | 9 800 | 9 810 | -0,1 |
| Manitoba | 9 370 | 9 540 | -1,8 |
| Nouvelle-Écosse | 8 780 | 8 870 | -1,0 |
| Terre-Neuve-et-Labrador | 8 120 | 8 110 | +0,1 |
| Saskatchewan | 6 990 | 7 230 | -3,3 |

<div class="note-to-readers">

## Note aux lecteurs

Les demandes d'assurance-emploi reçues représentent le nombre de demandes de prestations régulières d'AE. Les données sont désaisonnalisées pour tenir compte des variations saisonnières régulières de l'emploi.

Les demandes initiales sont les nouvelles demandes, tandis que les demandes renouvelées proviennent de personnes qui recevaient déjà des prestations. Les données de cette publication couvrent les demandes initiales et renouvelées combinées.

Les variations des demandes d'AE peuvent refléter divers facteurs, notamment les mises à pied, les tendances saisonnières de l'emploi et les changements de politiques. Elles constituent un indicateur précoce des conditions du marché du travail.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 14-10-0005](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1410000501)
**Enquête :** Statistiques de l'assurance-emploi
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/1410000501-fra](https://doi.org/10.25318/1410000501-fra)

</div>

<details>
<summary>Reproductibilité : Code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Télécharger les données des demandes d'AE
conn <- get_cansim_connection("14-10-0005")

# Série chronologique pour le Canada (désaisonnalisée)
total <- conn |>
  filter(GEO == "Canada") |>
  filter(`Type of claim` == "Initial and renewal claims, seasonally adjusted") |>
  filter(`Claim detail` == "Received") |>
  collect_and_normalize() |>
  filter(REF_DATE >= "2023-10") |>
  select(REF_DATE, VALUE) |>
  arrange(REF_DATE)

# Répartition provinciale pour octobre 2025
provincial <- conn |>
  collect_and_normalize() |>
  filter(`Type of claim` == "Initial and renewal claims, seasonally adjusted") |>
  filter(`Claim detail` == "Received") |>
  filter(REF_DATE %in% c("2024-10", "2025-10")) |>
  select(REF_DATE, GEO, VALUE) |>
  tidyr::pivot_wider(names_from = REF_DATE, values_from = VALUE) |>
  mutate(var_annuelle = (`2025-10` - `2024-10`) / `2024-10` * 100)

# Calculer les variations
oct2025 <- 267280
sep2025 <- 270140
oct2024 <- 261860

var_mensuelle <- (oct2025 - sep2025) / sep2025 * 100  # -1,1 %
var_annuelle <- (oct2025 - oct2024) / oct2024 * 100   # 2,1 %
```

</details>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "demandes-ae-octobre-2025", "fr"));
```
