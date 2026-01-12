---
title: Les mises en chantier en hausse de 11 % en novembre 2025
verification_json: output/housing_starts.json
toc: false
---
# Les mises en chantier en hausse de 11 % en novembre 2025

<p class="release-date">Diffusion : 17 décembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- Les mises en chantier ont augmenté de 11,0 % pour atteindre 233 600 unités (données désaisonnalisées et annualisées) en novembre 2025
- Les logements collectifs représentaient 83 % de toutes les mises en chantier, soit 194 000 unités
- Sur une base annuelle, les mises en chantier ont diminué de 5,7 % par rapport à novembre 2024
- Le Nouveau-Brunswick (+76,7 %) et le Manitoba (+69,9 %) ont affiché les plus fortes hausses provinciales d'une année à l'autre

</div>

Le nombre désaisonnalisé et annualisé de mises en chantier a augmenté de 11,0 % pour atteindre 233 600 unités en novembre 2025, après un recul en octobre. Malgré ce rebond mensuel, les mises en chantier ont diminué de 5,7 % par rapport à novembre 2024, alors que 247 800 unités avaient été mises en chantier.

La construction de logements collectifs a continué de dominer l'activité des mises en chantier, les appartements et autres types de logements collectifs représentant 83 % de toutes les mises en chantier. Les appartements et autres types de logements ont totalisé 159 100 unités, tandis que les maisons en rangée ont ajouté 23 000 unités et les maisons jumelées ont contribué 11 900 unités. Les mises en chantier de maisons individuelles ont atteint 39 700 unités.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles de Statistique Canada, Tableau 34-10-0156
// Mises en chantier, données désaisonnalisées et annualisées (milliers)
const startsData = [
  {date: new Date("2023-12"), value: 236.1},
  {date: new Date("2024-01"), value: 208.0},
  {date: new Date("2024-02"), value: 237.4},
  {date: new Date("2024-03"), value: 221.0},
  {date: new Date("2024-04"), value: 222.0},
  {date: new Date("2024-05"), value: 248.0},
  {date: new Date("2024-06"), value: 222.0},
  {date: new Date("2024-07"), value: 262.4},
  {date: new Date("2024-08"), value: 199.4},
  {date: new Date("2024-09"), value: 211.0},
  {date: new Date("2024-10"), value: 225.2},
  {date: new Date("2024-11"), value: 247.8},
  {date: new Date("2024-12"), value: 214.8},
  {date: new Date("2025-01"), value: 220.2},
  {date: new Date("2025-02"), value: 207.9},
  {date: new Date("2025-03"), value: 202.6},
  {date: new Date("2025-04"), value: 260.9},
  {date: new Date("2025-05"), value: 260.1},
  {date: new Date("2025-06"), value: 260.2},
  {date: new Date("2025-07"), value: 268.6},
  {date: new Date("2025-08"), value: 219.7},
  {date: new Date("2025-09"), value: 256.4},
  {date: new Date("2025-10"), value: 210.3},
  {date: new Date("2025-11"), value: 233.6}
];

