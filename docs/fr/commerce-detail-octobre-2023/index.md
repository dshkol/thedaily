---
title: Les ventes au détail reculent de 0,1 % en octobre, le Québec et la Saskatchewan en tête des gains d'une année à l'autre
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail reculent de 0,1 % en octobre, le Québec et la Saskatchewan en tête des gains d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont légèrement reculé de 0,1 % en octobre 2023 pour s'établir à 66,5 milliards de dollars, un léger repli par rapport à septembre
- D'une année à l'autre, les ventes étaient en hausse de 1,7 %, le Québec et la Saskatchewan en tête à égalité à 4,2 %
- Trois provinces ont enregistré des baisses d'une année à l'autre : la Colombie-Britannique, Terre-Neuve-et-Labrador et l'Île-du-Prince-Édouard
- Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur à 17,5 milliards de dollars

</div>

Les ventes au détail au Canada ont légèrement reculé de 0,1 % en octobre 2023 pour s'établir à 66,5 milliards de dollars, un léger repli par rapport au niveau de septembre. D'une année à l'autre, les ventes étaient supérieures de 1,7 % à celles d'octobre 2022.

Octobre 2023 a vu une égalité inhabituelle en tête du classement provincial, le Québec et la Saskatchewan affichant tous deux une croissance de 4,2 % d'une année à l'autre. Trois provinces ont enregistré des baisses, toutes dans les régions de l'Atlantique et du Pacifique.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-11-01"), value: 65.41},
  {date: new Date("2022-12-01"), value: 64.68},
  {date: new Date("2023-01-01"), value: 66.27},
  {date: new Date("2023-02-01"), value: 65.67},
  {date: new Date("2023-03-01"), value: 65.35},
  {date: new Date("2023-04-01"), value: 65.63},
  {date: new Date("2023-05-01"), value: 65.66},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.89},
  {date: new Date("2023-08-01"), value: 65.93},
  {date: new Date("2023-09-01"), value: 66.58},
  {date: new Date("2023-10-01"), value: 66.51}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, novembre 2022 à octobre 2023 (milliards de $)",
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

## Le Québec et la Saskatchewan à égalité en tête

Le Québec et la Saskatchewan ont tous deux affiché une croissance de 4,2 % d'une année à l'autre, menant toutes les provinces. Le Nouveau-Brunswick a suivi à 2,8 %, avec le Yukon à 2,6 %.

Trois provinces ont enregistré des baisses d'une année à l'autre : la Colombie-Britannique a reculé de 1,0 %, tandis que Terre-Neuve-et-Labrador et l'Île-du-Prince-Édouard ont toutes deux fléchi de 1,1 %—les reculs provinciaux les plus marqués.

```js
const provincialData = [
  {province: "Québec", value: 4.2},
  {province: "Saskatchewan", value: 4.2},
  {province: "Nouveau-Brunswick", value: 2.8},
  {province: "Yukon", value: 2.6},
  {province: "Ontario", value: 1.5},
  {province: "Alberta", value: 0.9},
  {province: "Nouvelle-Écosse", value: 0.7},
  {province: "Manitoba", value: 0.6},
  {province: "Colombie-Britannique", value: -1.0},
  {province: "Terre-Neuve-et-Labrador", value: -1.1},
  {province: "Île-du-Prince-Édouard", value: -1.1}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, octobre 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-4, 6]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.7], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 6,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.7, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en octobre, avec des ventes de 17,5 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,2 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (octobre 2023) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,5 G$ |
| Détaillants en alimentation et en boissons | 12,2 G$ |
| Détaillants de marchandises diverses | 8,4 G$ |
| Stations-service et vendeurs de carburant | 5,9 G$ |
| Détaillants de produits de santé et de soins personnels | 5,2 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,6 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Octobre 2023
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-octobre-2023", "fr"));
```
