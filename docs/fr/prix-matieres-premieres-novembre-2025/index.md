---
title: Les prix des matières premières en hausse de 6,4 % d'une année à l'autre en novembre 2025
toc: false
---

# Les prix des matières premières en hausse de 6,4 % d'une année à l'autre en novembre 2025

<p class="release-date">Diffusion : 28 décembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- L'Indice des prix des matières premières (IPMP) a augmenté de 0,3 % en novembre 2025, après une hausse de 1,6 % en octobre
- D'une année à l'autre, les prix des matières premières ont augmenté de 6,4 %
- Les minerais, concentrés et déchets de métaux ont mené la hausse annuelle à 34,7 %
- Les produits énergétiques bruts ont reculé de 15,2 % d'une année à l'autre, compensant partiellement les gains

</div>

L'Indice des prix des matières premières (IPMP) a augmenté de 0,3 % en novembre 2025, portant l'indice à 148,8 (2020=100). Cette hausse fait suite à une augmentation de 1,6 % en octobre. D'une année à l'autre, les prix des matières premières ont progressé de 6,4 % par rapport à novembre 2024.

À l'exclusion des produits énergétiques bruts, l'IPMP a augmenté de 19,0 % d'une année à l'autre, reflétant des gains importants dans les minerais métalliques et les produits non énergétiques. Sur une base mensuelle, l'indice excluant l'énergie brute a progressé de 0,6 %.

La hausse annuelle a été principalement attribuable aux minerais, concentrés et déchets de métaux, qui ont augmenté de 34,7 %. Les animaux et produits d'origine animale ont progressé de 9,9 %, tandis que les minéraux non métalliques ont augmenté de 9,5 %.

En partie compensés par ces gains, les produits énergétiques bruts ont reculé de 15,2 % d'une année à l'autre, le gaz naturel ayant diminué de 8,0 %.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles du Tableau 18-10-0268 de Statistique Canada (vérifiées via le paquet R cansim)
const rmpiData = [
  {date: new Date("2023-12"), value: 130.2},
  {date: new Date("2024-01"), value: 131.7},
  {date: new Date("2024-02"), value: 134.4},
  {date: new Date("2024-03"), value: 140.0},
  {date: new Date("2024-04"), value: 147.2},
  {date: new Date("2024-05"), value: 144.9},
  {date: new Date("2024-06"), value: 142.6},
  {date: new Date("2024-07"), value: 143.6},
  {date: new Date("2024-08"), value: 139.4},
  {date: new Date("2024-09"), value: 134.8},
  {date: new Date("2024-10"), value: 140.2},
  {date: new Date("2024-11"), value: 139.8},
  {date: new Date("2024-12"), value: 141.4},
  {date: new Date("2025-01"), value: 146.6},
  {date: new Date("2025-02"), value: 147.3},
  {date: new Date("2025-03"), value: 146.2},
  {date: new Date("2025-04"), value: 141.2},
  {date: new Date("2025-05"), value: 140.2},
  {date: new Date("2025-06"), value: 144.4},
  {date: new Date("2025-07"), value: 144.7},
  {date: new Date("2025-08"), value: 143.6},
  {date: new Date("2025-09"), value: 146.1},
  {date: new Date("2025-10"), value: 148.4},
  {date: new Date("2025-11"), value: 148.8}
];

