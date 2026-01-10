---
title: Les ventes au détail augmentent de 1,0 % en septembre, le Yukon en tête des gains d'une année à l'autre
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail augmentent de 1,0 % en septembre, le Yukon en tête des gains d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 1,0 % en septembre 2023 pour s'établir à 66,6 milliards de dollars, rebondissant après deux mois de légères baisses
- D'une année à l'autre, les ventes étaient en hausse de 2,7 %, le Yukon en tête des gains à 8,1 %
- Dix des onze provinces et territoires ont affiché une croissance positive d'une année à l'autre
- Terre-Neuve-et-Labrador était la seule juridiction à enregistrer une baisse, reculant de 0,6 %

</div>

Les ventes au détail au Canada ont augmenté de 1,0 % en septembre 2023 pour s'établir à 66,6 milliards de dollars, rebondissant après les légères baisses observées en juillet et août. D'une année à l'autre, les ventes étaient supérieures de 2,7 % à celles de septembre 2022.

Septembre 2023 a vu des gains généralisés dans la plupart des juridictions. Seule Terre-Neuve-et-Labrador a enregistré une baisse d'une année à l'autre, ce qui en fait l'un des mois les plus solides pour la performance provinciale dans l'histoire récente.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
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
  {date: new Date("2023-08-01"), value: 65.93},
  {date: new Date("2023-09-01"), value: 66.58}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, octobre 2022 à septembre 2023 (milliards de $)",
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

## Le Yukon en tête des gains, Terre-Neuve-et-Labrador seul en baisse

Le Yukon a mené toutes les provinces avec une croissance de 8,1 % d'une année à l'autre, poursuivant sa forte performance. Le Québec a suivi à 6,0 %, tandis que la Nouvelle-Écosse et le Nouveau-Brunswick ont tous deux dépassé les 5 %.

Terre-Neuve-et-Labrador était la seule juridiction à enregistrer une baisse d'une année à l'autre, reculant de 0,6 %. Toutes les autres provinces et tous les territoires ont affiché une croissance positive.

```js
const provincialData = [
  {province: "Yukon", value: 8.1},
  {province: "Québec", value: 6.0},
  {province: "Nouvelle-Écosse", value: 5.2},
  {province: "Nouveau-Brunswick", value: 5.1},
  {province: "Île-du-Prince-Édouard", value: 4.7},
  {province: "Alberta", value: 2.6},
  {province: "Manitoba", value: 2.1},
  {province: "Saskatchewan", value: 2.1},
  {province: "Ontario", value: 1.5},
  {province: "Colombie-Britannique", value: 0.5},
  {province: "Terre-Neuve-et-Labrador", value: -0.6}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, septembre 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-3, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([2.7], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 2.7, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en septembre, avec des ventes de 17,4 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,2 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (septembre 2023) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,4 G$ |
| Détaillants en alimentation et en boissons | 12,2 G$ |
| Détaillants de marchandises diverses | 8,5 G$ |
| Stations-service et vendeurs de carburant | 6,0 G$ |
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
**Période de référence :** Septembre 2023
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-septembre-2023", "fr"));
```
