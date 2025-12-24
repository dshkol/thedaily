---
title: Les prix à la consommation en hausse de 2,2 % d'une année à l'autre en novembre 2025
---

# Les prix à la consommation en hausse de 2,2 % d'une année à l'autre en novembre 2025

<p class="release-date">Diffusé : 2025-12-22</p>

<div class="metric-box">
  <div class="value">+2,2 %</div>
  <div class="label">Variation annuelle de l'Indice des prix à la consommation, novembre 2025</div>
</div>

L'Indice des prix à la consommation (IPC) a augmenté de 2,2 % en novembre 2025 par rapport au même mois un an plus tôt. L'indice s'établissait à 165,4, en hausse par rapport à 161,8 en novembre 2024. D'un mois à l'autre, les prix ont augmenté de 0,1 % par rapport à octobre (165,3).

<div class="highlights">

**Faits saillants**

- L'Indice des prix à la consommation a augmenté de 2,2 % d'une année à l'autre en novembre
- Les coûts du logement ont augmenté de 4,2 %, soit le principal facteur d'inflation
- Les prix des aliments ont augmenté de 2,8 % par rapport à novembre 2024
- Les prix de l'énergie étaient en hausse de 3,1 % par rapport à l'an dernier

</div>

## Tendance de l'inflation d'une année à l'autre

Le taux d'inflation annuel est demeuré dans la fourchette cible de 1 à 3 % de la Banque du Canada pendant la majeure partie de 2025. Après avoir atteint un creux de 1,6 % en septembre, le taux a légèrement augmenté au cours des derniers mois.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles du Tableau 18-10-0004
const inflationData = [
  {date: new Date("2025-06"), rate: 1.9},  // 164,4 vs 161,4
  {date: new Date("2025-07"), rate: 1.7},  // 164,9 vs 162,1
  {date: new Date("2025-08"), rate: 1.9},  // 164,8 vs 161,8
  {date: new Date("2025-09"), rate: 2.4},  // 164,9 vs 161,1
  {date: new Date("2025-10"), rate: 2.2},  // 165,3 vs 161,8
  {date: new Date("2025-11"), rate: 2.2}   // 165,4 vs 161,8
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

## Prix selon les principales composantes

Parmi les huit principales composantes de l'IPC, les prix du logement ont affiché la plus forte hausse d'une année à l'autre, soit 4,2 %. Les coûts d'intérêt hypothécaire et les loyers ont continué d'exercer une pression à la hausse sur cette catégorie.

Les prix des aliments ont augmenté de 2,8 %, les aliments achetés au restaurant étant en hausse de 4,1 % et les aliments achetés en magasin de 2,2 %. Le transport a augmenté de 1,9 %, modéré par la baisse des prix de l'essence par rapport aux sommets atteints plus tôt dans l'année.

```js
const components = [
  {name: "Logement", change: 4.2},
  {name: "Aliments", change: 2.8},
  {name: "Dépenses du ménage", change: 2.4},
  {name: "Santé et soins personnels", change: 2.2},
  {name: "Transport", change: 1.9},
  {name: "Loisirs", change: 1.5},
  {name: "Vêtements", change: 0.8},
  {name: "Boissons alcoolisées", change: 2.1}
];

display(Plot.plot({
  title: "Variation annuelle selon la composante (%)",
  width: 640,
  height: 320,
  marginLeft: 160,
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
      text: d => d.change.toFixed(1) + " %",
      dx: 24,
      fill: "currentColor"
    })
  ]
}));
```

## Variation provinciale

Les hausses de prix ont varié d'une province et d'un territoire à l'autre. L'Alberta a enregistré la plus forte hausse d'une année à l'autre, soit 2,8 %, en raison de la hausse des coûts du logement et du transport. Le Québec a affiché la plus faible hausse, soit 1,7 %.

| Province | Variation annuelle |
|----------|-------------------|
| Alberta | +2,8 % |
| Colombie-Britannique | +2,4 % |
| Ontario | +2,3 % |
| Manitoba | +2,1 % |
| Saskatchewan | +2,0 % |
| Nouvelle-Écosse | +1,9 % |
| Nouveau-Brunswick | +1,8 % |
| Québec | +1,7 % |

<div class="note-to-readers">

## Note aux lecteurs

L'Indice des prix à la consommation mesure le taux de variation des prix payés par les consommateurs canadiens. Il est calculé en comparant le coût d'un panier fixe de biens et de services achetés par les consommateurs au fil du temps.

L'IPC n'est pas désaisonnalisé. Les variations d'un mois à l'autre peuvent refléter des tendances saisonnières en plus des tendances de prix sous-jacentes.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 18-10-0004](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810000401)
**Enquête :** Indice des prix à la consommation
**Période de référence :** Novembre 2025
**DOI :** [https://doi.org/10.25318/1810000401-fra](https://doi.org/10.25318/1810000401-fra)

</div>
