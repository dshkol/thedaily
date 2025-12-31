---
title: Les ventes au détail atteignent un record de 66,8 milliards de dollars en juin, toutes les provinces affichent des gains solides
toc: false
---

# Les ventes au détail atteignent un record de 66,8 milliards de dollars en juin, toutes les provinces affichent des gains solides

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 1,5 % en juin 2022 pour atteindre un record de 66,8 milliards de dollars
- D'une année à l'autre, les ventes étaient en hausse de 12,0 %, la plus forte croissance annuelle des derniers mois
- Le Yukon a mené toutes les provinces avec une croissance exceptionnelle de 20,9 % d'une année à l'autre
- Toutes les provinces et tous les territoires ont enregistré des gains positifs d'une année à l'autre, dont sept au-dessus de 10 %

</div>

Les ventes au détail au Canada ont augmenté de 1,5 % en juin 2022 pour atteindre un record de 66,8 milliards de dollars, le niveau le plus élevé jamais enregistré. La croissance d'une année à l'autre était exceptionnellement forte à 12,0 %, reflétant les dépenses robustes des consommateurs.

Juin 2022 a été remarquable pour sa performance régionale universellement forte. Toutes les provinces et tous les territoires ont affiché des gains positifs d'une année à l'autre, dont sept au-dessus de 10 %. Le Yukon a mené avec une croissance exceptionnelle de 20,9 %, tandis que l'Ontario a affiché un solide 17,1 %.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-07-01"), value: 60.15},
  {date: new Date("2021-08-01"), value: 61.11},
  {date: new Date("2021-09-01"), value: 60.84},
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, juillet 2021 à juin 2022 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [58, 68], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Le Yukon en tête d'une croissance provinciale exceptionnelle

Le Yukon a mené toutes les provinces avec une croissance exceptionnelle de 20,9 % d'une année à l'autre, suivi de l'Ontario à 17,1 % et de l'Île-du-Prince-Édouard à 15,6 %. Sept provinces ont affiché des gains à deux chiffres, démontrant une vigueur généralisée.

Pour la première fois depuis longtemps, chaque province et territoire a enregistré une croissance positive d'une année à l'autre, même le moins performant (Colombie-Britannique) ayant affiché un solide gain de 6,1 %.

```js
const provincialData = [
  {province: "Yukon", value: 20.9},
  {province: "Ontario", value: 17.1},
  {province: "Île-du-Prince-Édouard", value: 15.6},
  {province: "Manitoba", value: 12.5},
  {province: "Nouveau-Brunswick", value: 11.6},
  {province: "Québec", value: 10.9},
  {province: "Saskatchewan", value: 10.4},
  {province: "Terre-Neuve-et-Labrador", value: 8.5},
  {province: "Alberta", value: 7.7},
  {province: "Nouvelle-Écosse", value: 7.3},
  {province: "Territoires du Nord-Ouest", value: 6.7},
  {province: "Colombie-Britannique", value: 6.1}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, juin 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [0, 24]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([12.0], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 12.0, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Yukon",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en juin, avec des ventes de 17,0 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,4 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (juin 2022) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,0 G$ |
| Détaillants en alimentation et en boissons | 11,4 G$ |
| Détaillants de marchandises diverses | 8,0 G$ |
| Stations-service et vendeurs de carburant | 6,3 G$ |
| Détaillants de produits de santé et de soins personnels | 4,8 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,6 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Juin 2022
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-juin-2022", "fr"));
```
