---
title: Les ventes au détail en hausse de 0,8 % en octobre, toutes les provinces affichent des gains annuels
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail en hausse de 0,8 % en octobre, toutes les provinces affichent des gains annuels

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 0,8 % en octobre 2022 pour s'établir à 65,4 milliards de dollars
- D'une année à l'autre, les ventes étaient en hausse de 6,1 %, un solide rythme de croissance annuelle
- Le Nouveau-Brunswick a mené toutes les provinces avec une croissance de 11,6 % d'une année à l'autre
- Toutes les provinces et tous les territoires ont enregistré des gains positifs d'une année à l'autre

</div>

Les ventes au détail au Canada ont augmenté de 0,8 % en octobre 2022 pour s'établir à 65,4 milliards de dollars, rebondissant après un léger recul en septembre. La croissance d'une année à l'autre était robuste à 6,1 %, reflétant les dépenses continues des consommateurs.

Octobre 2022 a été remarquable pour sa performance régionale universellement positive, chaque province et territoire ayant affiché des gains d'une année à l'autre. Le Canada atlantique a mené la croissance, le Nouveau-Brunswick et l'Île-du-Prince-Édouard affichant des gains exceptionnels.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.89},
  {date: new Date("2022-08-01"), value: 65.16},
  {date: new Date("2022-09-01"), value: 64.85},
  {date: new Date("2022-10-01"), value: 65.40}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, novembre 2021 à octobre 2022 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [60, 68], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Le Canada atlantique en tête de la croissance

Le Nouveau-Brunswick a mené toutes les provinces avec une croissance exceptionnelle de 11,6 % d'une année à l'autre, suivi de l'Île-du-Prince-Édouard à 9,2 % et de Terre-Neuve-et-Labrador à 8,3 %. La Saskatchewan et le Manitoba ont également affiché de solides gains supérieurs à 7 %.

Pour la première fois depuis plusieurs mois, chaque province et territoire a enregistré une croissance positive d'une année à l'autre, même le moins performant (Territoires du Nord-Ouest) ayant affiché un gain de 2,6 %.

```js
const provincialData = [
  {province: "Nouveau-Brunswick", value: 11.6},
  {province: "Île-du-Prince-Édouard", value: 9.2},
  {province: "Terre-Neuve-et-Labrador", value: 8.3},
  {province: "Saskatchewan", value: 8.2},
  {province: "Manitoba", value: 7.9},
  {province: "Québec", value: 7.3},
  {province: "Nouvelle-Écosse", value: 7.0},
  {province: "Yukon", value: 6.4},
  {province: "Alberta", value: 6.2},
  {province: "Ontario", value: 5.5},
  {province: "Colombie-Britannique", value: 3.7},
  {province: "Territoires du Nord-Ouest", value: 2.6}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, octobre 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [0, 14]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([6.1], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: "value",
      y: "province",
      text: d => "+" + d.value.toFixed(1).replace(".", ",") + " %",
      dx: 4,
      textAnchor: "start",
      fontSize: 10
    }),
    Plot.text([{x: 6.1, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en octobre, avec des ventes de 16,8 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,5 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (octobre 2022) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 16,8 G$ |
| Détaillants en alimentation et en boissons | 11,5 G$ |
| Détaillants de marchandises diverses | 8,0 G$ |
| Stations-service et vendeurs de carburant | 6,0 G$ |
| Détaillants de produits de santé et de soins personnels | 4,9 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,4 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Octobre 2022
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-octobre-2022", "fr"));
```
