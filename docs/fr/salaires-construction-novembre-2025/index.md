---
title: L'indice des taux de salaire syndicaux dans la construction en hausse de 2,3 % sur un an en novembre 2025
toc: false
---

# L'indice des taux de salaire syndicaux dans la construction en hausse de 2,3 % sur un an en novembre 2025

<p class="release-date">Données diffusées : 15 décembre 2025 | Publié : 4 janvier 2026 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="metric-box">
  <div class="value">+2,3 %</div>
  <div class="label">Variation sur un an de l'indice des taux de salaire dans la construction, novembre 2025</div>
</div>

L'indice des taux de salaire syndicaux dans la construction au Canada s'est établi à 126,3 en novembre 2025, en hausse de 2,3 % par rapport au même mois de l'année précédente, où l'indice était de 123,5. Sur une base mensuelle, l'indice est demeuré inchangé par rapport à octobre 2025.

<div class="highlights">

**Faits saillants**

- L'indice des taux de salaire syndicaux dans la construction a augmenté de 2,3 % sur un an en novembre 2025
- Les charpentiers ont enregistré la plus forte hausse sur un an parmi les métiers, soit 3,1 %
- Vancouver a affiché l'indice des taux de salaire le plus élevé parmi les grandes villes, à 133,7
- L'indice est demeuré inchangé sur une base mensuelle

</div>

## Tendance de l'indice des taux de salaire

```js
import * as Plot from "npm:@observablehq/plot";

const indexData = [
  {date: new Date("2024-01"), value: 119.8},
  {date: new Date("2024-02"), value: 119.8},
  {date: new Date("2024-03"), value: 120.3},
  {date: new Date("2024-04"), value: 121.3},
  {date: new Date("2024-05"), value: 122.7},
  {date: new Date("2024-06"), value: 122.8},
  {date: new Date("2024-07"), value: 123.3},
  {date: new Date("2024-08"), value: 123.3},
  {date: new Date("2024-09"), value: 123.7},
  {date: new Date("2024-10"), value: 123.5},
  {date: new Date("2024-11"), value: 123.5},
  {date: new Date("2024-12"), value: 124.0},
  {date: new Date("2025-01"), value: 124.3},
  {date: new Date("2025-02"), value: 124.2},
  {date: new Date("2025-03"), value: 124.3},
  {date: new Date("2025-04"), value: 124.8},
  {date: new Date("2025-05"), value: 126.0},
  {date: new Date("2025-06"), value: 126.1},
  {date: new Date("2025-07"), value: 126.3},
  {date: new Date("2025-08"), value: 126.3},
  {date: new Date("2025-09"), value: 126.3},
  {date: new Date("2025-10"), value: 126.3},
  {date: new Date("2025-11"), value: 126.3}
];

display(Plot.plot({
  title: "Indice des taux de salaire syndicaux dans la construction, janvier 2024 à novembre 2025",
  width: 680,
  height: 300,
  y: {grid: true, label: "↑ Indice (janvier 1971=100)", domain: [118, 128]},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(indexData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(indexData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(indexData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation sur un an selon le métier

Parmi les métiers de la construction, les charpentiers ont enregistré la plus forte hausse sur un an, soit 3,1 %, suivis des finisseurs de béton (3,0 %) et des plombiers (2,9 %). Les opérateurs d'équipement lourd et les tôliers ont également enregistré des hausses de 2,9 %.

```js
const tradeData = [
  {trade: "Charpentier", change: 3.1},
  {trade: "Finisseur de béton", change: 3.0},
  {trade: "Plombier", change: 2.9},
  {trade: "Tôlier", change: 2.9},
  {trade: "Opérateur d'équipement lourd", change: 2.9},
  {trade: "Monteur de charpentes métalliques", change: 2.8},
  {trade: "Calorifugeur", change: 2.8},
  {trade: "Camionneur", change: 2.8},
  {trade: "Briqueteur", change: 2.7},
  {trade: "Couvreur", change: 2.6}
];

display(Plot.plot({
  title: "Variation sur un an de l'indice par métier, novembre 2025 (%)",
  width: 680,
  height: 360,
  marginLeft: 220,
  x: {grid: true, label: "Variation en pourcentage", domain: [0, 3.5]},
  y: {label: null},
  marks: [
    Plot.barX(tradeData, {
      y: "trade",
      x: "change",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(tradeData, {
      y: "trade",
      x: "change",
      text: d => d.change.toFixed(1).replace(".", ",") + " %",
      dx: 4,
      textAnchor: "start",
      fill: "#AF3C43",
      fontWeight: 600
    })
  ]
}));
```

## Variation régionale

La Colombie-Britannique a affiché les indices des taux de salaire dans la construction les plus élevés parmi les provinces, Vancouver se situant à 133,7 et Kelowna à 133,3. Les villes du Québec ont également enregistré des indices élevés, Montréal s'établissant à 131,6 et la ville de Québec à 131,5. Les villes de l'Ontario ont généralement affiché des indices plus bas, Toronto se situant à 127,6 et Hamilton à 125,0.

```js
const cityData = [
  {city: "Vancouver (C.-B.)", index: 133.7},
  {city: "Kelowna (C.-B.)", index: 133.3},
  {city: "Saint John (N.-B.)", index: 131.8},
  {city: "Montréal (Qc)", index: 131.6},
  {city: "Québec (Qc)", index: 131.5},
  {city: "Winnipeg (Man.)", index: 131.3},
  {city: "Moncton (N.-B.)", index: 130.7},
  {city: "Victoria (C.-B.)", index: 130.6},
  {city: "Toronto (Ont.)", index: 127.6},
  {city: "Hamilton (Ont.)", index: 125.0}
];

display(Plot.plot({
  title: "Indice des taux de salaire syndicaux dans la construction par ville, novembre 2025",
  width: 680,
  height: 360,
  marginLeft: 140,
  x: {grid: true, label: "Indice (janvier 1971=100)", domain: [120, 136]},
  y: {label: null},
  marks: [
    Plot.barX(cityData, {
      y: "city",
      x1: 120,
      x2: "index",
      fill: "#AF3C43",
      sort: {y: "-x2"}
    }),
    Plot.text(cityData, {
      y: "city",
      x: "index",
      text: d => d.index.toFixed(1).replace(".", ","),
      dx: 4,
      textAnchor: "start",
      fill: "#AF3C43",
      fontWeight: 600
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

L'indice des taux de salaire syndicaux dans la construction mesure les variations des taux de salaire de base négociés dans le cadre de conventions collectives dans l'industrie de la construction syndiquée. L'indice comprend 20 métiers de la construction dans 21 régions métropolitaines du Canada. La période de référence est janvier 1971=100.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 18-10-0140](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810014001)

</div>
