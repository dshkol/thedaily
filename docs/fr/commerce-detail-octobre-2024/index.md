---
title: Les ventes au détail augmentent de 0,8 % en octobre, Terre-Neuve-et-Labrador en tête des gains d'une année à l'autre
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail augmentent de 0,8 % en octobre, Terre-Neuve-et-Labrador en tête des gains d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 0,8 % en octobre 2024 pour s'établir à 68,0 milliards de dollars, le troisième mois consécutif de croissance
- D'une année à l'autre, les ventes étaient en hausse de 2,3 %, Terre-Neuve-et-Labrador (+8,9 %) en tête des gains provinciaux
- Neuf des onze provinces et territoires ont affiché une croissance positive d'une année à l'autre
- La Saskatchewan (-4,0 %) a enregistré la plus forte baisse, le Yukon affichant également un léger recul (-0,1 %)

</div>

Les ventes au détail au Canada ont augmenté de 0,8 % en octobre 2024 pour s'établir à 68,0 milliards de dollars, marquant le troisième mois consécutif de croissance. D'une année à l'autre, les ventes étaient supérieures de 2,3 % à celles d'octobre 2023.

La hausse d'octobre s'est ajoutée aux gains de 0,4 % en novembre et de 0,8 % en septembre. Neuf des onze provinces et territoires ont enregistré une croissance positive d'une année à l'autre.

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
  {date: new Date("2024-10-01"), value: 68.04}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, janvier à octobre 2024 (milliards de $)",
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

Terre-Neuve-et-Labrador a mené la croissance d'une année à l'autre à 8,9 %, suivie de l'Alberta à 4,8 % et de la Nouvelle-Écosse à 3,2 %. Le Manitoba a affiché des gains de 3,0 %.

La Saskatchewan a enregistré la plus forte baisse à -4,0 %, un résultat inhabituel pour la province. Le Yukon était la seule autre administration avec une variation négative d'une année à l'autre à -0,1 %.

```js
const provincialData = [
  {province: "Terre-Neuve-et-Labrador", value: 8.9},
  {province: "Alberta", value: 4.8},
  {province: "Nouvelle-Écosse", value: 3.2},
  {province: "Manitoba", value: 3.0},
  {province: "Colombie-Britannique", value: 2.6},
  {province: "Québec", value: 2.3},
  {province: "Ontario", value: 1.7},
  {province: "Nouveau-Brunswick", value: 1.4},
  {province: "Île-du-Prince-Édouard", value: 0.0},
  {province: "Yukon", value: -0.1},
  {province: "Saskatchewan", value: -4.0}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, octobre 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-6, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([2.3], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 2.3, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en octobre, avec des ventes de 18,4 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 13,0 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (octobre 2024) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 18,4 G$ |
| Détaillants en alimentation et en boissons | 13,0 G$ |
| Détaillants de marchandises diverses | 9,2 G$ |
| Stations-service et vendeurs de carburant | 5,9 G$ |
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
**Période de référence :** Octobre 2024
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-octobre-2024", "fr"));
```