display(Plot.plot({
  title: "Mises en chantier, données désaisonnalisées et annualisées (milliers)",
  width: 680,
  height: 300,
  y: {domain: [180, 280], grid: true, label: "Milliers d'unités"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(startsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(startsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(startsData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + "K", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Répartition par type de logement

La construction de logements collectifs demeure le principal moteur de l'activité des mises en chantier. En novembre, les appartements et autres types de logements représentaient 68 % de toutes les mises en chantier, tandis que les maisons individuelles représentaient 17 % de l'activité totale.

```js
const typeData = [
  {type: "Appartements et autres types", value: 159.1},
  {type: "Maisons individuelles", value: 39.7},
  {type: "Maisons en rangée", value: 23.0},
  {type: "Maisons jumelées", value: 11.9}
];

display(Plot.plot({
  title: "Mises en chantier par type de logement, novembre 2025 (milliers)",
  width: 640,
  height: 240,
  marginLeft: 200,
  marginRight: 60,
  x: {domain: [0, 180], grid: true, label: "Milliers d'unités"},
  y: {label: null},
  marks: [
    Plot.barX(typeData, {
      y: "type",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(typeData, {
      y: "type",
      x: "value",
      text: d => d.value.toFixed(1).replace(".", ",") + "K",
      dx: 25,
      fill: "currentColor"
    })
  ]
}));
```

## Variation provinciale

D'une année à l'autre en novembre, les mises en chantier ont augmenté dans cinq provinces et ont diminué dans cinq provinces par rapport à novembre 2024.

Le Nouveau-Brunswick (+76,7 %) a enregistré la plus forte hausse d'une année à l'autre, suivi du Manitoba (+69,9 %) et de la Nouvelle-Écosse (+19,0 %). Ces hausses ont été partiellement compensées par des baisses en Saskatchewan (-38,5 %), en Colombie-Britannique (-21,0 %) et en Alberta (-12,6 %).

Le Québec a dominé toutes les provinces avec 55 000 mises en chantier, suivi de l'Ontario et de l'Alberta, chacun avec 52 100 mises en chantier. La Colombie-Britannique a enregistré 39 100 mises en chantier.

```js
const provData = [
  {province: "Québec", value: 55.0, yoy: 2.6},
  {province: "Ontario", value: 52.1, yoy: -12.0},
  {province: "Alberta", value: 52.1, yoy: -12.6},
  {province: "Colombie-Britannique", value: 39.1, yoy: -21.0},
  {province: "Manitoba", value: 13.2, yoy: 69.9},
  {province: "Nouveau-Brunswick", value: 10.5, yoy: 76.7},
  {province: "Nouvelle-Écosse", value: 6.8, yoy: 19.0},
  {province: "Saskatchewan", value: 2.9, yoy: -38.5},
  {province: "Terre-Neuve-et-Labrador", value: 1.6, yoy: -3.2},
  {province: "Île-du-Prince-Édouard", value: 0.4, yoy: 122.3}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des mises en chantier par province (%)",
  width: 640,
  height: 340,
  marginLeft: 200,
  marginRight: 60,
  x: {domain: [-50, 130], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(provData, {
      y: "province",
      x: "yoy",
      fill: d => d.yoy >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(provData, {
      y: "province",
      x: 125,
      text: d => (d.yoy >= 0 ? "+" : "") + d.yoy.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

Les mises en chantier représentent le début de la construction d'un nouveau bâtiment résidentiel. Les données sont recueillies par la Société canadienne d'hypothèques et de logement (SCHL) par l'intermédiaire d'enquêtes sur le terrain auprès de chantiers résidentiels partout au Canada.

Les données sont désaisonnalisées et annualisées pour faciliter les comparaisons d'un mois à l'autre. Les données désaisonnalisées et annualisées représentent le nombre de mises en chantier qui se produiraient au cours d'une année si le rythme du mois en cours se poursuivait pendant 12 mois.

</div>

<details>
<summary>Reproductibilité : code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Récupérer les données sur les mises en chantier (désaisonnalisées et annualisées)
df <- get_cansim("34-10-0156")

# Série chronologique nationale - Total des unités
national <- df %>%
  filter(GEO == "Canada",
         `Type of unit` == "Total units") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Calculer les variations d'un mois à l'autre et d'une année à l'autre
current <- national %>% filter(REF_DATE == "2025-11") %>% pull(VALUE)
previous <- national %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
year_ago <- national %>% filter(REF_DATE == "2024-11") %>% pull(VALUE)

mom_change <- (current - previous) / previous * 100
yoy_change <- (current - year_ago) / year_ago * 100

# Répartition par type de logement pour novembre 2025
by_type <- df %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-11") %>%
  select(`Type of unit`, VALUE) %>%
  arrange(desc(VALUE))

# Répartition provinciale
provinces <- c("Newfoundland and Labrador", "Prince Edward Island", "Nova Scotia",
               "New Brunswick", "Quebec", "Ontario", "Manitoba", "Saskatchewan",
               "Alberta", "British Columbia")

provincial <- df %>%
  filter(GEO %in% provinces,
         `Type of unit` == "Total units",
         REF_DATE == "2025-11") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 34-10-0156](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=3410015601)
**Enquête :** Société canadienne d'hypothèques et de logement, enquête sur les mises en chantier
**Période de référence :** Novembre 2025
**DOI :** [https://doi.org/10.25318/3410015601-fra](https://doi.org/10.25318/3410015601-fra)

</div>

```js
// Barre latérale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "mises-en-chantier-novembre-2025", "fr"));
```
