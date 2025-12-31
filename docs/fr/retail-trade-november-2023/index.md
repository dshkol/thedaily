---
title: Les ventes au détail progressent de 0,1 % en novembre, le Nouveau-Brunswick en tête des gains d'une année à l'autre
toc: false
---

# Les ventes au détail progressent de 0,1 % en novembre, le Nouveau-Brunswick en tête des gains d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont progressé de 0,1 % en novembre 2023 pour s'établir à 66,6 milliards de dollars, poursuivant une tendance modestement à la hausse
- D'une année à l'autre, les ventes étaient en hausse de 1,8 %, le Nouveau-Brunswick en tête des gains à 7,4 %
- La Colombie-Britannique a affiché une croissance exactement nulle (0,0 %) d'une année à l'autre—un résultat inhabituel
- Trois provinces ont enregistré des baisses d'une année à l'autre : la Nouvelle-Écosse, le Manitoba et la Saskatchewan

</div>

Les ventes au détail au Canada ont progressé de 0,1 % en novembre 2023 pour s'établir à 66,6 milliards de dollars, poursuivant une tendance modestement à la hausse par rapport à octobre. D'une année à l'autre, les ventes étaient supérieures de 1,8 % à celles de novembre 2022.

Novembre 2023 a marqué le début de la saison des achats des Fêtes. Le Nouveau-Brunswick a mené toutes les provinces avec une croissance de 7,4 % d'une année à l'autre, tandis que la Colombie-Britannique a affiché un résultat inhabituel exactement nul à 0,0 %.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
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
  {date: new Date("2023-10-01"), value: 66.51},
  {date: new Date("2023-11-01"), value: 66.56}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, décembre 2022 à novembre 2023 (milliards de $)",
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

## Le Nouveau-Brunswick en tête des gains, la Saskatchewan à la traîne

Le Nouveau-Brunswick a mené toutes les provinces avec une croissance de 7,4 % d'une année à l'autre, poursuivant sa forte performance. Le Yukon a suivi à 5,4 %, avec le Québec à 3,3 %.

La Colombie-Britannique a affiché un résultat inhabituel exactement nul à 0,0 % d'une année à l'autre. Trois provinces ont enregistré des baisses : la Nouvelle-Écosse et le Manitoba ont tous deux reculé de 1,1 %, tandis que la Saskatchewan a chuté de 3,3 %—le recul provincial le plus marqué.

```js
const provincialData = [
  {province: "Nouveau-Brunswick", value: 7.4},
  {province: "Yukon", value: 5.4},
  {province: "Québec", value: 3.3},
  {province: "Île-du-Prince-Édouard", value: 2.8},
  {province: "Ontario", value: 2.0},
  {province: "Alberta", value: 1.9},
  {province: "Terre-Neuve-et-Labrador", value: 1.3},
  {province: "Colombie-Britannique", value: 0.0},
  {province: "Nouvelle-Écosse", value: -1.1},
  {province: "Manitoba", value: -1.1},
  {province: "Saskatchewan", value: -3.3}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, novembre 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-6, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.8], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 10,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.8, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Nouveau-Brunswick",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en novembre, avec des ventes de 17,5 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,3 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (novembre 2023) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,5 G$ |
| Détaillants en alimentation et en boissons | 12,3 G$ |
| Détaillants de marchandises diverses | 8,6 G$ |
| Stations-service et vendeurs de carburant | 5,7 G$ |
| Détaillants de produits de santé et de soins personnels | 5,2 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,5 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Novembre 2023
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-november-2023", "fr"));
```
