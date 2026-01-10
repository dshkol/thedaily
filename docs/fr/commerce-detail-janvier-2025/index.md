---
title: Les ventes au détail reculent de 0,5 % en janvier, Terre-Neuve-et-Labrador en tête des gains d'une année à l'autre
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail reculent de 0,5 % en janvier, Terre-Neuve-et-Labrador en tête des gains d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont diminué de 0,5 % en janvier 2025 pour s'établir à 69,7 milliards de dollars, après le sommet des Fêtes de décembre
- D'une année à l'autre, les ventes étaient en hausse de 5,4 %, Terre-Neuve-et-Labrador (+12,8 %) en tête des gains provinciaux
- Toutes les onze provinces et territoires ont enregistré une croissance positive d'une année à l'autre
- L'Île-du-Prince-Édouard a affiché le plus petit gain à 0,5 %

</div>

Les ventes au détail au Canada ont diminué de 0,5 % en janvier 2025 pour s'établir à 69,7 milliards de dollars, après le sommet des Fêtes de 70,0 milliards de dollars en décembre. D'une année à l'autre, les ventes étaient supérieures de 5,4 % à celles de janvier 2024.

Le recul de janvier était un ajustement typique suivant les fortes ventes des Fêtes de décembre. Toutes les onze provinces et territoires ont enregistré une croissance positive d'une année à l'autre, Terre-Neuve-et-Labrador en tête à 12,8 %.

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
  {date: new Date("2025-01-01"), value: 69.65}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, janvier 2024 à janvier 2025 (milliards de $)",
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

Terre-Neuve-et-Labrador a mené la croissance des ventes d'une année à l'autre à 12,8 %, le taux de croissance provincial le plus élevé. La Colombie-Britannique a suivi à 9,9 %, la Saskatchewan et l'Alberta affichant toutes deux des gains supérieurs à 7 %.

Toutes les provinces ont enregistré une croissance positive d'une année à l'autre en janvier 2025, l'Île-du-Prince-Édouard affichant le plus petit gain à 0,5 %.

```js
const provincialData = [
  {province: "Terre-Neuve-et-Labrador", value: 12.8},
  {province: "Colombie-Britannique", value: 9.9},
  {province: "Saskatchewan", value: 7.3},
  {province: "Alberta", value: 7.3},
  {province: "Manitoba", value: 5.0},
  {province: "Québec", value: 4.3},
  {province: "Nouvelle-Écosse", value: 4.2},
  {province: "Ontario", value: 3.7},
  {province: "Nouveau-Brunswick", value: 3.2},
  {province: "Yukon", value: 2.8},
  {province: "Île-du-Prince-Édouard", value: 0.5}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, janvier 2025 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-2, 15]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([5.4], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 15,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 5.4, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en janvier, avec des ventes de 18,7 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,9 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (janvier 2025) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 18,7 G$ |
| Détaillants en alimentation et en boissons | 12,9 G$ |
| Détaillants de marchandises diverses | 9,1 G$ |
| Stations-service et vendeurs de carburant | 5,9 G$ |
| Détaillants de produits de santé et de soins personnels | 5,6 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,9 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Janvier 2025
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-janvier-2025", "fr"));
```
