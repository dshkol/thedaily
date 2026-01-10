---
title: Les ventes au détail diminuent de 1,2 % en mai, quatre provinces affichant des baisses d'une année à l'autre
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail diminuent de 1,2 % en mai, quatre provinces affichant des baisses d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont diminué de 1,2 % en mai 2024 pour s'établir à 66,0 milliards de dollars, en baisse par rapport au sommet d'avril
- D'une année à l'autre, les ventes étaient en hausse de 0,5 %, le Nouveau-Brunswick et la Saskatchewan en tête des gains à 4,3 %
- Quatre provinces ont affiché des baisses d'une année à l'autre, la Colombie-Britannique en tête à -1,5 %
- La baisse de mai a amorcé un recul de deux mois de l'activité commerciale

</div>

Les ventes au détail au Canada ont diminué de 1,2 % en mai 2024 pour s'établir à 66,0 milliards de dollars, en baisse par rapport au sommet d'avril de 66,8 milliards de dollars. D'une année à l'autre, les ventes étaient supérieures de 0,5 % à celles de mai 2023.

La baisse de mai a marqué le début d'un recul de deux mois de l'activité commerciale, juin ayant enregistré une baisse additionnelle de 0,1 %. Quatre provinces ont affiché des baisses d'une année à l'autre, concentrées parmi les provinces de l'Ouest et du Centre.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.89},
  {date: new Date("2023-08-01"), value: 65.93},
  {date: new Date("2023-09-01"), value: 66.58},
  {date: new Date("2023-10-01"), value: 66.51},
  {date: new Date("2023-11-01"), value: 66.56},
  {date: new Date("2023-12-01"), value: 66.32},
  {date: new Date("2024-01-01"), value: 66.08},
  {date: new Date("2024-02-01"), value: 66.24},
  {date: new Date("2024-03-01"), value: 66.16},
  {date: new Date("2024-04-01"), value: 66.78},
  {date: new Date("2024-05-01"), value: 65.96}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, juin 2023 à mai 2024 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [64, 70], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Les provinces de l'Atlantique en tête des gains, les provinces de l'Ouest à la traîne

Le Nouveau-Brunswick et la Saskatchewan ont partagé la tête de la croissance d'une année à l'autre à 4,3 %, suivis de Terre-Neuve-et-Labrador à 3,8 %. Le Québec a affiché des gains de 2,9 %, tandis que le Yukon a progressé de 2,2 %.

Quatre provinces ont enregistré des baisses d'une année à l'autre. La Colombie-Britannique a reculé de 1,5 %, suivie de l'Alberta à 1,1 %. L'Ontario a légèrement baissé de 0,4 %, tandis que le Manitoba a affiché un recul marginal de 0,3 %.

```js
const provincialData = [
  {province: "Nouveau-Brunswick", value: 4.3},
  {province: "Saskatchewan", value: 4.3},
  {province: "Terre-Neuve-et-Labrador", value: 3.8},
  {province: "Québec", value: 2.9},
  {province: "Yukon", value: 2.2},
  {province: "Nouvelle-Écosse", value: 1.9},
  {province: "Île-du-Prince-Édouard", value: 0.6},
  {province: "Manitoba", value: -0.3},
  {province: "Ontario", value: -0.4},
  {province: "Alberta", value: -1.1},
  {province: "Colombie-Britannique", value: -1.5}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, mai 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-4, 8]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([0.5], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 8,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 0.5, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en mai, avec des ventes de 17,9 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,5 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (mai 2024) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,9 G$ |
| Détaillants en alimentation et en boissons | 12,5 G$ |
| Détaillants de marchandises diverses | 8,8 G$ |
| Stations-service et vendeurs de carburant | 5,8 G$ |
| Détaillants de produits de santé et de soins personnels | 5,4 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,9 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Mai 2024
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-mai-2024", "fr"));
```
