---
title: Les ventes au détail augmentent de 0,9 % en mars, Terre-Neuve-et-Labrador en tête des gains d'une année à l'autre
toc: false
---

# Les ventes au détail augmentent de 0,9 % en mars, Terre-Neuve-et-Labrador en tête des gains d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 0,9 % en mars 2025 pour s'établir à 69,8 milliards de dollars, après un recul de 0,9 % en février
- D'une année à l'autre, les ventes étaient en hausse de 5,5 %, Terre-Neuve-et-Labrador (+10,3 %) en tête des gains provinciaux
- Dix des onze administrations ont enregistré une croissance positive d'une année à l'autre
- Le Yukon était la seule administration à afficher une baisse d'une année à l'autre (-2,4 %)

</div>

Les ventes au détail au Canada ont augmenté de 0,9 % en mars 2025 pour s'établir à 69,8 milliards de dollars, renversant le recul de 0,9 % enregistré en février. D'une année à l'autre, les ventes étaient supérieures de 5,5 % à celles de mars 2024.

La hausse de mars a mis fin à un mois de recul. Dix des onze provinces et territoires ont enregistré une croissance positive d'une année à l'autre, Terre-Neuve-et-Labrador en tête des gains à 10,3 %.

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
  {date: new Date("2025-03-01"), value: 69.80}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, janvier 2024 à mars 2025 (milliards de $)",
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

Terre-Neuve-et-Labrador a mené la croissance des ventes d'une année à l'autre à 10,3 %, suivie de la Saskatchewan à 7,7 %. Le Nouveau-Brunswick a affiché le troisième gain le plus élevé à 7,2 %.

Le Yukon était la seule administration à enregistrer une baisse d'une année à l'autre, soit -2,4 %. L'Île-du-Prince-Édouard a affiché le plus petit gain parmi les provinces à 2,0 %.

```js
const provincialData = [
  {province: "Terre-Neuve-et-Labrador", value: 10.3},
  {province: "Saskatchewan", value: 7.7},
  {province: "Nouveau-Brunswick", value: 7.2},
  {province: "Alberta", value: 7.1},
  {province: "Manitoba", value: 6.7},
  {province: "Colombie-Britannique", value: 5.6},
  {province: "Nouvelle-Écosse", value: 5.2},
  {province: "Ontario", value: 5.0},
  {province: "Québec", value: 4.5},
  {province: "Île-du-Prince-Édouard", value: 2.0},
  {province: "Yukon", value: -2.4}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, mars 2025 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-5, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([5.5], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 5.5, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en mars, avec des ventes de 19,2 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 13,2 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (mars 2025) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 19,2 G$ |
| Détaillants en alimentation et en boissons | 13,2 G$ |
| Détaillants de marchandises diverses | 9,4 G$ |
| Stations-service et vendeurs de carburant | 6,2 G$ |
| Détaillants de produits de santé et de soins personnels | 5,8 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 4,2 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Mars 2025
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-mars-2025", "fr"));
```
