---
title: Les permis de bâtir en baisse de 3,4 % en août 2025
toc: false
---

# Les permis de bâtir en baisse de 3,4 % en août 2025

<p class="release-date">Diffusion : 10 octobre 2025</p>

<div class="highlights">

- La valeur totale des permis de bâtir a diminué de 3,4 % pour s'établir à 11,5 milliards de dollars en août 2025
- Les permis résidentiels ont chuté à 7,2 milliards de dollars
- Les permis non résidentiels ont diminué à 4,3 milliards de dollars
- D'une année à l'autre, les permis ont augmenté de 1,8 %

</div>

La valeur totale des permis de bâtir a diminué de 3,4 % pour s'établir à 11,5 milliards de dollars en août 2025, faisant suite à une baisse de 1,7 % en juillet. D'une année à l'autre, la valeur totale des permis a augmenté de 1,8 % par rapport à août 2024.

Les permis résidentiels ont diminué à 7,2 milliards de dollars, tandis que les permis non résidentiels ont reculé à 4,3 milliards de dollars, alors que les intentions de construction ont ralenti durant les mois d'été.

## Tendance des permis de bâtir

La valeur totale des permis de bâtir a fluctué entre 10,7 milliards et 13,0 milliards de dollars au cours des deux dernières années, août 2025 poursuivant cette tendance dans une fourchette délimitée.

```js
import * as Plot from "npm:@observablehq/plot";

// Données du tableau 34-10-0292 de Statistique Canada (valeurs en milliards $)
const permitsData = [
  {date: new Date("2023-08"), total: 12.1},
  {date: new Date("2023-09"), total: 11.9},
  {date: new Date("2023-10"), total: 13.0},
  {date: new Date("2023-11"), total: 11.8},
  {date: new Date("2023-12"), total: 11.2},
  {date: new Date("2024-01"), total: 11.5},
  {date: new Date("2024-02"), total: 11.1},
  {date: new Date("2024-03"), total: 11.8},
  {date: new Date("2024-04"), total: 11.4},
  {date: new Date("2024-05"), total: 11.6},
  {date: new Date("2024-06"), total: 11.9},
  {date: new Date("2024-07"), total: 12.2},
  {date: new Date("2024-08"), total: 11.3},
  {date: new Date("2024-09"), total: 11.7},
  {date: new Date("2024-10"), total: 13.0},
  {date: new Date("2024-11"), total: 11.5},
  {date: new Date("2024-12"), total: 11.1},
  {date: new Date("2025-01"), total: 11.4},
  {date: new Date("2025-02"), total: 10.9},
  {date: new Date("2025-03"), total: 11.6},
  {date: new Date("2025-04"), total: 11.3},
  {date: new Date("2025-05"), total: 11.8},
  {date: new Date("2025-06"), total: 12.1},
  {date: new Date("2025-07"), total: 11.9},
  {date: new Date("2025-08"), total: 11.5}
];

display(Plot.plot({
  title: "Valeur totale des permis de bâtir (milliards de dollars)",
  width: 680,
  height: 300,
  y: {domain: [10, 14], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(permitsData, {x: "date", y: "total", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(permitsData.slice(-1), {x: "date", y: "total", fill: "#AF3C43", r: 5}),
    Plot.text(permitsData.slice(-1), {x: "date", y: "total", text: d => d.total.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation mensuelle en 2025

La valeur des permis de bâtir a connu des fluctuations notables tout au long de 2025, la plus forte hausse ayant été enregistrée en mars, suivie d'un recul en juillet et août.

```js
const momData = [
  {month: "Jan.", change: 2.7},
  {month: "Fév.", change: -4.4},
  {month: "Mars", change: 6.4},
  {month: "Avr.", change: -2.6},
  {month: "Mai", change: 4.4},
  {month: "Juin", change: 2.5},
  {month: "Juil.", change: -1.7},
  {month: "Août", change: -3.4}
];

display(Plot.plot({
  title: "Variation mensuelle des permis de bâtir, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août"]
  },
  y: {grid: true, label: "Variation en pourcentage", domain: [-6, 8]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(momData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(momData, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.4 : d.change - 0.4,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      fontSize: 10
    })
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Août 2025 | Variation par rapport à juillet | Variation par rapport à août 2024 |
|-----------|----------:|--------------------------------:|----------------------------------:|
| Total des permis (milliards $) | 11,5 | -3,4 % | +1,8 % |
| Résidentiel (milliards $) | 7,2 | -3,6 % | +1,5 % |
| Non résidentiel (milliards $) | 4,3 | -3,0 % | +2,2 % |

<div class="note-to-readers">

**Note aux lecteurs**

Les données sur les permis de bâtir fournissent une indication précoce de l'activité de construction future. La valeur des permis représente les intentions de construction des détenteurs de permis et peut différer de la construction réelle.

Les données sont désaisonnalisées pour tenir compte des tendances saisonnières régulières de l'activité de construction.

Cet article de rattrapage couvre les données d'août 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 34-10-0292](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=3410029201)
**Enquête :** Permis de bâtir
**Période de référence :** Août 2025
**DOI :** [https://doi.org/10.25318/3410029201-fra](https://doi.org/10.25318/3410029201-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "permis-batir-aout-2025", "fr"));
```
