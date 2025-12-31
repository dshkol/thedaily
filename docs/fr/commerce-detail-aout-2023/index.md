---
title: Les ventes au détail progressent de 0,1 % en août, le Yukon affiche une croissance exceptionnelle de 14,9 %
toc: false
---

# Les ventes au détail progressent de 0,1 % en août, le Yukon affiche une croissance exceptionnelle de 14,9 %

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont légèrement progressé de 0,1 % en août 2023 pour s'établir à 65,9 milliards de dollars, essentiellement inchangées par rapport à juillet
- D'une année à l'autre, les ventes étaient en hausse de 1,2 %, le Yukon affichant un gain exceptionnel de 14,9 %
- Quatre provinces ont enregistré des baisses d'une année à l'autre : le Manitoba, la Saskatchewan, la Colombie-Britannique et Terre-Neuve-et-Labrador
- Le Nouveau-Brunswick a poursuivi sa forte performance avec une croissance de 6,2 %

</div>

Les ventes au détail au Canada ont légèrement progressé de 0,1 % en août 2023 pour s'établir à 65,9 milliards de dollars, essentiellement inchangées par rapport au niveau de juillet. D'une année à l'autre, les ventes étaient supérieures de 1,2 % à celles d'août 2022.

Août 2023 a vu un net clivage entre les provinces, le Yukon affichant un gain exceptionnel de 14,9 % d'une année à l'autre tandis que quatre provinces ont enregistré des baisses. L'Ouest canadien et Terre-Neuve ont affiché une faiblesse particulière.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-09-01"), value: 64.85},
  {date: new Date("2022-10-01"), value: 65.40},
  {date: new Date("2022-11-01"), value: 65.41},
  {date: new Date("2022-12-01"), value: 64.68},
  {date: new Date("2023-01-01"), value: 66.27},
  {date: new Date("2023-02-01"), value: 65.67},
  {date: new Date("2023-03-01"), value: 65.35},
  {date: new Date("2023-04-01"), value: 65.63},
  {date: new Date("2023-05-01"), value: 65.66},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.89},
  {date: new Date("2023-08-01"), value: 65.93}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, septembre 2022 à août 2023 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [63, 70], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Le Yukon en tête avec une croissance exceptionnelle

Le Yukon a mené toutes les provinces avec une croissance exceptionnelle de 14,9 % d'une année à l'autre, la plus forte performance provinciale de la série du commerce de détail des derniers mois. Le Nouveau-Brunswick a suivi à 6,2 %, avec l'Île-du-Prince-Édouard à 4,5 %.

Quatre provinces ont enregistré des baisses d'une année à l'autre. Le Manitoba a reculé de 0,4 % et la Saskatchewan a chuté de 0,5 %, tandis que la Colombie-Britannique a diminué de 1,9 % et Terre-Neuve-et-Labrador a reculé de 2,0 %—le recul provincial le plus marqué.

```js
const provincialData = [
  {province: "Yukon", value: 14.9},
  {province: "Nouveau-Brunswick", value: 6.2},
  {province: "Île-du-Prince-Édouard", value: 4.5},
  {province: "Québec", value: 3.5},
  {province: "Nouvelle-Écosse", value: 2.5},
  {province: "Alberta", value: 1.3},
  {province: "Ontario", value: 1.0},
  {province: "Manitoba", value: -0.4},
  {province: "Saskatchewan", value: -0.5},
  {province: "Colombie-Britannique", value: -1.9},
  {province: "Terre-Neuve-et-Labrador", value: -2.0}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, août 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-5, 18]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.2], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 18,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.2, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Yukon",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en août, avec des ventes de 17,4 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,1 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (août 2023) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,4 G$ |
| Détaillants en alimentation et en boissons | 12,1 G$ |
| Détaillants de marchandises diverses | 8,4 G$ |
| Stations-service et vendeurs de carburant | 6,0 G$ |
| Détaillants de produits de santé et de soins personnels | 5,1 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,7 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Août 2023
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-aout-2023", "fr"));
```
