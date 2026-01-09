---
title: Les prix à la consommation en hausse de 1.7 % d'une année à l'autre en juillet 2025
---

# Les prix à la consommation en hausse de 1.7 % d'une année à l'autre en juillet 2025

<p class="release-date">Released: 2025-12-25</p>

<div class="metric-box">
  <div class="value">+1.7%</div>
  <div class="label">Variation d'une année à l'autre de l'Indice des prix à la consommation, juillet 2025</div>
</div>

L'Indice des prix à la consommation (IPC) a augmenté de 1,7 % en juillet 2025 par rapport au même mois un an plus tôt.

<div class="highlights">

**Faits saillants**

- L'Indice des prix à la consommation a augmenté de 1,7 % d'une année à l'autre en juillet 2025
- L'inflation a diminué par rapport à 2,6 % en février 2025

</div>

## Tendance de l'inflation d'une année à l'autre

```js
import * as Plot from "npm:@observablehq/plot";

const inflationData = [
  {date: new Date("2025-02"), rate: 2.6},
  {date: new Date("2025-03"), rate: 2.3},
  {date: new Date("2025-04"), rate: 1.7},
  {date: new Date("2025-05"), rate: 1.7},
  {date: new Date("2025-06"), rate: 1.9},
  {date: new Date("2025-07"), rate: 1.7}
];

display(Plot.plot({
  title: "Taux d'inflation d'une année à l'autre (%)",
  width: 640,
  height: 280,
  y: {domain: [0, 4], grid: true, label: "Pourcentage"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.ruleY([1, 3], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.lineY(inflationData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(inflationData, {x: "date", y: "rate", fill: "#AF3C43", r: 4})
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

L'Indice des prix à la consommation mesure le taux de variation des prix que subissent les consommateurs canadiens. Il est calculé en comparant le coût d'un panier fixe de biens et de services achetés par les consommateurs au fil du temps.

L'IPC n'est pas désaisonnalisé. Les variations d'un mois à l'autre peuvent refléter des tendances saisonnières en plus des tendances de prix sous-jacentes.

</div>

<div class="source-info">

**Source:** Statistics Canada, Table 18-10-0004
**Enquête:** Indice des prix à la consommation
**Période de référence:** juillet 2025

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "ipc-july-2025", "fr"));
```
