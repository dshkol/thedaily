---
title: Les ventes au détail progressent de 0,2 % en février, l'Alberta affiche le recul le plus marqué
toc: false
---

# Les ventes au détail progressent de 0,2 % en février, l'Alberta affiche le recul le plus marqué

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont progressé de 0,2 % en février 2024 pour s'établir à 66,2 milliards de dollars, après le recul de janvier
- D'une année à l'autre, les ventes étaient en hausse de 0,9 %, le Yukon en tête des gains à 7,9 %
- Trois provinces ont affiché des baisses d'une année à l'autre : le Nouveau-Brunswick, l'Île-du-Prince-Édouard et l'Alberta
- L'Alberta a enregistré le recul le plus marqué à -2,9 %, la seule province avec une baisse supérieure à 2 points de pourcentage

</div>

Les ventes au détail au Canada ont progressé de 0,2 % en février 2024 pour s'établir à 66,2 milliards de dollars, un modeste rebond après le recul de janvier. D'une année à l'autre, les ventes étaient supérieures de 0,9 % à celles de février 2023.

Février 2024 a vu l'Alberta émerger comme un retardataire notable, affichant le recul d'une année à l'autre le plus marqué à -2,9 %—nettement en deçà de la moyenne nationale. Pendant ce temps, le Yukon a poursuivi sa forte performance, en tête de toutes les provinces avec un gain de 7,9 %.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-03-01"), value: 65.39},
  {date: new Date("2023-04-01"), value: 65.60},
  {date: new Date("2023-05-01"), value: 65.70},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.90},
  {date: new Date("2023-08-01"), value: 65.90},
  {date: new Date("2023-09-01"), value: 66.60},
  {date: new Date("2023-10-01"), value: 66.50},
  {date: new Date("2023-11-01"), value: 66.60},
  {date: new Date("2023-12-01"), value: 66.30},
  {date: new Date("2024-01-01"), value: 66.10},
  {date: new Date("2024-02-01"), value: 66.24}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, mars 2023 à février 2024 (milliards de $)",
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

## Le Yukon en tête des gains, l'Alberta à la traîne

Le Yukon a mené toutes les provinces avec une croissance de 7,9 % d'une année à l'autre, poursuivant sa série de fortes performances. Terre-Neuve-et-Labrador a suivi à 4,7 %, avec la Saskatchewan à 3,6 %.

Trois provinces ont enregistré des baisses d'une année à l'autre. Le recul de 2,9 % de l'Alberta était le plus marqué, suivi de l'Île-du-Prince-Édouard à -1,4 % et du Nouveau-Brunswick à -1,2 %. Ce sont les seules provinces ayant affiché une croissance négative d'une année à l'autre.

```js
const provincialData = [
  {province: "Yukon", value: 7.9},
  {province: "Terre-Neuve-et-Labrador", value: 4.7},
  {province: "Saskatchewan", value: 3.6},
  {province: "Nouvelle-Écosse", value: 3.3},
  {province: "Colombie-Britannique", value: 3.1},
  {province: "Ontario", value: 1.3},
  {province: "Manitoba", value: 0.6},
  {province: "Québec", value: 0.3},
  {province: "Nouveau-Brunswick", value: -1.2},
  {province: "Île-du-Prince-Édouard", value: -1.4},
  {province: "Alberta", value: -2.9}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, février 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-6, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([0.9], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 0.9, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en février, avec des ventes de 17,5 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,3 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (février 2024) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,5 G$ |
| Détaillants en alimentation et en boissons | 12,3 G$ |
| Détaillants de marchandises diverses | 8,6 G$ |
| Stations-service et vendeurs de carburant | 5,7 G$ |
| Détaillants de produits de santé et de soins personnels | 5,2 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,7 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Février 2024
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-february-2024", "fr"));
```
