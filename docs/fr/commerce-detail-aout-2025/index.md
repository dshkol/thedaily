---
title: Les ventes au détail en hausse de 1,0 % en août 2025
toc: false
---

# Les ventes au détail en hausse de 1,0 % en août 2025

<p class="release-date">Diffusion : 18 octobre 2025</p>

<div class="highlights">

- Les ventes au détail ont augmenté de 1,0 % pour s'établir à 70,2 milliards de dollars en août 2025
- Cette hausse fait suite à une baisse de 0,9 % en juillet
- D'une année à l'autre, les ventes au détail ont progressé de 4,7 %

</div>

Les ventes au détail ont augmenté de 1,0 % pour s'établir à 70,2 milliards de dollars en août 2025, après une baisse de 0,9 % en juillet. D'une année à l'autre, le commerce de détail a progressé de 4,7 % par rapport à août 2024, alors que les ventes totalisaient 67,1 milliards de dollars.

La hausse d'août a porté les ventes au détail à leur niveau le plus élevé en 2025, bien que la volatilité ait continué de caractériser le secteur du commerce de détail tout au long de l'année.

## Tendance des ventes

Les ventes au détail ont fluctué tout au long de 2025, le mois d'août marquant une reprise après le recul de juillet.

```js
import * as Plot from "npm:@observablehq/plot";

const salesData = [
  {date: new Date("2023-08-01"), value: 65.32},
  {date: new Date("2023-09-01"), value: 66.18},
  {date: new Date("2023-10-01"), value: 66.51},
  {date: new Date("2023-11-01"), value: 66.56},
  {date: new Date("2023-12-01"), value: 66.32},
  {date: new Date("2024-01-01"), value: 66.08},
  {date: new Date("2024-02-01"), value: 66.24},
  {date: new Date("2024-03-01"), value: 66.16},
  {date: new Date("2024-04-01"), value: 66.78},
  {date: new Date("2024-05-01"), value: 65.96},
  {date: new Date("2024-06-01"), value: 65.89},
  {date: new Date("2024-07-01"), value: 66.89},
  {date: new Date("2024-08-01"), value: 67.10},
  {date: new Date("2024-09-01"), value: 67.51},
  {date: new Date("2024-10-01"), value: 68.04},
  {date: new Date("2024-11-01"), value: 68.30},
  {date: new Date("2024-12-01"), value: 70.03},
  {date: new Date("2025-01-01"), value: 69.65},
  {date: new Date("2025-02-01"), value: 69.19},
  {date: new Date("2025-03-01"), value: 69.80},
  {date: new Date("2025-04-01"), value: 70.02},
  {date: new Date("2025-05-01"), value: 69.16},
  {date: new Date("2025-06-01"), value: 70.14},
  {date: new Date("2025-07-01"), value: 69.53},
  {date: new Date("2025-08-01"), value: 70.22}
];

display(Plot.plot({
  title: "Ventes au détail, Canada (milliards de dollars, données désaisonnalisées)",
  width: 700,
  height: 400,
  y: {
    domain: [64, 72],
    grid: true,
    label: "Milliards ($)"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(salesData, {x: "date", y: "value", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#AF3C43",
      r: 5
    }),
    Plot.text(salesData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      text: d => d.value.toFixed(1).replace(".", ",") + " G$",
      dy: -12,
      fill: "#AF3C43",
      fontWeight: 600
    })
  ]
}));
```

## Variation mensuelle en 2025

Les ventes au détail ont été volatiles en 2025, le mois d'août affichant la deuxième plus forte hausse mensuelle de l'année.

```js
const monthlyChanges = [
  {month: "Jan.", change: -0.5},
  {month: "Fév.", change: -0.7},
  {month: "Mars", change: 0.9},
  {month: "Avr.", change: 0.3},
  {month: "Mai", change: -1.2},
  {month: "Juin", change: 1.4},
  {month: "Juil.", change: -0.9},
  {month: "Août", change: 1.0}
];

display(Plot.plot({
  title: "Variation mensuelle des ventes au détail, 2025 (%)",
  width: 700,
  height: 350,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août"]
  },
  y: {
    grid: true,
    label: "Variation en pourcentage",
    domain: [-2, 2]
  },
  marks: [
    Plot.ruleY([0]),
    Plot.barY(monthlyChanges, {
      x: "month",
      y: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32"
    }),
    Plot.text(monthlyChanges, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.15 : d.change - 0.15,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      fontSize: 10
    })
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Août 2025 | Variation par rapport à juillet | Variation par rapport à août 2024 |
|-----------|----------:|--------------------------------:|----------------------------------:|
| Ventes au détail (milliards $) | 70,2 | +1,0 % | +4,7 % |

<div class="note-to-readers">

**Note aux lecteurs**

Les estimations du commerce de détail sont exprimées en dollars courants et sont désaisonnalisées. L'Enquête mensuelle sur le commerce de détail couvre les entreprises de détail partout au Canada.

Cet article de rattrapage couvre les données d'août 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Août 2025
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>
