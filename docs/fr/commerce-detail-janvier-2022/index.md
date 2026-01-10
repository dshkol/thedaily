---
title: Les ventes au détail augmentent de 2,5 % en janvier, le Québec affiche un gain exceptionnel de 29,2 % d'une année à l'autre
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail augmentent de 2,5 % en janvier, le Québec affiche un gain exceptionnel de 29,2 % d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 2,5 % en janvier 2022 pour atteindre 62,9 milliards de dollars
- D'une année à l'autre, les ventes étaient en hausse de 14,0 %, reflétant un fort élan de réouverture
- Le Québec a mené toutes les provinces avec une croissance exceptionnelle de 29,2 % d'une année à l'autre
- Seuls les Territoires du Nord-Ouest ont affiché une baisse d'une année à l'autre

</div>

Les ventes au détail au Canada ont augmenté de 2,5 % en janvier 2022 pour atteindre 62,9 milliards de dollars, commençant l'année avec un fort élan. La croissance d'une année à l'autre était particulièrement robuste à 14,0 %, puisque janvier 2021 était marqué par des restrictions pandémiques généralisées qui limitaient le commerce de détail en personne.

L'histoire remarquable était la croissance exceptionnelle du Québec de 29,2 % d'une année à l'autre, soit près du double de la moyenne nationale. Ce gain dramatique reflétait les mesures de confinement strictes de la province en janvier 2021, qui ont créé une base de comparaison déprimée. L'Ontario a également affiché une forte croissance à deux chiffres de 18,9 %.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-02-01"), value: 58.78},
  {date: new Date("2021-03-01"), value: 61.77},
  {date: new Date("2021-04-01"), value: 58.40},
  {date: new Date("2021-05-01"), value: 56.95},
  {date: new Date("2021-06-01"), value: 59.65},
  {date: new Date("2021-07-01"), value: 60.15},
  {date: new Date("2021-08-01"), value: 61.11},
  {date: new Date("2021-09-01"), value: 60.84},
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, février 2021 à janvier 2022 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [54, 66], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Le Québec en tête d'une croissance provinciale exceptionnelle

Le Québec a mené toutes les provinces avec une croissance exceptionnelle de 29,2 % d'une année à l'autre, soit plus du double de la moyenne nationale. Ce gain extraordinaire reflétait le confinement strict de janvier 2021 de la province, qui gardait la plupart des détaillants non essentiels fermés.

L'Ontario a suivi avec une forte croissance de 18,9 %, bénéficiant également de la comparaison avec les conditions restreintes un an plus tôt. La plupart des autres provinces ont affiché des gains à un seul chiffre, seuls les Territoires du Nord-Ouest ayant enregistré une baisse (-8,5 %).

```js
const provincialData = [
  {province: "Québec", value: 29.2},
  {province: "Ontario", value: 18.9},
  {province: "Saskatchewan", value: 8.8},
  {province: "Île-du-Prince-Édouard", value: 7.7},
  {province: "Terre-Neuve-et-Labrador", value: 7.3},
  {province: "Manitoba", value: 7.2},
  {province: "Nouveau-Brunswick", value: 6.4},
  {province: "Nunavut", value: 5.1},
  {province: "Yukon", value: 3.3},
  {province: "Alberta", value: 2.2},
  {province: "Nouvelle-Écosse", value: 2.0},
  {province: "Colombie-Britannique", value: 1.0},
  {province: "Territoires du Nord-Ouest", value: -8.5}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, janvier 2022 (%)",
  width: 680,
  height: 380,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-10, 32]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([14.0], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 32,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 14.0, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Québec",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en janvier, avec des ventes de 15,6 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 10,8 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (janvier 2022) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 15,6 G$ |
| Détaillants en alimentation et en boissons | 10,8 G$ |
| Détaillants de marchandises diverses | 7,7 G$ |
| Stations-service et vendeurs de carburant | 5,1 G$ |
| Détaillants de produits de santé et de soins personnels | 4,6 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,0 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Janvier 2022
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-janvier-2022", "fr"));
```
