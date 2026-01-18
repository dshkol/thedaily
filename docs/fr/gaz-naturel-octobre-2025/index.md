---
title: Production de gaz naturel en hausse de 3,2 % d'une année à l'autre en octobre 2025
verification_json: output/natural_gas_supply.json
toc: false
---
# Production de gaz naturel en hausse de 3,2 % d'une année à l'autre en octobre 2025

<p class="release-date">Diffusion : 17 janvier 2026 <span class="article-type-tag release">Nouvelle diffusion</span></p>

<div class="highlights">

**Faits saillants**

- La production canadienne de gaz naturel a totalisé 17 109 millions de mètres cubes en octobre 2025, en hausse de 3,2 % par rapport à octobre 2024
- La production a augmenté de 8,9 % par rapport à septembre, la demande saisonnière ayant augmenté
- L'Alberta a représenté 62,9 % de la production nationale avec 10 760 millions de mètres cubes
- Les exportations ont totalisé 7 442 millions de mètres cubes, représentant 43,5 % de la production

</div>

La production canadienne de gaz naturel a totalisé 17 109 millions de mètres cubes en octobre 2025, en hausse de 3,2 % par rapport aux 16 573 millions de mètres cubes produits en octobre 2024. D'un mois à l'autre, la production a augmenté de 8,9 % par rapport aux 15 713 millions de mètres cubes de septembre, les températures plus fraîches et la demande saisonnière de chauffage ayant contribué à une production plus élevée.

La production d'octobre est demeurée dans la fourchette habituelle observée au cours des deux dernières années, les volumes mensuels fluctuant généralement entre 15 500 et 17 500 millions de mètres cubes.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles de Statistique Canada, tableau 25-10-0055
const gasData = [
  {date: new Date("2023-11-01"), value: 16208.0},
  {date: new Date("2023-12-01"), value: 17064.5},
  {date: new Date("2024-01-01"), value: 16487.3},
  {date: new Date("2024-02-01"), value: 15956.1},
  {date: new Date("2024-03-01"), value: 16796.9},
  {date: new Date("2024-04-01"), value: 16053.9},
  {date: new Date("2024-05-01"), value: 16007.5},
  {date: new Date("2024-06-01"), value: 15645.9},
  {date: new Date("2024-07-01"), value: 15804.1},
  {date: new Date("2024-08-01"), value: 16294.9},
  {date: new Date("2024-09-01"), value: 15084.9},
  {date: new Date("2024-10-01"), value: 16573.4},
  {date: new Date("2024-11-01"), value: 16920.0},
  {date: new Date("2024-12-01"), value: 17519.0},
  {date: new Date("2025-01-01"), value: 17477.1},
  {date: new Date("2025-02-01"), value: 15559.9},
  {date: new Date("2025-03-01"), value: 17475.8},
  {date: new Date("2025-04-01"), value: 16423.8},
  {date: new Date("2025-05-01"), value: 16955.5},
  {date: new Date("2025-06-01"), value: 15837.0},
  {date: new Date("2025-07-01"), value: 16859.8},
  {date: new Date("2025-08-01"), value: 16524.7},
  {date: new Date("2025-09-01"), value: 15713.0},
  {date: new Date("2025-10-01"), value: 17109.4}
];

display(Plot.plot({
  title: "Production canadienne de gaz naturel, novembre 2023 à octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [14500, 18000], grid: true, label: "Millions de mètres cubes"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(gasData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(gasData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(gasData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(0), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## L'Alberta domine la production nationale

L'Alberta a produit 10 760 millions de mètres cubes en octobre 2025, représentant 62,9 % de la production nationale. La Colombie-Britannique a suivi avec 6 186 millions de mètres cubes (36,2 %), tandis que la Saskatchewan a contribué 144 millions de mètres cubes.

La production des autres provinces et territoires était minimale, le Québec, l'Ontario et les Territoires du Nord-Ouest contribuant ensemble moins de 20 millions de mètres cubes.

| Province | Production (millions m³) | Part |
|---|---:|---:|
| Alberta | 10 760 | 62,9 % |
| Colombie-Britannique | 6 186 | 36,2 % |
| Saskatchewan | 144 | 0,8 % |
| Autres | 19 | 0,1 % |

```js
const provincialData = [
  {province: "Alberta", value: 10760},
  {province: "Colombie-Britannique", value: 6186},
  {province: "Saskatchewan", value: 144}
];

display(Plot.plot({
  title: "Production de gaz naturel par province, octobre 2025",
  width: 640,
  height: 200,
  marginLeft: 150,
  x: {grid: true, label: "Millions de mètres cubes"},
  y: {label: null},
  marks: [
    Plot.barX(provincialData, {x: "value", y: "province", fill: "#AF3C43", sort: {y: "-x"}}),
    Plot.text(provincialData, {x: "value", y: "province", text: d => d.value.toLocaleString("fr-CA"), dx: 35, fill: "currentColor"})
  ]
}));
```

## Les volumes d'exportation demeurent substantiels

Les exportations de gaz naturel ont totalisé 7 442 millions de mètres cubes en octobre 2025, représentant 43,5 % de la production totale. La majorité des exportations canadiennes de gaz naturel sont destinées aux États-Unis par l'intermédiaire du vaste réseau de pipelines reliant les deux pays.

<div class="note-to-readers">

## Note aux lecteurs

Les données sur la production de gaz naturel mesurent le volume brut de gaz naturel commercialisable produit au Canada. Les données sont déclarées par province et territoire en fonction du lieu de production.

Les volumes de production sont exprimés en millions de mètres cubes dans des conditions standard (15 degrés Celsius et 101,325 kilopascals).

</div>

<details>
<summary>Reproductibilité : code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Récupérer les données sur l'offre de gaz naturel
gas <- get_cansim("25-10-0055")

# Série chronologique de la production nationale
national <- gas %>%
  filter(GEO == "Canada",
         `Supply and disposition` == "Marketable production") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Calculer les variations
current <- national %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
previous <- national %>% filter(REF_DATE == "2025-09") %>% pull(VALUE)
year_ago <- national %>% filter(REF_DATE == "2024-10") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100
yoy_change <- (current - year_ago) / year_ago * 100

# Répartition provinciale
by_province <- gas %>%
  filter(GEO != "Canada",
         `Supply and disposition` == "Marketable production",
         REF_DATE == "2025-10") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))

# Exportations
exports <- gas %>%
  filter(GEO == "Canada",
         `Supply and disposition` == "Exports",
         REF_DATE == "2025-10") %>%
  pull(VALUE)
```

</details>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 25-10-0055](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2510005501)
**Enquête :** Offre et utilisation du gaz naturel
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/2510005501-fra](https://doi.org/10.25318/2510005501-fra)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "gaz-naturel-octobre-2025", "fr"));
```