display(Plot.plot({
  title: "Indice des prix des matières premières, décembre 2023 à novembre 2025",
  width: 680,
  height: 300,
  y: {domain: [125, 155], grid: true, label: "↑ Indice (2020=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(rmpiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(rmpiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(rmpiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ","), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation d'une année à l'autre par groupe de produits

Les minerais, concentrés et déchets de métaux ont enregistré la plus forte hausse d'une année à l'autre à 34,7 %, en raison de prix plus élevés pour le cuivre, l'or et d'autres minerais métalliques. L'indice excluant les produits énergétiques bruts a progressé de 19,0 %, tandis que les animaux et produits d'origine animale ont augmenté de 9,9 %.

Les minéraux non métalliques ont augmenté de 9,5 % d'une année à l'autre, reflétant des gains dans une gamme de produits minéraux.

Les produits énergétiques bruts ont reculé de 15,2 % d'une année à l'autre, le gaz naturel ayant diminué de 8,0 %. La baisse des prix du pétrole brut a contribué au recul des produits énergétiques.

```js
const yoyData = [
  {product: "Minerais, concentrés et déchets de métaux", change: 34.7},
  {product: "Total excluant l'énergie brute", change: 19.0},
  {product: "Animaux et produits d'origine animale", change: 9.9},
  {product: "Minéraux non métalliques", change: 9.5},
  {product: "Gaz naturel", change: -8.0},
  {product: "Produits énergétiques bruts", change: -15.2}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre par groupe de produits (%)",
  width: 700,
  height: 280,
  marginLeft: 250,
  marginRight: 60,
  x: {domain: [-20, 40], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "product",
      x: "change",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(yoyData, {
      y: "product",
      x: 38,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Variations mensuelles

Les minéraux non métalliques ont mené les hausses mensuelles en novembre, augmentant de 2,4 %. Le gaz naturel a progressé de 2,1 %, tandis que les minerais, concentrés et déchets de métaux ont augmenté de 1,5 %.

Les animaux et produits d'origine animale ont reculé de 2,0 % en novembre, après des gains au cours des mois précédents. Les produits énergétiques bruts ont légèrement diminué de 0,5 %.

| Groupe de produits | Indice nov. 2025 | Var. mensuelle (%) | Var. annuelle (%) |
|-------------------|------------------:|-------------------:|------------------:|
| IPMP total | 148,8 | +0,3 | +6,4 |
| Total excl. énergie brute | 173,0 | +0,6 | +19,0 |
| Minerais et déchets de métaux | 215,0 | +1,5 | +34,7 |
| Animaux et produits d'origine animale | 155,0 | -2,0 | +9,9 |
| Minéraux non métalliques | 176,0 | +2,4 | +9,5 |
| Produits énergétiques bruts | 112,0 | -0,5 | -15,2 |
| Gaz naturel | 64,7 | +2,1 | -8,0 |

<div class="note-to-readers">

## Note aux lecteurs

L'Indice des prix des matières premières (IPMP) mesure les prix payés par les fabricants canadiens pour les principales matières premières. Il reflète les pressions sur les prix au stade le plus précoce de la chaîne d'approvisionnement manufacturière, avant la transformation en produits finis.

L'IPMP diffère de l'Indice des prix des produits industriels (IPPI), qui mesure les prix que les producteurs reçoivent pour les biens vendus à la sortie de l'usine. Les variations des prix des matières premières peuvent prendre du temps à affecter les prix des produits industriels et, ultimement, les prix à la consommation.

Les produits énergétiques bruts comprennent le pétrole brut, le gaz naturel et le charbon. L'indice excluant les produits énergétiques bruts fournit une mesure des mouvements de prix des matières premières non énergétiques.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 18-10-0268](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810026801)
**Enquête :** Indice des prix des matières premières
**Période de référence :** Novembre 2025
**DOI :** [https://doi.org/10.25318/1810026801-fra](https://doi.org/10.25318/1810026801-fra)

</div>

<details>
<summary>Reproductibilité : Code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Télécharger les données de l'IPMP
conn <- get_cansim_connection("18-10-0268")

# Série chronologique de l'IPMP total
total <- conn |>
  filter(`North American Product Classification System (NAPCS)` ==
         "Total, Raw materials price indexes (RMPI)") |>
  collect_and_normalize() |>
  filter(REF_DATE >= "2023-11") |>
  select(REF_DATE, VALUE) |>
  arrange(REF_DATE)

# Répartition par composante pour novembre 2025
components <- conn |>
  collect_and_normalize() |>
  filter(REF_DATE == "2025-11") |>
  select(`North American Product Classification System (NAPCS)`, VALUE) |>
  arrange(desc(VALUE))

# Calculer les variations
nov2025 <- 148.8
oct2025 <- 148.4
nov2024 <- 139.8

var_mensuelle <- (nov2025 - oct2025) / oct2025 * 100  # 0,27 %
var_annuelle <- (nov2025 - nov2024) / nov2024 * 100   # 6,44 %
```

</details>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "prix-matieres-premieres-novembre-2025", "fr"));
```
