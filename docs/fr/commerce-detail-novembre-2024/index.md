---
title: Les ventes au détail progressent de 0,4 % en novembre alors que les achats des Fêtes commencent
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail progressent de 0,4 % en novembre alors que les achats des Fêtes commencent

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 0,4 % en novembre 2024 pour s'établir à 68,3 milliards de dollars, les achats des Fêtes ayant commencé
- D'une année à l'autre, les ventes étaient en hausse de 2,6 %, Terre-Neuve-et-Labrador (+9,2 %) en tête des gains provinciaux
- Huit des onze provinces et territoires ont affiché une croissance positive d'une année à l'autre
- L'Île-du-Prince-Édouard (-5,3 %) et le Nouveau-Brunswick (-2,9 %) ont enregistré les plus fortes baisses

</div>

Les ventes au détail au Canada ont augmenté de 0,4 % en novembre 2024 pour s'établir à 68,3 milliards de dollars, les achats des Fêtes ayant commencé à stimuler les dépenses des consommateurs. D'une année à l'autre, les ventes étaient supérieures de 2,6 % à celles de novembre 2023.

La hausse de novembre a fait suite à un gain de 0,4 % en octobre. Huit des onze provinces et territoires ont enregistré une croissance positive d'une année à l'autre, bien que trois régions de l'Atlantique et du Nord aient connu des baisses.

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
  {date: new Date("2024-11-01"), value: 68.30}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, janvier à novembre 2024 (milliards de $)",
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

## Terre-Neuve-et-Labrador en tête des gains provinciaux

Terre-Neuve-et-Labrador a mené la croissance d'une année à l'autre à 9,2 %, suivie de l'Alberta à 4,4 % et de la Saskatchewan à 3,4 %. La Nouvelle-Écosse a affiché des gains de 3,3 %.

L'Île-du-Prince-Édouard a enregistré la plus forte baisse à -5,3 %, suivie du Nouveau-Brunswick à -2,9 % et du Yukon à -2,8 %. Ce mois s'est distingué par trois régions affichant des variations négatives d'une année à l'autre.

```js
const provincialData = [
  {province: "Terre-Neuve-et-Labrador", value: 9.2},
  {province: "Alberta", value: 4.4},
  {province: "Saskatchewan", value: 3.4},
  {province: "Nouvelle-Écosse", value: 3.3},
  {province: "Ontario", value: 2.5},
  {province: "Québec", value: 2.4},
  {province: "Manitoba", value: 2.0},
  {province: "Colombie-Britannique", value: 1.9},
  {province: "Yukon", value: -2.8},
  {province: "Nouveau-Brunswick", value: -2.9},
  {province: "Île-du-Prince-Édouard", value: -5.3}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, novembre 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-8, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([2.6], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 2.6, label: "Moyenne canadienne"}], {
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

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en novembre, avec des ventes de 18,6 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 13,1 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (novembre 2024) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 18,6 G$ |
| Détaillants en alimentation et en boissons | 13,1 G$ |
| Détaillants de marchandises diverses | 9,2 G$ |
| Stations-service et vendeurs de carburant | 5,8 G$ |
| Détaillants de produits de santé et de soins personnels | 5,7 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,9 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Novembre 2024
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-novembre-2024", "fr"));
```
