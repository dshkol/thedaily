---
title: Les ventes au détail augmentent de 2,5 % en décembre, les achats des Fêtes portant les ventes à 70,0 milliards de dollars
toc: false
---

# Les ventes au détail augmentent de 2,5 % en décembre, les achats des Fêtes portant les ventes à 70,0 milliards de dollars

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 2,5 % en décembre 2024 pour s'établir à 70,0 milliards de dollars, portées par les achats des Fêtes
- D'une année à l'autre, les ventes étaient en hausse de 5,6 %, Terre-Neuve-et-Labrador (+7,8 %) en tête des gains provinciaux
- Dix des onze provinces et territoires ont enregistré une croissance positive d'une année à l'autre
- Le Yukon était la seule administration à afficher une baisse d'une année à l'autre (-2,9 %)

</div>

Les ventes au détail au Canada ont augmenté de 2,5 % en décembre 2024 pour s'établir à 70,0 milliards de dollars, le total mensuel le plus élevé de l'année alors que les achats des Fêtes ont stimulé les dépenses des consommateurs. D'une année à l'autre, les ventes étaient supérieures de 5,6 % à celles de décembre 2023.

La hausse de décembre a marqué le gain mensuel le plus important depuis août 2024. Dix des onze provinces et territoires ont enregistré une croissance positive d'une année à l'autre, Terre-Neuve-et-Labrador en tête à 7,8 %.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2024-01-01"), value: 66.08},
  {date: new Date("2024-02-01"), value: 66.24},
  {date: new Date("2024-03-01"), value: 66.16},
  {date: new Date("2024-04-01"), value: 66.78},
  {date: new Date("2024-05-01"), value: 65.96},
  {date: new Date("2024-06-01"), value: 65.89},
  {date: new Date("2024-07-01"), value: 66.89},
  {date: new Date("2024-08-01"), value: 67.10},
  {date: new Date("2024-09-01"), value: 67.51},
  {date: new Date("2024-10-01"), value: 68.04},
  {date: new Date("2024-11-01"), value: 68.30},
  {date: new Date("2024-12-01"), value: 70.03}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, janvier à décembre 2024 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [64, 72], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Terre-Neuve-et-Labrador en tête des gains d'une année à l'autre

Terre-Neuve-et-Labrador a mené la croissance des ventes d'une année à l'autre à 7,8 %, suivi du Québec à 7,3 % et du Manitoba à 6,9 %. L'Alberta a affiché des gains de 6,4 %.

Le Yukon était la seule administration à enregistrer une baisse d'une année à l'autre, soit -2,9 %. La Colombie-Britannique a affiché le plus petit gain parmi les provinces à 3,6 %.

```js
const provincialData = [
  {province: "Terre-Neuve-et-Labrador", value: 7.8},
  {province: "Québec", value: 7.3},
  {province: "Manitoba", value: 6.9},
  {province: "Alberta", value: 6.4},
  {province: "Île-du-Prince-Édouard", value: 5.9},
  {province: "Ontario", value: 5.0},
  {province: "Nouveau-Brunswick", value: 4.7},
  {province: "Nouvelle-Écosse", value: 4.5},
  {province: "Saskatchewan", value: 4.4},
  {province: "Colombie-Britannique", value: 3.6},
  {province: "Yukon", value: -2.9}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, décembre 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-5, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([5.6], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 10,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 5.6, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Terre-Neuve-et-Labrador",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des ventes au détail

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en décembre, avec des ventes de 19,0 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 13,3 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (décembre 2024) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 19,0 G$ |
| Détaillants en alimentation et en boissons | 13,3 G$ |
| Détaillants de marchandises diverses | 9,5 G$ |
| Stations-service et vendeurs de carburant | 6,0 G$ |
| Détaillants de produits de santé et de soins personnels | 5,8 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 4,0 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Décembre 2024
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-decembre-2024", "fr"));
```
