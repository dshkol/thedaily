---
title: Les ventes au détail stables en novembre, le Manitoba en tête de la croissance provinciale à 11,2 %
toc: false
---

# Les ventes au détail stables en novembre, le Manitoba en tête de la croissance provinciale à 11,2 %

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail sont demeurées essentiellement inchangées (0,0 %) en novembre 2022 à 65,4 milliards de dollars
- D'une année à l'autre, les ventes ont augmenté de 4,8 %, maintenant une solide croissance annuelle
- Le Manitoba a mené toutes les provinces avec une croissance de 11,2 % d'une année à l'autre
- Seuls les Territoires du Nord-Ouest ont enregistré un recul d'une année à l'autre (-3,3 %)

</div>

Les ventes au détail au Canada sont demeurées essentiellement inchangées en novembre 2022, se maintenant à 65,4 milliards de dollars. La croissance d'une année à l'autre est demeurée solide à 4,8 %, reflétant les dépenses continues des consommateurs malgré les incertitudes économiques plus générales.

La performance mensuelle stable de novembre a suivi plusieurs mois de ventes élevées plus tôt dans l'année, les ventes s'étant stabilisées après le sommet estival de 66,8 milliards de dollars en juin.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
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
  {date: new Date("2022-10-01"), value: 65.40},
  {date: new Date("2022-11-01"), value: 65.41}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, décembre 2021 à novembre 2022 (milliards de $)",
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

## Le Manitoba en tête de la croissance provinciale

Le Manitoba a mené toutes les provinces avec une croissance exceptionnelle de 11,2 % d'une année à l'autre, suivi de l'Île-du-Prince-Édouard à 10,0 %. La Nouvelle-Écosse et le Yukon ont également affiché de solides gains supérieurs à 7 %.

Presque toutes les provinces ont enregistré une croissance positive d'une année à l'autre, seuls les Territoires du Nord-Ouest ayant affiché un recul de -3,3 %.

```js
const provincialData = [
  {province: "Manitoba", value: 11.2},
  {province: "Île-du-Prince-Édouard", value: 10.0},
  {province: "Nouvelle-Écosse", value: 7.5},
  {province: "Yukon", value: 7.1},
  {province: "Québec", value: 6.5},
  {province: "Saskatchewan", value: 5.2},
  {province: "Nouveau-Brunswick", value: 4.7},
  {province: "Alberta", value: 4.7},
  {province: "Colombie-Britannique", value: 3.9},
  {province: "Terre-Neuve-et-Labrador", value: 3.4},
  {province: "Ontario", value: 3.4},
  {province: "Territoires du Nord-Ouest", value: -3.3}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, novembre 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-5, 14]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([4.8], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 4.8, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Manitoba",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en novembre, avec des ventes de 16,8 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,6 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (novembre 2022) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 16,8 G$ |
| Détaillants en alimentation et en boissons | 11,6 G$ |
| Détaillants de marchandises diverses | 8,1 G$ |
| Stations-service et vendeurs de carburant | 5,9 G$ |
| Détaillants de produits de santé et de soins personnels | 4,9 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,3 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Novembre 2022
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-novembre-2022", "fr"));
```
