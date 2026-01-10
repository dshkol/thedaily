---
title: Les ventes au détail en hausse de 0,4 % en août, quatre provinces affichent une croissance annuelle à deux chiffres
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail en hausse de 0,4 % en août, quatre provinces affichent une croissance annuelle à deux chiffres

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 0,4 % en août 2022 pour s'établir à 65,2 milliards de dollars
- D'une année à l'autre, les ventes étaient en hausse de 6,6 %, poursuivant une solide croissance annuelle
- Quatre provinces ont affiché une croissance à deux chiffres d'une année à l'autre : Terre-Neuve-et-Labrador, Yukon, Manitoba et Alberta
- Seuls les Territoires du Nord-Ouest ont enregistré un recul d'une année à l'autre (-0,9 %)

</div>

Les ventes au détail au Canada ont augmenté de 0,4 % en août 2022 pour s'établir à 65,2 milliards de dollars, un gain modeste après un repli en juillet. La croissance d'une année à l'autre est demeurée robuste à 6,6 %.

Août 2022 a été remarquable pour sa performance régionale exceptionnellement forte, quatre provinces ayant affiché des gains à deux chiffres d'une année à l'autre. Terre-Neuve-et-Labrador a mené à 11,5 %, suivi de près par le Yukon, le Manitoba et l'Alberta, tous au-dessus de 10 %.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-09-01"), value: 60.84},
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.89},
  {date: new Date("2022-08-01"), value: 65.16}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, septembre 2021 à août 2022 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [59, 68], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Terre-Neuve-et-Labrador en tête de la croissance provinciale

Terre-Neuve-et-Labrador a mené toutes les provinces avec une croissance exceptionnelle de 11,5 % d'une année à l'autre, suivi du Yukon à 10,9 %, du Manitoba à 10,7 % et de l'Alberta à 10,4 %. Ces quatre provinces ont toutes affiché des gains à deux chiffres.

Presque toutes les provinces ont enregistré une croissance positive d'une année à l'autre. Seuls les Territoires du Nord-Ouest ont affiché un recul, et de moins de 1 %.

```js
const provincialData = [
  {province: "Terre-Neuve-et-Labrador", value: 11.5},
  {province: "Yukon", value: 10.9},
  {province: "Manitoba", value: 10.7},
  {province: "Alberta", value: 10.4},
  {province: "Québec", value: 7.9},
  {province: "Saskatchewan", value: 7.5},
  {province: "Île-du-Prince-Édouard", value: 7.2},
  {province: "Nouveau-Brunswick", value: 6.7},
  {province: "Colombie-Britannique", value: 5.7},
  {province: "Nouvelle-Écosse", value: 4.8},
  {province: "Ontario", value: 4.6},
  {province: "Territoires du Nord-Ouest", value: -0.9}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, août 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-2, 14]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([6.6], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 6.6, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en août, avec des ventes de 16,6 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,4 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (août 2022) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 16,6 G$ |
| Détaillants en alimentation et en boissons | 11,4 G$ |
| Détaillants de marchandises diverses | 7,9 G$ |
| Stations-service et vendeurs de carburant | 6,0 G$ |
| Détaillants de produits de santé et de soins personnels | 4,8 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,5 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Août 2022
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-aout-2022", "fr"));
```
