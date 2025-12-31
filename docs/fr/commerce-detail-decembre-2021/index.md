---
title: Les ventes au détail reculent de 1,8 % en décembre, en hausse de 8,8 % d'une année à l'autre
toc: false
---

# Les ventes au détail reculent de 1,8 % en décembre, en hausse de 8,8 % d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont reculé de 1,8 % en décembre 2021 pour s'établir à 61,3 milliards de dollars
- D'une année à l'autre, les ventes étaient en hausse de 8,8 %, alors que 2021 s'est terminée en force
- Le Manitoba a mené toutes les provinces avec une croissance exceptionnelle de 20,4 % d'une année à l'autre
- Seuls les Territoires du Nord-Ouest et le Nunavut ont affiché des baisses d'une année à l'autre

</div>

Les ventes au détail au Canada ont reculé de 1,8 % en décembre 2021 pour s'établir à 61,3 milliards de dollars, après de solides gains en novembre. Malgré la baisse mensuelle, la croissance d'une année à l'autre est demeurée robuste à 8,8 %, couronnant une année solide pour le commerce de détail.

Le Manitoba s'est distingué avec une croissance exceptionnelle de 20,4 % d'une année à l'autre, soit plus du double de la moyenne nationale. Le Canada atlantique a également affiché une vigueur généralisée, les quatre provinces ayant enregistré des gains à deux chiffres.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-01-01"), value: 55.15},
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
  {date: new Date("2021-12-01"), value: 61.33}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, 2021 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [52, 65], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Le Manitoba en tête d'une croissance provinciale exceptionnelle

Le Manitoba a mené toutes les provinces avec une croissance exceptionnelle de 20,4 % d'une année à l'autre, soit plus du double de la moyenne nationale. Ce gain remarquable reflétait la reprise de la province après les restrictions pandémiques qui ont touché décembre 2020.

Le Canada atlantique a affiché une vigueur généralisée, le Nouveau-Brunswick (+13,2 %), l'Île-du-Prince-Édouard (+13,0 %), la Nouvelle-Écosse (+12,9 %) et Terre-Neuve-et-Labrador (+12,5 %) ayant tous enregistré de solides gains à deux chiffres. Seuls les Territoires du Nord-Ouest (-0,9 %) et le Nunavut (-5,1 %) ont affiché des baisses d'une année à l'autre.

```js
const provincialData = [
  {province: "Manitoba", value: 20.4},
  {province: "Nouveau-Brunswick", value: 13.2},
  {province: "Île-du-Prince-Édouard", value: 13.0},
  {province: "Nouvelle-Écosse", value: 12.9},
  {province: "Terre-Neuve-et-Labrador", value: 12.5},
  {province: "Saskatchewan", value: 12.4},
  {province: "Québec", value: 11.0},
  {province: "Ontario", value: 10.4},
  {province: "Yukon", value: 4.9},
  {province: "Alberta", value: 3.5},
  {province: "Colombie-Britannique", value: 1.6},
  {province: "Territoires du Nord-Ouest", value: -0.9},
  {province: "Nunavut", value: -5.1}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, décembre 2021 (%)",
  width: 680,
  height: 380,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-8, 24]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([8.8], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 24,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 8.8, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Manitoba",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en décembre, avec des ventes de 15,3 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 10,6 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (décembre 2021) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 15,3 G$ |
| Détaillants en alimentation et en boissons | 10,6 G$ |
| Détaillants de marchandises diverses | 7,6 G$ |
| Stations-service et vendeurs de carburant | 4,8 G$ |
| Détaillants de produits de santé et de soins personnels | 4,5 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 2,9 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Décembre 2021
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-decembre-2021", "fr"));
```
