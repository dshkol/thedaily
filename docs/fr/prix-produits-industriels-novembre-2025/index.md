---
title: Les prix des produits industriels en hausse de 6,1 % d'une année à l'autre en novembre 2025
toc: false
---

# Les prix des produits industriels en hausse de 6,1 % d'une année à l'autre en novembre 2025

<p class="release-date">Diffusion : 28 décembre 2025</p>

<div class="highlights">

**Faits saillants**

- L'Indice des prix des produits industriels (IPPI) a augmenté de 0,9 % en novembre 2025, après une hausse de 1,6 % en octobre
- D'une année à l'autre, les prix des produits industriels ont augmenté de 6,1 %
- Les produits des métaux non ferreux primaires ont mené la hausse annuelle à 33,8 %
- Les produits de l'énergie et du pétrole ont augmenté de 4,3 % d'un mois à l'autre, la plus forte hausse mensuelle

</div>

L'Indice des prix des produits industriels (IPPI) a augmenté de 0,9 % en novembre 2025, portant l'indice à 135,6 (2020=100). Cette hausse fait suite à une augmentation de 1,6 % en octobre. D'une année à l'autre, les prix des produits industriels ont progressé de 6,1 % par rapport à novembre 2024.

La hausse mensuelle a été principalement attribuable aux produits de l'énergie et du pétrole, qui ont augmenté de 4,3 %. Les fruits, légumes, aliments pour animaux et autres produits alimentaires ont progressé de 1,3 %, tandis que les produits de la pâte et du papier et les produits électriques ont tous deux augmenté de 1,0 %.

En partie compensés par ces gains, les produits chimiques ont reculé de 0,6 % et les boissons ont diminué de 0,2 %.

