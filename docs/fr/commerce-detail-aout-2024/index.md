---
title: Les ventes au détail augmentent de 0,3 % en août, le Yukon affiche la plus forte baisse provinciale à 9,0 %
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail augmentent de 0,3 % en août, le Yukon affiche la plus forte baisse provinciale à 9,0 %

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 0,3 % en août 2024 pour s'établir à 67,1 milliards de dollars, le deuxième mois consécutif de croissance
- D'une année à l'autre, les ventes étaient en hausse de 1,8 %, Terre-Neuve-et-Labrador (+11,3 %) poursuivant sa croissance à deux chiffres
- Deux provinces ont enregistré des baisses d'une année à l'autre : la Colombie-Britannique (-0,1 %) et le Yukon (-9,0 %)
- La baisse de 9,0 % du Yukon était la plus forte baisse provinciale observée dans la série historique

</div>

Les ventes au détail au Canada ont augmenté de 0,3 % en août 2024 pour s'établir à 67,1 milliards de dollars, s'appuyant sur le gain de 1,5 % enregistré en juillet. D'une année à l'autre, les ventes étaient supérieures de 1,8 % à celles d'août 2023.

La hausse d'août a marqué le deuxième mois consécutif de croissance après une baisse de deux mois en mai et juin. Neuf des onze provinces et territoires ont affiché des gains d'une année à l'autre.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-09-01"), value: 66.58},
  {date: new Date("2023-10-01"), value: 66.51},
  {date: new Date("2023-11-01"), value: 66.56},
  {date: new Date("2023-12-01"), value: 66.32},
  {date: new Date("2024-01-01"), value: 66.08},
  {date: new Date("2024-02-01"), value: 66.24},
  {date: new Date("2024-03-01"), value: 66.16},
  {date: new Date("2024-04-01"), value: 66.78},
  {date: new Date("2024-05-01"), value: 65.96},
  {date: new Date("2024-06-01"), value: 65.89},
  {date: new Date("2024-07-01"), value: 66.89},
  {date: new Date("2024-08-01"), value: 67.10}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, septembre 2023 à août 2024 (milliards de $)",
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

## Terre-Neuve-et-Labrador en tête des gains provinciaux, le Yukon enregistre une forte baisse

Terre-Neuve-et-Labrador a mené la croissance d'une année à l'autre à 11,3 %, maintenant sa position de seule province avec une croissance à deux chiffres pour le deuxième mois consécutif. Le Nouveau-Brunswick a suivi à 4,4 %, avec la Saskatchewan à 3,2 %.

Deux provinces ont enregistré des baisses d'une année à l'autre. La Colombie-Britannique a affiché une diminution marginale de 0,1 %, tandis que le Yukon a enregistré une baisse de 9,0 % — la plus forte baisse provinciale observée dans l'ensemble de la série historique.

```js
const provincialData = [
  {province: "Terre-Neuve-et-Labrador", value: 11.3},
  {province: "Nouveau-Brunswick", value: 4.4},
  {province: "Saskatchewan", value: 3.2},
  {province: "Nouvelle-Écosse", value: 2.9},
  {province: "Manitoba", value: 2.4},
  {province: "Québec", value: 2.2},
  {province: "Alberta", value: 2.0},
  {province: "Île-du-Prince-Édouard", value: 1.9},
  {province: "Ontario", value: 1.3},
  {province: "Colombie-Britannique", value: -0.1},
  {province: "Yukon", value: -9.0}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, août 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-12, 14]},
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
      x: 14,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.8, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en août, avec des ventes de 18,0 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,7 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (août 2024) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 18,0 G$ |
| Détaillants en alimentation et en boissons | 12,7 G$ |
| Détaillants de marchandises diverses | 8,9 G$ |
| Stations-service et vendeurs de carburant | 5,8 G$ |
| Détaillants de produits de santé et de soins personnels | 5,5 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,9 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Août 2024
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-aout-2024", "fr"));
```
