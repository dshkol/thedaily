---
title: Les réserves internationales en hausse de 5,1 % d'une année à l'autre en décembre 2025
verification_json: output/international_reserves.json
toc: false
---
# Les réserves internationales en hausse de 5,1 % d'une année à l'autre en décembre 2025

<p class="release-date">Diffusion : 6 janvier 2026 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- Les réserves internationales officielles du Canada totalisaient 127,8 milliards de dollars américains en décembre 2025, en hausse de 5,1 % par rapport à décembre 2024
- Les réserves sont demeurées essentiellement inchangées par rapport à novembre 2025
- Les devises étrangères autres que le dollar américain ont augmenté de 12,9 % d'une année à l'autre, la plus forte hausse parmi les composantes des réserves
- Les devises étrangères en dollars américains représentaient 54 % des réserves totales

</div>

Les réserves internationales officielles du Canada se chiffraient à 127,8 milliards de dollars américains à la fin de décembre 2025, en hausse de 5,1 % par rapport à décembre 2024, alors que les réserves totalisaient 121,6 milliards de dollars américains. Sur une base mensuelle, les réserves sont demeurées essentiellement inchangées par rapport à novembre 2025.

La Banque du Canada détient des réserves internationales pour soutenir les politiques de change et les politiques budgétaires du gouvernement, et pour fournir des liquidités en période de tensions financières.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles de Statistique Canada, Tableau 10-10-0127
// Réserves internationales officielles du Canada (milliards de dollars américains)
const reservesData = [
  {date: new Date("2024-01"), value: 116.3},
  {date: new Date("2024-02"), value: 116.3},
  {date: new Date("2024-03"), value: 117.9},
  {date: new Date("2024-04"), value: 121.0},
  {date: new Date("2024-05"), value: 122.8},
  {date: new Date("2024-06"), value: 122.9},
  {date: new Date("2024-07"), value: 124.2},
  {date: new Date("2024-08"), value: 125.8},
  {date: new Date("2024-09"), value: 128.1},
  {date: new Date("2024-10"), value: 123.1},
  {date: new Date("2024-11"), value: 122.6},
  {date: new Date("2024-12"), value: 121.6},
  {date: new Date("2025-01"), value: 117.9},
  {date: new Date("2025-02"), value: 119.6},
  {date: new Date("2025-03"), value: 126.0},
  {date: new Date("2025-04"), value: 124.7},
  {date: new Date("2025-05"), value: 125.0},
  {date: new Date("2025-06"), value: 127.9},
  {date: new Date("2025-07"), value: 127.7},
  {date: new Date("2025-08"), value: 127.3},
  {date: new Date("2025-09"), value: 128.7},
  {date: new Date("2025-10"), value: 128.8},
  {date: new Date("2025-11"), value: 127.8},
  {date: new Date("2025-12"), value: 127.8}
];

display(Plot.plot({
  title: "Réserves internationales officielles du Canada (milliards $ US)",
  width: 680,
  height: 300,
  y: {domain: [110, 135], grid: true, label: "Milliards $ US"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(reservesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(reservesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(reservesData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Composition des réserves

Les devises étrangères libellées en dollars américains sont demeurées la composante la plus importante des réserves internationales du Canada, totalisant 68,8 milliards de dollars américains ou 54 % des réserves totales. Les autres devises étrangères convertibles totalisaient 29,6 milliards de dollars américains (23 %), suivies des droits de tirage spéciaux à 23,3 milliards de dollars américains (18 %).

D'une année à l'autre, les autres devises étrangères convertibles ont enregistré la plus forte hausse en pourcentage (+12,9 %), suivies des autres avoirs de réserve (+17,3 %). Les devises étrangères en dollars américains ont augmenté de 1,7 %.

Le Canada ne détient pas d'or dans ses réserves officielles, ayant vendu ses dernières réserves d'or en 2016.

```js
const componentData = [
  {component: "Devises en dollars américains", value: 68.8, share: 54},
  {component: "Autres devises étrangères", value: 29.6, share: 23},
  {component: "Droits de tirage spéciaux", value: 23.3, share: 18},
  {component: "Position de réserve au FMI", value: 3.9, share: 3},
  {component: "Autres avoirs de réserve", value: 2.2, share: 2}
];

display(Plot.plot({
  title: "Réserves internationales par composante, décembre 2025 (milliards $ US)",
  width: 640,
  height: 260,
  marginLeft: 220,
  marginRight: 80,
  x: {domain: [0, 80], grid: true, label: "Milliards $ US"},
  y: {label: null},
  marks: [
    Plot.barX(componentData, {
      y: "component",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(componentData, {
      y: "component",
      x: "value",
      text: d => d.value.toFixed(1).replace(".", ",") + " G$ (" + d.share + " %)",
      dx: 55,
      fill: "currentColor"
    })
  ]
}));
```

## Variations d'une année à l'autre par composante

```js
const yoyData = [
  {component: "Autres avoirs de réserve", yoy: 17.3},
  {component: "Autres devises étrangères", yoy: 12.9},
  {component: "Position de réserve au FMI", yoy: 6.1},
  {component: "Total des réserves", yoy: 5.1},
  {component: "Droits de tirage spéciaux", yoy: 5.0},
  {component: "Devises en dollars américains", yoy: 1.7}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre par composante (%)",
  width: 640,
  height: 260,
  marginLeft: 220,
  marginRight: 60,
  x: {domain: [0, 20], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "component",
      x: "yoy",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(yoyData, {
      y: "component",
      x: 19,
      text: d => "+" + d.yoy.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

Les réserves internationales officielles sont des avoirs extérieurs contrôlés par le gouvernement fédéral et la Banque du Canada. Elles sont détenues dans le Compte du fonds des changes et sont utilisées pour favoriser le bon fonctionnement du marché des changes et fournir des liquidités en devises étrangères au besoin.

Les données sont exprimées en millions de dollars américains aux valeurs de marché de fin de mois.

</div>

<details>
<summary>Reproductibilité : code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Récupérer les données sur les réserves internationales
df <- get_cansim("10-10-0127")

# Série chronologique des réserves totales
total_reserves <- df %>%
  filter(GEO == "Canada",
         `Type of reserve` == "Total, Canada's official international reserves") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Calculer la variation d'une année à l'autre
current <- total_reserves %>% filter(REF_DATE == "2025-12") %>% pull(VALUE)
year_ago <- total_reserves %>% filter(REF_DATE == "2024-12") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Répartition par composante pour décembre 2025
components <- df %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-12") %>%
  select(`Type of reserve`, VALUE) %>%
  arrange(desc(VALUE))

# Variations d'une année à l'autre par composante
component_yoy <- df %>%
  filter(GEO == "Canada",
         REF_DATE %in% c("2025-12", "2024-12")) %>%
  select(`Type of reserve`, REF_DATE, VALUE) %>%
  tidyr::pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy = (`2025-12` - `2024-12`) / `2024-12` * 100) %>%
  arrange(desc(`2025-12`))
```

</details>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 10-10-0127](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1010012701)
**Enquête :** Banque du Canada, Réserves internationales officielles
**Période de référence :** Décembre 2025
**DOI :** [https://doi.org/10.25318/1010012701-fra](https://doi.org/10.25318/1010012701-fra)

</div>

```js
// Barre latérale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "reserves-internationales-decembre-2025", "fr"));
```
