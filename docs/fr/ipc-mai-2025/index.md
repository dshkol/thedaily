---
title: Les prix à la consommation en hausse de 1,7 % d'une année à l'autre en mai 2025
toc: false
---

# Les prix à la consommation en hausse de 1,7 % d'une année à l'autre en mai 2025

<p class="release-date">Diffusion : 17 juin 2025</p>

<div class="highlights">

- L'Indice des prix à la consommation a augmenté de 1,7 % d'une année à l'autre en mai 2025
- L'inflation est demeurée inchangée par rapport au taux de 1,7 % d'avril
- Les prix des aliments ont augmenté de 3,5 % d'une année à l'autre
- Les coûts du logement ont augmenté de 4,3 %

</div>

L'Indice des prix à la consommation (IPC) a augmenté de 1,7 % en mai 2025 par rapport au même mois un an plus tôt, égalant le taux d'avril. Il s'agit du taux d'inflation le plus bas depuis mars 2021, alors que les prix de l'énergie ont continué de se modérer.

Sur une base mensuelle, les prix ont augmenté de 0,3 % par rapport à avril 2025.

## Tendance de l'inflation d'une année à l'autre

L'inflation annuelle s'est considérablement modérée par rapport à son sommet de 2022, s'établissant près de la cible de 2 % de la Banque du Canada au début de 2025.

```js
import * as Plot from "npm:@observablehq/plot";

const inflationData = [
  {date: new Date("2024-05"), rate: 2.9},
  {date: new Date("2024-06"), rate: 2.7},
  {date: new Date("2024-07"), rate: 2.5},
  {date: new Date("2024-08"), rate: 2.0},
  {date: new Date("2024-09"), rate: 1.6},
  {date: new Date("2024-10"), rate: 2.0},
  {date: new Date("2024-11"), rate: 1.9},
  {date: new Date("2024-12"), rate: 1.8},
  {date: new Date("2025-01"), rate: 1.9},
  {date: new Date("2025-02"), rate: 2.6},
  {date: new Date("2025-03"), rate: 2.3},
  {date: new Date("2025-04"), rate: 1.7},
  {date: new Date("2025-05"), rate: 1.7}
];

display(Plot.plot({
  title: "Taux d'inflation d'une année à l'autre (%)",
  width: 640,
  height: 280,
  y: {domain: [0, 4], grid: true, label: "Pourcentage"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.ruleY([2], {stroke: "#999", strokeDasharray: "4,4"}),
    Plot.lineY(inflationData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(inflationData.slice(-1), {x: "date", y: "rate", fill: "#AF3C43", r: 5}),
    Plot.text(inflationData.slice(-1), {x: "date", y: "rate", text: d => d.rate.toFixed(1).replace(".", ",") + " %", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Prix par composante principale

Le logement est demeuré le principal contributeur à l'inflation annuelle à 4,3 %, suivi des aliments à 3,5 %. Les prix des transports ont diminué de 0,5 % en raison de la baisse des coûts de l'essence.

```js
const components = [
  {name: "Logement", change: 4.3},
  {name: "Aliments", change: 3.5},
  {name: "Soins de santé et soins personnels", change: 2.8},
  {name: "Dépenses et équipement du ménage", change: 2.4},
  {name: "Boissons alcoolisées et tabac", change: 1.9},
  {name: "Loisirs et lecture", change: 0.6},
  {name: "Vêtements et chaussures", change: 0.4},
  {name: "Transports", change: -0.5}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre par composante (%)",
  width: 640,
  height: 320,
  marginLeft: 200,
  x: {domain: [-1, 5], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(components, {
      y: "name",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(components, {
      y: "name",
      x: "change",
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      dx: d => d.change >= 0 ? 20 : -20,
      fill: "currentColor"
    })
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Mai 2025 | Variation par rapport à avril | Variation par rapport à mai 2024 |
|-----------|----------:|-----------------------------:|---------------------------------:|
| IPC d'ensemble (a/a) | +1,7 % | 0,0 pp | -1,2 pp |
| Aliments | +3,5 % | — | — |
| Logement | +4,3 % | — | — |
| Transports | -0,5 % | — | — |

<div class="note-to-readers">

**Note aux lecteurs**

L'Indice des prix à la consommation mesure le taux de variation des prix dont les consommateurs canadiens font l'expérience. Il est calculé en comparant, au fil du temps, le coût d'un panier fixe de biens et services achetés par les consommateurs.

L'IPC n'est pas désaisonnalisé. Les mouvements d'un mois à l'autre peuvent refléter des tendances saisonnières en plus des tendances sous-jacentes des prix.

Cet article de rattrapage couvre les données de mai 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 18-10-0004](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810000401)
**Enquête :** Indice des prix à la consommation
**Période de référence :** Mai 2025
**DOI :** [https://doi.org/10.25318/1810000401-fra](https://doi.org/10.25318/1810000401-fra)

</div>
