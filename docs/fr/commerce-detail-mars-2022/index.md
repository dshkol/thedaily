---
title: Les ventes au détail augmentent de 1,1 % en mars pour atteindre 64,1 milliards de dollars, en hausse de 3,8 % d'une année à l'autre
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail augmentent de 1,1 % en mars pour atteindre 64,1 milliards de dollars, en hausse de 3,8 % d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 1,1 % en mars 2022 pour atteindre 64,1 milliards de dollars
- D'une année à l'autre, les ventes étaient en hausse de 3,8 %, un rythme plus modéré à mesure que les effets de base se normalisaient
- La Saskatchewan a mené toutes les provinces avec une croissance de 7,2 % d'une année à l'autre
- Seuls les Territoires du Nord-Ouest ont affiché une baisse d'une année à l'autre

</div>

Les ventes au détail au Canada ont augmenté de 1,1 % en mars 2022 pour atteindre 64,1 milliards de dollars. La croissance d'une année à l'autre s'est modérée à 3,8 %, reflétant une comparaison plus normalisée puisque la base de mars 2021 était moins affectée par les restrictions pandémiques qu'avril ou mai 2021.

La performance provinciale était relativement équilibrée en mars, avec la Saskatchewan en tête à 7,2 % de croissance d'une année à l'autre. Le Nouveau-Brunswick (+7,0 %) et Terre-Neuve-et-Labrador (+6,6 %) ont également affiché des gains solides. Toutes les provinces et tous les territoires sauf les Territoires du Nord-Ouest ont enregistré une croissance positive d'une année à l'autre.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-04-01"), value: 58.40},
  {date: new Date("2021-05-01"), value: 56.95},
  {date: new Date("2021-06-01"), value: 59.65},
  {date: new Date("2021-07-01"), value: 60.15},
  {date: new Date("2021-08-01"), value: 61.11},
  {date: new Date("2021-09-01"), value: 60.84},
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, avril 2021 à mars 2022 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [54, 66], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## La Saskatchewan en tête de la croissance provinciale

La Saskatchewan a mené toutes les provinces avec une croissance de 7,2 % d'une année à l'autre, suivie de près par le Nouveau-Brunswick à 7,0 % et Terre-Neuve-et-Labrador à 6,6 %. L'Alberta a également affiché un solide gain de 6,5 %.

La plupart des provinces ont enregistré une croissance positive d'une année à l'autre, seuls les Territoires du Nord-Ouest ayant affiché une baisse (-9,0 %).

```js
const provincialData = [
  {province: "Saskatchewan", value: 7.2},
  {province: "Nouveau-Brunswick", value: 7.0},
  {province: "Terre-Neuve-et-Labrador", value: 6.6},
  {province: "Alberta", value: 6.5},
  {province: "Yukon", value: 5.6},
  {province: "Ontario", value: 5.1},
  {province: "Nouvelle-Écosse", value: 4.2},
  {province: "Île-du-Prince-Édouard", value: 4.2},
  {province: "Manitoba", value: 1.8},
  {province: "Colombie-Britannique", value: 1.5},
  {province: "Nunavut", value: 1.1},
  {province: "Québec", value: 0.9},
  {province: "Territoires du Nord-Ouest", value: -9.0}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, mars 2022 (%)",
  width: 680,
  height: 380,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-10, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([3.8], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 3.8, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Saskatchewan",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en mars, avec des ventes de 16,0 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,0 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (mars 2022) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 16,0 G$ |
| Détaillants en alimentation et en boissons | 11,0 G$ |
| Détaillants de marchandises diverses | 7,7 G$ |
| Stations-service et vendeurs de carburant | 5,8 G$ |
| Détaillants de produits de santé et de soins personnels | 4,7 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,4 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Mars 2022
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-mars-2022", "fr"));
```
