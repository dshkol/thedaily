---
title: Les ventes au détail augmentent de 1,3 % en novembre pour atteindre 62,4 milliards de dollars, en hausse de 6,3 % d'une année à l'autre
toc: false
---

# Les ventes au détail augmentent de 1,3 % en novembre pour atteindre 62,4 milliards de dollars, en hausse de 6,3 % d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 1,3 % en novembre 2021 pour atteindre 62,4 milliards de dollars
- D'une année à l'autre, les ventes étaient en hausse de 6,3 %, poursuivant la reprise constante
- La Saskatchewan a mené toutes les provinces avec une croissance de 16,3 % d'une année à l'autre
- Seuls les Territoires du Nord-Ouest et le Nunavut ont affiché des baisses d'une année à l'autre

</div>

Les ventes au détail au Canada ont augmenté de 1,3 % en novembre 2021 pour atteindre 62,4 milliards de dollars, maintenant l'élan à la hausse. La croissance d'une année à l'autre était solide à 6,3 %, reflétant la vigueur continue des dépenses de consommation par rapport à novembre 2020.

La Saskatchewan a affiché une croissance exceptionnelle de 16,3 % d'une année à l'autre, suivie du Manitoba à 12,2 %. Ces provinces des Prairies étaient les seules à afficher des gains à deux chiffres, bien que la plupart des provinces aient enregistré une croissance positive d'une année à l'autre.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2020-12-01"), value: 56.37},
  {date: new Date("2021-01-01"), value: 55.15},
  {date: new Date("2021-02-01"), value: 58.78},
  {date: new Date("2021-03-01"), value: 61.77},
  {date: new Date("2021-04-01"), value: 58.40},
  {date: new Date("2021-05-01"), value: 56.95},
  {date: new Date("2021-06-01"), value: 59.65},
  {date: new Date("2021-07-01"), value: 60.15},
  {date: new Date("2021-08-01"), value: 61.11},
  {date: new Date("2021-09-01"), value: 60.84},
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, décembre 2020 à novembre 2021 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [52, 65], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## La Saskatchewan en tête de la croissance provinciale

La Saskatchewan a mené toutes les provinces avec une croissance de 16,3 % d'une année à l'autre, soit près du triple de la moyenne nationale. Le Manitoba a suivi avec une forte croissance de 12,2 %. Ces provinces des Prairies ont bénéficié de la reprise des prix des produits de base et de l'activité agricole.

Le Canada atlantique a également affiché une vigueur constante, les quatre provinces ayant enregistré des gains supérieurs à la moyenne. Seuls les Territoires du Nord-Ouest (-3,1 %) et le Nunavut (-0,2 %) ont affiché des baisses d'une année à l'autre.

```js
const provincialData = [
  {province: "Saskatchewan", value: 16.3},
  {province: "Manitoba", value: 12.2},
  {province: "Nouveau-Brunswick", value: 9.8},
  {province: "Île-du-Prince-Édouard", value: 9.6},
  {province: "Nouvelle-Écosse", value: 9.0},
  {province: "Ontario", value: 6.7},
  {province: "Alberta", value: 6.1},
  {province: "Terre-Neuve-et-Labrador", value: 6.0},
  {province: "Québec", value: 4.8},
  {province: "Colombie-Britannique", value: 3.3},
  {province: "Yukon", value: 0.2},
  {province: "Nunavut", value: -0.2},
  {province: "Territoires du Nord-Ouest", value: -3.1}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, novembre 2021 (%)",
  width: 680,
  height: 380,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-6, 18]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([6.3], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 18,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 6.3, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en novembre, avec des ventes de 15,5 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 10,6 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (novembre 2021) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 15,5 G$ |
| Détaillants en alimentation et en boissons | 10,6 G$ |
| Détaillants de marchandises diverses | 7,6 G$ |
| Stations-service et vendeurs de carburant | 4,9 G$ |
| Détaillants de produits de santé et de soins personnels | 4,6 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 2,9 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Novembre 2021
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-novembre-2021", "fr"));
```
