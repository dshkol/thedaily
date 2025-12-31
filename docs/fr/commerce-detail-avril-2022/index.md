---
title: Les ventes au détail demeurent essentiellement inchangées en avril, en hausse de 9,7 % d'une année à l'autre
toc: false
---

# Les ventes au détail demeurent essentiellement inchangées en avril, en hausse de 9,7 % d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail sont demeurées essentiellement inchangées en avril 2022 à 64,1 milliards de dollars
- D'une année à l'autre, les ventes étaient en hausse de 9,7 %, poursuivant la reprise post-pandémique
- L'Ontario a mené toutes les provinces avec une croissance de 21,6 % d'une année à l'autre
- Seuls les Territoires du Nord-Ouest ont affiché une baisse d'une année à l'autre

</div>

Les ventes au détail au Canada sont demeurées essentiellement inchangées en avril 2022 à 64,1 milliards de dollars. La croissance d'une année à l'autre est demeurée forte à 9,7 %, reflétant l'élan continu des dépenses de consommation par rapport à avril 2021, affecté par la pandémie.

L'Ontario a continué de mener la performance provinciale avec un gain de 21,6 % d'une année à l'autre, reflétant la comparaison de la province avec les conditions restreintes d'avril 2021. Toutes les provinces et tous les territoires sauf les Territoires du Nord-Ouest ont enregistré une croissance positive d'une année à l'autre.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
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
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, mai 2021 à avril 2022 (milliards de $)",
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

## L'Ontario domine la croissance provinciale

L'Ontario a mené toutes les provinces avec une croissance de 21,6 % d'une année à l'autre, soit plus du double de la moyenne nationale. Cela reflète la reprise continue de la province après les restrictions pandémiques prolongées en place en avril 2021.

La Saskatchewan (+7,3 %) et le Manitoba (+6,1 %) ont complété le trio de tête. La plupart des provinces ont affiché des gains modérés, seuls les Territoires du Nord-Ouest ayant enregistré une baisse d'une année à l'autre (-6,2 %).

```js
const provincialData = [
  {province: "Ontario", value: 21.6},
  {province: "Saskatchewan", value: 7.3},
  {province: "Manitoba", value: 6.1},
  {province: "Nouvelle-Écosse", value: 5.1},
  {province: "Yukon", value: 4.8},
  {province: "Alberta", value: 4.4},
  {province: "Nunavut", value: 3.9},
  {province: "Québec", value: 3.2},
  {province: "Terre-Neuve-et-Labrador", value: 2.8},
  {province: "Colombie-Britannique", value: 1.8},
  {province: "Nouveau-Brunswick", value: 1.7},
  {province: "Île-du-Prince-Édouard", value: 0.3},
  {province: "Territoires du Nord-Ouest", value: -6.2}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, avril 2022 (%)",
  width: 680,
  height: 380,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-8, 24]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([9.7], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 24,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 9.7, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Ontario",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en avril, avec des ventes de 16,1 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 10,9 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (avril 2022) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 16,1 G$ |
| Détaillants en alimentation et en boissons | 10,9 G$ |
| Détaillants de marchandises diverses | 7,7 G$ |
| Stations-service et vendeurs de carburant | 5,9 G$ |
| Détaillants de produits de santé et de soins personnels | 4,7 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,5 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Avril 2022
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-avril-2022", "fr"));
```
