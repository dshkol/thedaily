---
title: Les permis de bâtir en hausse de 4,3 % en septembre 2025
verification_json: output/data_34_10_0175_enhanced.json
toc: false
---

# Les permis de bâtir en hausse de 4,3 % en septembre 2025

<p class="release-date">Diffusion : 12 novembre 2025</p>

<div class="highlights">

- La valeur totale des permis de bâtir a augmenté de 4,3 % pour atteindre 12,0 milliards de dollars en septembre 2025
- Les permis résidentiels ont progressé de 4,8 % pour s'établir à 7,5 milliards de dollars
- Les permis non résidentiels ont augmenté de 3,5 % pour atteindre 4,5 milliards de dollars
- D'une année à l'autre, les permis ont augmenté de 2,6 %

</div>

La valeur totale des permis de bâtir a augmenté de 4,3 % pour atteindre 12,0 milliards de dollars en septembre 2025, se remettant d'une baisse en août. D'une année à l'autre, la valeur totale des permis a progressé de 2,6 % par rapport à septembre 2024.

Les permis résidentiels ont augmenté de 4,8 % pour s'établir à 7,5 milliards de dollars, soutenus par les intentions de construction de logements multiples. Les permis non résidentiels ont progressé de 3,5 % pour atteindre 4,5 milliards de dollars.

## Tendance des permis de bâtir

La valeur totale des permis de bâtir a oscillé entre 10,7 et 13,0 milliards de dollars au cours des deux dernières années, septembre 2025 poursuivant cette tendance.

```js
import * as Plot from "npm:@observablehq/plot";

// Données du tableau 34-10-0292 de Statistique Canada (valeurs en milliards de dollars)
const permitsData = [
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
  {date: new Date("2025-08"), total: 11.5},
  {date: new Date("2025-09"), total: 12.0}
];

display(Plot.plot({
  title: "Valeur totale des permis de bâtir (milliards de dollars)",
  width: 680,
  height: 300,
  y: {domain: [10, 14], grid: true, label: "Milliards $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(permitsData, {x: "date", y: "total", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(permitsData.slice(-1), {x: "date", y: "total", fill: "#AF3C43", r: 5}),
    Plot.text(permitsData.slice(-1), {x: "date", y: "total", text: d => d.total.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation mensuelle en 2025

La valeur des permis de bâtir a affiché des fluctuations modestes tout au long de 2025, la plus forte hausse ayant été enregistrée en juin, suivie d'un repli en juillet et août avant une reprise en septembre.

```js
const momData = [
  {month: "Jan.", change: 2.7},
  {month: "Fév.", change: -4.4},
  {month: "Mars", change: 6.4},
  {month: "Avr.", change: -2.6},
  {month: "Mai", change: 4.4},
  {month: "Juin", change: 2.5},
  {month: "Juil.", change: -1.7},
  {month: "Août", change: -3.4},
  {month: "Sept.", change: 4.3}
];

display(Plot.plot({
  title: "Variation mensuelle des permis de bâtir, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août", "Sept."]
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

| Indicateur | Septembre 2025 | Variation par rapport à août | Variation par rapport à septembre 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| Total des permis (milliards $) | 12,0 | +4,3 % | +2,6 % |
| Résidentiel (milliards $) | 7,5 | +4,8 % | +3,1 % |
| Non résidentiel (milliards $) | 4,5 | +3,5 % | +1,8 % |

<div class="note-to-readers">

**Note aux lecteurs**

Les données sur les permis de bâtir fournissent une indication précoce de l'activité de construction future. La valeur des permis représente les intentions de construction des titulaires de permis et peut différer de la construction réelle.

Les données sont désaisonnalisées pour tenir compte des variations saisonnières régulières de l'activité de construction.

Cet article de rattrapage couvre les données de septembre 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 34-10-0292](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=3410029201)
**Enquête :** Permis de bâtir
**Période de référence :** Septembre 2025
**DOI :** [https://doi.org/10.25318/3410029201-fra](https://doi.org/10.25318/3410029201-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "permis-batir-septembre-2025", "fr"));
```
