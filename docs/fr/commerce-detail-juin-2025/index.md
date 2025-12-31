---
title: Les ventes au détail augmentent de 1,4 % en juin, la plus forte hausse mensuelle depuis avril
toc: false
---

# Les ventes au détail augmentent de 1,4 % en juin, la plus forte hausse mensuelle depuis avril

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 1,4 % en juin 2025 pour s'établir à 70,1 milliards de dollars, la plus forte hausse mensuelle depuis avril
- D'une année à l'autre, les ventes étaient en hausse de 6,4 %, la Colombie-Britannique (+9,7 %) en tête des gains provinciaux
- Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur à 19,2 milliards de dollars
- Le Yukon était la seule administration à enregistrer une baisse d'une année à l'autre (-4,5 %)

</div>

Les ventes au détail au Canada ont augmenté de 1,4 % en juin 2025 pour s'établir à 70,1 milliards de dollars, se remettant du recul de 1,4 % enregistré en mai. Il s'agissait de la plus forte hausse mensuelle depuis avril. D'une année à l'autre, les ventes étaient supérieures de 6,4 % à celles de juin 2024.

La hausse de juin était généralisée dans tous les sous-secteurs du commerce de détail. Les concessionnaires de véhicules automobiles et de pièces ont mené les ventes à 19,2 milliards de dollars, tandis que les détaillants en alimentation et en boissons ont enregistré 13,4 milliards de dollars.

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
  {date: new Date("2024-12-01"), value: 70.03},
  {date: new Date("2025-01-01"), value: 69.65},
  {date: new Date("2025-02-01"), value: 69.19},
  {date: new Date("2025-03-01"), value: 69.80},
  {date: new Date("2025-04-01"), value: 70.02},
  {date: new Date("2025-05-01"), value: 69.16},
  {date: new Date("2025-06-01"), value: 70.14}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, janvier 2024 à juin 2025 (milliards de $)",
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

## La Colombie-Britannique en tête des gains d'une année à l'autre

La Colombie-Britannique a enregistré la plus forte croissance des ventes d'une année à l'autre parmi les provinces, soit 9,7 %, les ventes atteignant 9,8 milliards de dollars. L'Ontario (+6,9 %) et le Manitoba (+6,4 %) ont également affiché des gains supérieurs à la moyenne.

Le Yukon était la seule administration à enregistrer une baisse d'une année à l'autre, soit -4,5 %. Les dix provinces ont toutes affiché des ventes supérieures à celles de juin 2024.

```js
const provincialData = [
  {province: "Colombie-Britannique", value: 9.7},
  {province: "Ontario", value: 6.9},
  {province: "Manitoba", value: 6.4},
  {province: "Nouveau-Brunswick", value: 6.1},
  {province: "Île-du-Prince-Édouard", value: 5.6},
  {province: "Alberta", value: 5.6},
  {province: "Québec", value: 5.0},
  {province: "Terre-Neuve-et-Labrador", value: 4.6},
  {province: "Nouvelle-Écosse", value: 4.6},
  {province: "Saskatchewan", value: 4.1},
  {province: "Yukon", value: -4.5}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, juin 2025 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-6, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([6.4], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 12,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 6.4, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Colombie-Britannique",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles demeurent le plus important sous-secteur

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en juin, avec des ventes de 19,2 milliards de dollars. Les concessionnaires d'automobiles ont représenté la majorité à 16,8 milliards de dollars.

Les détaillants en alimentation et en boissons, le deuxième sous-secteur en importance, ont enregistré des ventes de 13,4 milliards de dollars. Les détaillants de marchandises diverses ont suivi à 9,4 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (juin 2025) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 19,2 G$ |
| Détaillants en alimentation et en boissons | 13,4 G$ |
| Détaillants de marchandises diverses | 9,4 G$ |
| Stations-service et vendeurs de carburant | 6,1 G$ |
| Détaillants de produits de santé et de soins personnels | 6,0 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 4,1 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Juin 2025
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-juin-2025", "fr"));
```
