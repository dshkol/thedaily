---
title: Les ventes des services alimentaires en hausse de 0,6 % en octobre 2025
toc: false
---

# Les ventes des services alimentaires en hausse de 0,6 % en octobre 2025

<p class="release-date">Diffusion : 25 décembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes des services de restauration et des débits de boissons ont augmenté de 0,6 % pour s'établir à 8,5 milliards de dollars en octobre 2025
- Les ventes ont progressé de 5,2 % d'une année à l'autre par rapport à octobre 2024
- Les établissements de restauration à service restreint ont mené avec 3,9 milliards de dollars de ventes
- Les restaurants à service complet ont enregistré 3,7 milliards de dollars

</div>

Les ventes des services de restauration et des débits de boissons ont augmenté de 0,6 % pour s'établir à 8,5 milliards de dollars en octobre 2025, après un recul de 0,4 % en septembre. Comparativement à octobre 2024, les ventes ont progressé de 5,2 %.

L'industrie des services alimentaires a affiché une croissance soutenue tout au long de 2025, les ventes affichant une tendance à la hausse depuis le début de l'année.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles du Tableau 21-10-0019 de Statistique Canada
const salesData = [
  {date: new Date("2024-10"), value: 8.11},
  {date: new Date("2024-11"), value: 8.23},
  {date: new Date("2024-12"), value: 8.24},
  {date: new Date("2025-01"), value: 8.27},
  {date: new Date("2025-02"), value: 8.24},
  {date: new Date("2025-03"), value: 8.40},
  {date: new Date("2025-04"), value: 8.47},
  {date: new Date("2025-05"), value: 8.51},
  {date: new Date("2025-06"), value: 8.49},
  {date: new Date("2025-07"), value: 8.46},
  {date: new Date("2025-08"), value: 8.51},
  {date: new Date("2025-09"), value: 8.48},
  {date: new Date("2025-10"), value: 8.53}
];

display(Plot.plot({
  title: "Ventes des services de restauration et des débits de boissons, octobre 2024 à octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [7.8, 8.8], grid: true, label: "Milliards $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(salesData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(2).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Ventes par type d'établissement

Les établissements de restauration à service restreint — qui comprennent les restaurants de restauration rapide, les cafés et les établissements de plats à emporter — ont représenté la plus grande part des ventes des services alimentaires avec 3,9 milliards de dollars en octobre.

Les restaurants à service complet ont suivi avec 3,7 milliards de dollars de ventes. Les services de restauration spéciaux, incluant les traiteurs et les entrepreneurs en services alimentaires, ont déclaré 690 millions de dollars, tandis que les débits de boissons (bars et pubs) ont totalisé 201 millions de dollars.

```js
const breakdown = [
  {type: "Restauration à service restreint", value: 3.94},
  {type: "Restaurants à service complet", value: 3.70},
  {type: "Services de restauration spéciaux", value: 0.69},
  {type: "Débits de boissons", value: 0.20}
];

display(Plot.plot({
  title: "Ventes des services alimentaires par type d'établissement, octobre 2025 (milliards $)",
  width: 640,
  height: 260,
  marginLeft: 240,
  marginRight: 60,
  x: {grid: true, label: "Milliards $"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(breakdown, {
      y: "type",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(breakdown, {
      y: "type",
      x: 4.2,
      text: d => d.value.toFixed(2).replace(".", ",") + " G$",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

Les ventes des services de restauration et des débits de boissons représentent les recettes d'exploitation totales provenant des ventes d'aliments et de boissons préparés sur place pour consommation immédiate. Les estimations sont désaisonnalisées.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 21-10-0019](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2110001901)
**Enquête :** Enquête mensuelle sur les services de restauration et les débits de boissons
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/2110001901-fra](https://doi.org/10.25318/2110001901-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "services-alimentaires-octobre-2025", "fr"));
```
