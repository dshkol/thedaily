---
title: Les ventes au détail augmentent de 1,5 % en juillet, rebondissant après deux mois de baisses
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail augmentent de 1,5 % en juillet, rebondissant après deux mois de baisses

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 1,5 % en juillet 2024 pour s'établir à 66,9 milliards de dollars, rebondissant après les baisses de mai et juin
- D'une année à l'autre, les ventes étaient en hausse de 1,5 %, la Saskatchewan (+7,3 %) menant les gains provinciaux
- Trois provinces ont enregistré des baisses d'une année à l'autre : la Colombie-Britannique (-0,2 %), l'Île-du-Prince-Édouard (-0,9 %) et le Yukon (-5,6 %)
- Le gain de juillet a marqué la fin d'un repli de deux mois de l'activité commerciale

</div>

Les ventes au détail au Canada ont augmenté de 1,5 % en juillet 2024 pour s'établir à 66,9 milliards de dollars, rebondissant après des baisses de 0,1 % en juin et de 1,2 % en mai. D'une année à l'autre, les ventes étaient supérieures de 1,5 % à celles de juillet 2023.

Le rebond de juillet a suivi deux mois consécutifs de baisse, ramenant les ventes à des niveaux observés pour la dernière fois en avril. Huit provinces et territoires ont affiché des gains d'une année à l'autre.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-08-01"), value: 65.93},
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
  {date: new Date("2024-07-01"), value: 66.89}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, août 2023 à juillet 2024 (milliards de $)",
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

## La Saskatchewan en tête des gains provinciaux, trois provinces en baisse

La Saskatchewan a mené la croissance d'une année à l'autre à 7,3 %, suivie de Terre-Neuve-et-Labrador à 5,9 % et de l'Alberta à 5,3 %. Les provinces des Prairies ont affiché une force particulière, le Manitoba enregistrant également des gains de 3,1 %.

Trois provinces ont enregistré des baisses d'une année à l'autre. La Colombie-Britannique a affiché une diminution marginale de 0,2 %, tandis que l'Île-du-Prince-Édouard a reculé de 0,9 %. Le Yukon a poursuivi sa tendance à la baisse avec un repli de 5,6 %.

```js
const provincialData = [
  {province: "Saskatchewan", value: 7.3},
  {province: "Terre-Neuve-et-Labrador", value: 5.9},
  {province: "Alberta", value: 5.3},
  {province: "Nouvelle-Écosse", value: 3.2},
  {province: "Manitoba", value: 3.1},
  {province: "Québec", value: 1.2},
  {province: "Nouveau-Brunswick", value: 0.4},
  {province: "Ontario", value: 0.3},
  {province: "Colombie-Britannique", value: -0.2},
  {province: "Île-du-Prince-Édouard", value: -0.9},
  {province: "Yukon", value: -5.6}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, juillet 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-8, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.5], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 1.5, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en juillet, avec des ventes de 18,0 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,7 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (juillet 2024) |
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
**Période de référence :** Juillet 2024
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-juillet-2024", "fr"));
```
