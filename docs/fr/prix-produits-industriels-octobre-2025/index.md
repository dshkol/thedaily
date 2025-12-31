---
title: Les prix des produits industriels en hausse de 5,7 % d'une année à l'autre en octobre 2025
toc: false
---

# Les prix des produits industriels en hausse de 5,7 % d'une année à l'autre en octobre 2025

<p class="release-date">Diffusion : 28 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- L'Indice des prix des produits industriels (IPPI) a augmenté de 1,6 % en octobre 2025
- D'une année à l'autre, les prix des produits industriels ont progressé de 5,7 %
- L'indice a atteint 134,4 (2020=100), le niveau le plus élevé depuis le début de 2025
- Il s'agit de la deuxième hausse mensuelle consécutive

</div>

L'Indice des prix des produits industriels (IPPI) a augmenté de 1,6 % en octobre 2025, portant l'indice à 134,4 (2020=100). Ce résultat fait suite à une hausse de 1,0 % en septembre. D'une année à l'autre, les prix des produits industriels ont progressé de 5,7 % par rapport à octobre 2024.

Cette hausse mensuelle reflète un renforcement des pressions sur les prix en amont dans le secteur manufacturier.

```js
import * as Plot from "npm:@observablehq/plot";

const ippiData = [
  {date: new Date("2023-12"), value: 123.3},
  {date: new Date("2024-01"), value: 123.3},
  {date: new Date("2024-02"), value: 124.6},
  {date: new Date("2024-03"), value: 125.7},
  {date: new Date("2024-04"), value: 127.7},
  {date: new Date("2024-05"), value: 128.0},
  {date: new Date("2024-06"), value: 127.9},
  {date: new Date("2024-07"), value: 127.9},
  {date: new Date("2024-08"), value: 126.7},
  {date: new Date("2024-09"), value: 125.6},
  {date: new Date("2024-10"), value: 127.1},
  {date: new Date("2024-11"), value: 127.8},
  {date: new Date("2024-12"), value: 128.3},
  {date: new Date("2025-01"), value: 130.3},
  {date: new Date("2025-02"), value: 131.1},
  {date: new Date("2025-03"), value: 131.4},
  {date: new Date("2025-04"), value: 130.4},
  {date: new Date("2025-05"), value: 129.2},
  {date: new Date("2025-06"), value: 129.6},
  {date: new Date("2025-07"), value: 130.4},
  {date: new Date("2025-08"), value: 130.9},
  {date: new Date("2025-09"), value: 132.2},
  {date: new Date("2025-10"), value: 134.4}
];

display(Plot.plot({
  title: "Indice des prix des produits industriels, décembre 2023 à octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [118, 140], grid: true, label: "Indice (2020=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(ippiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(ippiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(ippiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ","), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation mensuelle en 2025

Les prix des produits industriels ont affiché une volatilité tout au long de 2025. Après avoir diminué au printemps, l'indice a augmenté régulièrement depuis juillet, avec des hausses accélérées en septembre et octobre.

```js
const monthlyData = [
  {month: "Jan.", value: 130.3, change: 1.6},
  {month: "Fév.", value: 131.1, change: 0.6},
  {month: "Mars", value: 131.4, change: 0.2},
  {month: "Avr.", value: 130.4, change: -0.8},
  {month: "Mai", value: 129.2, change: -0.9},
  {month: "Juin", value: 129.6, change: 0.3},
  {month: "Juil.", value: 130.4, change: 0.6},
  {month: "Août", value: 130.9, change: 0.4},
  {month: "Sept.", value: 132.2, change: 1.0},
  {month: "Oct.", value: 134.4, change: 1.7}
];

display(Plot.plot({
  title: "Variation mensuelle de l'IPPI, 2025 (%)",
  width: 640,
  height: 260,
  x: {label: null, padding: 0.3, domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août", "Sept.", "Oct."]},
  y: {grid: true, label: "Variation en pourcentage", domain: [-1.5, 2.5]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(monthlyData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(monthlyData, {
      x: "month",
      y: "change",
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      dy: d => d.change >= 0 ? -8 : 8,
      fontSize: 10
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

L'Indice des prix des produits industriels (IPPI) mesure les prix que les producteurs reçoivent pour les biens vendus à la sortie de l'usine. Il reflète les pressions sur les prix dans le secteur manufacturier avant qu'elles n'atteignent les consommateurs.

L'IPPI diffère de l'Indice des prix à la consommation (IPC), qui mesure les prix payés par les consommateurs. Les variations des prix des produits industriels peuvent prendre du temps à affecter les prix à la consommation à mesure que les biens progressent dans la chaîne d'approvisionnement.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 18-10-0265](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810026501)
**Enquête :** Indice des prix des produits industriels
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/1810026501-fra](https://doi.org/10.25318/1810026501-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "prix-produits-industriels-octobre-2025", "fr"));
```
