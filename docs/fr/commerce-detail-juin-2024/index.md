---
title: Les ventes au détail reculent de 0,1 % en juin, cinq provinces affichant des baisses d'une année à l'autre
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail reculent de 0,1 % en juin, cinq provinces affichant des baisses d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont légèrement reculé de 0,1 % en juin 2024 pour s'établir à 65,9 milliards de dollars, le deuxième mois consécutif de baisse
- D'une année à l'autre, les ventes étaient en baisse de 0,2 %, la première diminution annuelle de la série
- Cinq provinces ont affiché des baisses d'une année à l'autre, l'Île-du-Prince-Édouard en tête à -3,9 %
- Terre-Neuve-et-Labrador a mené les gains à 8,8 %, tandis que le Yukon a affiché un résultat positif inhabituel à 5,4 %

</div>

Les ventes au détail au Canada ont légèrement reculé de 0,1 % en juin 2024 pour s'établir à 65,9 milliards de dollars, après une baisse de 1,2 % en mai. D'une année à l'autre, les ventes étaient inférieures de 0,2 % à celles de juin 2023, marquant la première diminution annuelle de la série.

Le recul de juin s'inscrivait dans une tendance à la baisse de deux mois, les ventes ayant chuté par rapport au sommet d'avril de 66,8 milliards de dollars. Cinq provinces ont enregistré des baisses d'une année à l'autre—le nombre le plus élevé observé dans les données.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-07-01"), value: 65.89},
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
  {date: new Date("2024-06-01"), value: 65.89}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, juillet 2023 à juin 2024 (milliards de $)",
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

## Cinq provinces enregistrent des baisses d'une année à l'autre

Cinq provinces ont affiché des baisses d'une année à l'autre en juin, le nombre le plus élevé de la série. L'Île-du-Prince-Édouard a enregistré la plus forte baisse à 3,9 %, suivie de l'Ontario à 1,2 %. La Colombie-Britannique a reculé de 0,6 %, la Nouvelle-Écosse de 0,4 %, et le Manitoba de 0,1 %.

Terre-Neuve-et-Labrador a mené les gains à 8,8 %, tandis que le Yukon a affiché un résultat positif à 5,4 %—un renversement par rapport aux mois suivants où il deviendra le plus grand déclinant provincial.

```js
const provincialData = [
  {province: "Terre-Neuve-et-Labrador", value: 8.8},
  {province: "Yukon", value: 5.4},
  {province: "Saskatchewan", value: 1.2},
  {province: "Nouveau-Brunswick", value: 0.9},
  {province: "Québec", value: 0.7},
  {province: "Alberta", value: 0.5},
  {province: "Manitoba", value: -0.1},
  {province: "Nouvelle-Écosse", value: -0.4},
  {province: "Colombie-Britannique", value: -0.6},
  {province: "Ontario", value: -1.2},
  {province: "Île-du-Prince-Édouard", value: -3.9}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, juin 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-6, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([-0.2], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: -0.2, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en juin, avec des ventes de 17,9 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,6 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (juin 2024) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,9 G$ |
| Détaillants en alimentation et en boissons | 12,6 G$ |
| Détaillants de marchandises diverses | 8,8 G$ |
| Stations-service et vendeurs de carburant | 5,8 G$ |
| Détaillants de produits de santé et de soins personnels | 5,4 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,9 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Juin 2024
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-juin-2024", "fr"));
```