```js
import * as Plot from "npm:@observablehq/plot";

// Données du Tableau 18-10-0265 de Statistique Canada
// Indice des prix des produits industriels total (2020=100)
const ippiData = [
  {date: new Date("2023-11"), value: 124.8},
  {date: new Date("2023-12"), value: 123.0},
  {date: new Date("2024-01"), value: 123.0},
  {date: new Date("2024-02"), value: 125.0},
  {date: new Date("2024-03"), value: 126.0},
  {date: new Date("2024-04"), value: 128.0},
  {date: new Date("2024-05"), value: 128.0},
  {date: new Date("2024-06"), value: 128.0},
  {date: new Date("2024-07"), value: 128.0},
  {date: new Date("2024-08"), value: 127.0},
  {date: new Date("2024-09"), value: 126.0},
  {date: new Date("2024-10"), value: 127.0},
  {date: new Date("2024-11"), value: 127.8},
  {date: new Date("2024-12"), value: 128.0},
  {date: new Date("2025-01"), value: 130.0},
  {date: new Date("2025-02"), value: 131.0},
  {date: new Date("2025-03"), value: 131.0},
  {date: new Date("2025-04"), value: 130.0},
  {date: new Date("2025-05"), value: 129.0},
  {date: new Date("2025-06"), value: 130.0},
  {date: new Date("2025-07"), value: 130.0},
  {date: new Date("2025-08"), value: 131.0},
  {date: new Date("2025-09"), value: 132.0},
  {date: new Date("2025-10"), value: 134.4},
  {date: new Date("2025-11"), value: 135.6}
];

display(Plot.plot({
  title: "Indice des prix des produits industriels, novembre 2023 à novembre 2025",
  width: 680,
  height: 300,
  y: {domain: [118, 140], grid: true, label: "↑ Indice (2020=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(ippiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(ippiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(ippiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ","), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation d'une année à l'autre par groupe de produits

Les produits des métaux non ferreux primaires ont enregistré la plus forte hausse d'une année à l'autre à 33,8 %, en raison de prix plus élevés pour le cuivre, l'aluminium et d'autres métaux de base. Les produits de la viande, du poisson et des produits laitiers ont augmenté de 14,0 %, tandis que les produits métalliques fabriqués et les matériaux de construction ont progressé de 6,6 %.

Cinq groupes de produits ont enregistré des baisses d'une année à l'autre. Les meubles et articles d'ameublement ont reculé de 4,8 %, les produits du bois ont diminué de 4,0 % et les produits des métaux ferreux primaires ont baissé de 2,2 %.

```js
const yoyData = [
  {product: "Métaux non ferreux primaires", change: 33.8},
  {product: "Viande, poisson et produits laitiers", change: 14.0},
  {product: "Produits métalliques fabriqués", change: 6.6},
  {product: "Fruits, légumes et aliments", change: 6.5},
  {product: "Ciment, verre, minéraux", change: 5.0},
  {product: "Matériaux d'emballage", change: 4.9},
  {product: "Énergie et produits du pétrole", change: 4.5},
  {product: "Produits électriques et télécom", change: 4.0},
  {product: "Boissons", change: 3.2},
  {product: "Produits de la pâte et du papier", change: 2.9},
  {product: "Produits du tabac", change: -0.8},
  {product: "Produits chimiques", change: -1.5},
  {product: "Métaux ferreux primaires", change: -2.2},
  {product: "Bois d'œuvre et produits du bois", change: -4.0},
  {product: "Meubles et articles d'ameublement", change: -4.8}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre par groupe de produits (%)",
  width: 700,
  height: 400,
  marginLeft: 230,
  marginRight: 60,
  x: {domain: [-10, 40], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "product",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
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

Les produits de l'énergie et du pétrole ont mené les hausses mensuelles en novembre, augmentant de 4,3 % après un recul de 3,6 % en octobre. Les fruits, légumes, aliments pour animaux et autres produits alimentaires ont progressé de 1,3 %, tandis que les produits de la pâte et du papier et les produits électriques ont tous deux augmenté de 1,0 %.

Les produits des métaux non ferreux primaires, qui ont enregistré la plus forte hausse annuelle, ont augmenté de 0,8 % en novembre après un gain de 0,7 % en octobre.

| Groupe de produits | Indice nov. 2025 | Var. mensuelle (%) | Var. annuelle (%) |
|-------------------|------------------:|-------------------:|------------------:|
| IPPI total | 135,6 | +0,9 | +6,1 |
| Métaux non ferreux primaires | 221,2 | +0,8 | +33,8 |
| Viande, poisson et produits laitiers | 135,6 | +0,4 | +14,0 |
| Énergie et pétrole | 131,2 | +4,3 | +4,5 |
| Produits métalliques fabriqués | 148,5 | +0,7 | +6,6 |
| Bois d'œuvre et produits du bois | 129,5 | +0,2 | -4,0 |
| Meubles et articles d'ameublement | 110,1 | +0,5 | -4,8 |

<div class="note-to-readers">

## Note aux lecteurs

L'Indice des prix des produits industriels (IPPI) mesure les prix que les producteurs reçoivent pour les biens vendus à la sortie de l'usine. Il reflète les pressions sur les prix dans le secteur manufacturier avant qu'elles n'atteignent les consommateurs.

Le panier de l'IPPI a été mis à jour en septembre 2024 pour refléter les valeurs de production de 2019 et le Système de classification des produits de l'Amérique du Nord (SCPAN) 2022 Version 1.0. Le nouveau panier a été enchaîné au panier précédent à la période de référence de juillet 2024.

L'IPPI diffère de l'Indice des prix à la consommation (IPC), qui mesure les prix payés par les consommateurs. Les variations des prix des produits industriels peuvent prendre du temps à affecter les prix à la consommation à mesure que les biens passent par la chaîne d'approvisionnement.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 18-10-0265](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810026501)
**Enquête :** Indice des prix des produits industriels
**Période de référence :** Novembre 2025
**DOI :** [https://doi.org/10.25318/1810026501-fra](https://doi.org/10.25318/1810026501-fra)

</div>

<details>
<summary>Reproductibilité : Code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Télécharger les données de l'IPPI
conn <- get_cansim_connection("18-10-0265")

# Série chronologique de l'IPPI total
total <- conn |>
  filter(`North American Product Classification System (NAPCS)` ==
         "Total, Industrial product price index (IPPI)") |>
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
nov2025 <- 135.6
oct2025 <- 134.4
nov2024 <- 127.8

var_mensuelle <- (nov2025 - oct2025) / oct2025 * 100  # 0,89 %
var_annuelle <- (nov2025 - nov2024) / nov2024 * 100   # 6,1 %
```

</details>
