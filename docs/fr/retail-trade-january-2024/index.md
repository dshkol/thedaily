---
title: Les ventes au détail reculent de 0,4 % en janvier, première baisse d'une année à l'autre
toc: false
---

# Les ventes au détail reculent de 0,4 % en janvier, première baisse d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont reculé de 0,4 % en janvier 2024 pour s'établir à 66,1 milliards de dollars, en baisse par rapport au sommet des Fêtes de décembre
- D'une année à l'autre, les ventes étaient en baisse de 0,3 %—la première baisse annuelle enregistrée dans la série
- Cinq provinces ont affiché des baisses d'une année à l'autre, le recul de 5,0 % de l'Alberta étant le plus marqué
- Le Nouveau-Brunswick a mené toutes les provinces avec une croissance de 10,3 %

</div>

Les ventes au détail au Canada ont reculé de 0,4 % en janvier 2024 pour s'établir à 66,1 milliards de dollars, en baisse par rapport au sommet des achats des Fêtes de décembre. D'une année à l'autre, les ventes étaient inférieures de 0,3 % à celles de janvier 2023—marquant la première baisse annuelle enregistrée dans la série du commerce de détail.

Janvier 2024 a été marqué par une divergence notable entre l'Atlantique et l'Ouest canadien. Le Nouveau-Brunswick a affiché une croissance exceptionnelle de 10,3 %, en tête de toutes les provinces, tandis que l'Alberta (-5,0 %) et la Colombie-Britannique (-4,7 %) ont enregistré les reculs les plus marqués.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-02-01"), value: 65.67},
  {date: new Date("2023-03-01"), value: 65.35},
  {date: new Date("2023-04-01"), value: 65.63},
  {date: new Date("2023-05-01"), value: 65.66},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.89},
  {date: new Date("2023-08-01"), value: 65.93},
  {date: new Date("2023-09-01"), value: 66.58},
  {date: new Date("2023-10-01"), value: 66.51},
  {date: new Date("2023-11-01"), value: 66.56},
  {date: new Date("2023-12-01"), value: 66.32},
  {date: new Date("2024-01-01"), value: 66.08}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, février 2023 à janvier 2024 (milliards de $)",
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

## Le Nouveau-Brunswick en tête des gains, l'Alberta à la traîne

Le Nouveau-Brunswick a mené toutes les provinces avec une croissance de 10,3 % d'une année à l'autre, la seule province à afficher des gains à deux chiffres en janvier. L'Île-du-Prince-Édouard a suivi à 3,5 %, avec la Nouvelle-Écosse à 3,4 %.

Cinq provinces ont enregistré des baisses d'une année à l'autre. Le recul de 5,0 % de l'Alberta était le plus marqué, suivi de la Colombie-Britannique à -4,7 % et de la Saskatchewan à -3,4 %. Terre-Neuve-et-Labrador (-2,8 %) et le Manitoba (-1,9 %) ont complété la liste des provinces en déclin.

```js
const provincialData = [
  {province: "Nouveau-Brunswick", value: 10.3},
  {province: "Île-du-Prince-Édouard", value: 3.5},
  {province: "Nouvelle-Écosse", value: 3.4},
  {province: "Yukon", value: 3.3},
  {province: "Ontario", value: 1.9},
  {province: "Québec", value: 0.9},
  {province: "Manitoba", value: -1.9},
  {province: "Terre-Neuve-et-Labrador", value: -2.8},
  {province: "Saskatchewan", value: -3.4},
  {province: "Colombie-Britannique", value: -4.7},
  {province: "Alberta", value: -5.0}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, janvier 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-8, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([-0.3], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: -0.3, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en janvier, avec des ventes de 17,4 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,2 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (janvier 2024) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,4 G$ |
| Détaillants en alimentation et en boissons | 12,2 G$ |
| Détaillants de marchandises diverses | 8,5 G$ |
| Stations-service et vendeurs de carburant | 5,6 G$ |
| Détaillants de produits de santé et de soins personnels | 5,2 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,6 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Janvier 2024
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-january-2024", "fr"));
```
