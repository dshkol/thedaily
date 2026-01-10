---
title: Les ventes au détail reculent de 0,9 % en juillet, les ventes de véhicules automobiles en baisse
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail reculent de 0,9 % en juillet, les ventes de véhicules automobiles en baisse

<p class="release-date">Diffusion : 28 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont diminué de 0,9 % en juillet 2025 pour s'établir à 69,5 milliards de dollars, après une hausse de 1,4 % en juin
- D'une année à l'autre, les ventes étaient en hausse de 4,0 %, la Colombie-Britannique (+6,6 %) en tête des gains provinciaux
- Les concessionnaires de véhicules automobiles et de pièces ont enregistré la plus forte baisse en dollars, perdant 579 millions de dollars par rapport à juin
- Trois provinces ont affiché des baisses d'une année à l'autre : Terre-Neuve-et-Labrador (-2,1 %), Yukon (-1,2 %) et Saskatchewan (-0,9 %)

</div>

Les ventes au détail au Canada ont reculé de 0,9 % en juillet 2025 pour s'établir à 69,5 milliards de dollars, contrebalançant en partie la hausse de 1,4 % enregistrée en juin. Malgré le recul mensuel, les ventes étaient supérieures de 4,0 % à celles de juillet 2024.

La baisse de juillet était généralisée, 7 des 11 sous-secteurs du commerce de détail ayant enregistré des ventes plus faibles. Les concessionnaires de véhicules automobiles et de pièces ont affiché la plus forte baisse en dollars, tandis que les détaillants en alimentation et en boissons ont fait exception avec une légère hausse.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2024-01-01"), value: 67.28},
  {date: new Date("2024-02-01"), value: 67.44},
  {date: new Date("2024-03-01"), value: 67.02},
  {date: new Date("2024-04-01"), value: 66.89},
  {date: new Date("2024-05-01"), value: 66.74},
  {date: new Date("2024-06-01"), value: 67.40},
  {date: new Date("2024-07-01"), value: 66.87},
  {date: new Date("2024-08-01"), value: 67.03},
  {date: new Date("2024-09-01"), value: 67.45},
  {date: new Date("2024-10-01"), value: 67.89},
  {date: new Date("2024-11-01"), value: 68.30},
  {date: new Date("2024-12-01"), value: 70.03},
  {date: new Date("2025-01-01"), value: 69.65},
  {date: new Date("2025-02-01"), value: 69.19},
  {date: new Date("2025-03-01"), value: 69.80},
  {date: new Date("2025-04-01"), value: 70.02},
  {date: new Date("2025-05-01"), value: 69.16},
  {date: new Date("2025-06-01"), value: 70.14},
  {date: new Date("2025-07-01"), value: 69.53}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, janvier 2024 à juillet 2025 (milliards de $)",
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

## La Colombie-Britannique en tête des gains d'une année à l'autre

La Colombie-Britannique a enregistré la plus forte croissance des ventes d'une année à l'autre parmi les provinces, soit 6,6 %, les ventes atteignant 9,6 milliards de dollars. L'Ontario (+4,5 %) et le Québec (+3,6 %) ont également affiché des gains supérieurs à la moyenne.

Trois administrations ont enregistré des baisses d'une année à l'autre : Terre-Neuve-et-Labrador (-2,1 %), Yukon (-1,2 %) et Saskatchewan (-0,9 %). Il s'agissait des seules régions à afficher des ventes inférieures à celles de juillet 2024.

```js
const provincialData = [
  {province: "Colombie-Britannique", value: 6.6},
  {province: "Île-du-Prince-Édouard", value: 5.3},
  {province: "Nouveau-Brunswick", value: 4.6},
  {province: "Ontario", value: 4.5},
  {province: "Québec", value: 3.6},
  {province: "Manitoba", value: 3.4},
  {province: "Nouvelle-Écosse", value: 3.3},
  {province: "Alberta", value: 2.6},
  {province: "Saskatchewan", value: -0.9},
  {province: "Yukon", value: -1.2},
  {province: "Terre-Neuve-et-Labrador", value: -2.1}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, juillet 2025 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-4, 8]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([4.0], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 8,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 4.0, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Colombie-Britannique",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles enregistrent la plus forte baisse

Les concessionnaires de véhicules automobiles et de pièces ont mené le recul en juillet, les ventes passant de 19,9 milliards de dollars en juin à 19,3 milliards de dollars. Les concessionnaires d'automobiles ont représenté la majeure partie de cette baisse.

Les détaillants en alimentation et en boissons, le deuxième sous-secteur en importance, ont enregistré une légère hausse pour atteindre 13,2 milliards de dollars. Les épiceries et les dépanneurs ont été à l'origine du gain.

| Sous-secteur du commerce de détail | Ventes (juillet 2025) | Variation par rapport à juin |
|---|---:|---:|
| Concessionnaires de véhicules automobiles et de pièces | 19,3 G$ | -3,0 % |
| Détaillants en alimentation et en boissons | 13,2 G$ | +0,5 % |
| Détaillants de marchandises diverses | 9,4 G$ | -0,8 % |
| Stations-service et vendeurs de carburant | 6,1 G$ | -1,6 % |
| Détaillants de produits de santé et de soins personnels | 6,0 G$ | +0,2 % |
| Marchands de matériaux de construction et d'équipement de jardin | 4,0 G$ | -2,3 % |
| Détaillants de vêtements et d'accessoires | 3,0 G$ | -1,1 % |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Juillet 2025
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-juillet-2025", "fr"));
```
