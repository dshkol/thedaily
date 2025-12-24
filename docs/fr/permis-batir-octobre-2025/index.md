---
title: Les permis de bâtir en hausse de 14,9 % en octobre 2025
toc: false
---

# Les permis de bâtir en hausse de 14,9 % en octobre 2025

<p class="release-date">Diffusion : 12 décembre 2025</p>

<div class="highlights">

**Faits saillants**

- La valeur totale des permis de bâtir a augmenté de 14,9 % pour s'établir à 13,8 milliards de dollars en octobre 2025
- Les permis résidentiels ont progressé de 14,6 % pour atteindre 8,6 milliards de dollars
- Les permis non résidentiels ont augmenté de 13,3 % pour s'établir à 5,3 milliards de dollars
- D'une année à l'autre, les permis ont augmenté de 5,9 %

</div>

La valeur totale des permis de bâtir a augmenté de 14,9 % pour s'établir à 13,8 milliards de dollars en octobre 2025, après une baisse en septembre. D'une année à l'autre, la valeur totale des permis a progressé de 5,9 % par rapport à octobre 2024.

Les permis résidentiels ont augmenté de 14,6 % pour atteindre 8,6 milliards de dollars, grâce aux hausses des intentions de construction de logements collectifs qui ont atteint 5,9 milliards de dollars. Les permis pour les maisons individuelles ont totalisé 2,6 milliards de dollars.

Les permis non résidentiels ont augmenté de 13,3 % pour s'établir à 5,3 milliards de dollars, avec des gains dans les secteurs commercial, industriel et institutionnel.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles du Tableau 34-10-0292 de Statistique Canada (valeurs en milliards $)
// Octobre 2025 tiré du Quotidien, 12 décembre 2025
const permitsData = [
  {date: new Date("2023-01"), total: 11.2},
  {date: new Date("2023-02"), total: 10.8},
  {date: new Date("2023-03"), total: 11.5},
  {date: new Date("2023-04"), total: 11.1},
  {date: new Date("2023-05"), total: 10.9},
  {date: new Date("2023-06"), total: 11.4},
  {date: new Date("2023-07"), total: 11.6},
  {date: new Date("2023-08"), total: 10.7},
  {date: new Date("2023-09"), total: 11.3},
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
  {date: new Date("2025-09"), total: 12.0},
  {date: new Date("2025-10"), total: 13.8}
];

display(Plot.plot({
  title: "Valeur totale des permis de bâtir (en milliards $)",
  width: 680,
  height: 300,
  y: {domain: [9, 14], grid: true, label: "Milliards $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(permitsData, {x: "date", y: "total", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(permitsData.slice(-1), {x: "date", y: "total", fill: "#AF3C43", r: 5}),
    Plot.text(permitsData.slice(-1), {x: "date", y: "total", text: d => d.total.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Composantes résidentielles et non résidentielles

Les permis de bâtir résidentiels, qui représentent environ 62 % du total, ont augmenté de 14,6 % en octobre pour atteindre 8,6 milliards de dollars. Les permis pour les logements collectifs ont atteint 5,9 milliards de dollars, tandis que les permis pour les maisons individuelles ont totalisé 2,6 milliards de dollars.

Les permis non résidentiels ont augmenté de 13,3 % pour s'établir à 5,3 milliards de dollars, avec des gains dans les secteurs commercial, industriel et institutionnel.

```js
const componentData = [
  {component: "Résidentiel (total)", change: 14.6},
  {component: "Non résidentiel (total)", change: 13.3},
  {component: "Logements collectifs", change: 15.2},
  {component: "Maisons individuelles", change: 12.8},
  {component: "Commercial", change: 14.1},
  {component: "Industriel", change: 12.5},
  {component: "Institutionnel", change: 11.8}
];

display(Plot.plot({
  title: "Variation mensuelle par composante (%)",
  width: 600,
  height: 280,
  marginLeft: 180,
  marginRight: 50,
  x: {domain: [0, 18], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(componentData, {
      y: "component",
      x: "change",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(componentData, {
      y: "component",
      x: 18,
      text: d => "+" + d.change.toFixed(1).replace(".", ",") + " %",
      textAnchor: "start",
      dx: 5,
      fill: "currentColor"
    })
  ]
}));
```

## Variation provinciale

Les permis de bâtir ont augmenté dans la plupart des provinces en octobre. Des gains généralisés ont été enregistrés partout au Canada, menés par l'Ontario et la Colombie-Britannique.

| Province | Octobre 2025 (en millions $) | Variation mensuelle |
|----------|------------------------------|---------------------|
| Ontario | 5 100 | +16,2 % |
| Colombie-Britannique | 2 150 | +15,8 % |
| Québec | 2 890 | +14,5 % |
| Alberta | 1 620 | +13,1 % |
| Manitoba | 315 | +12,8 % |
| Saskatchewan | 225 | +11,5 % |
| Nouvelle-Écosse | 245 | +10,2 % |
| Nouveau-Brunswick | 185 | +9,8 % |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur les permis de bâtir fournissent une indication précoce de l'activité future de la construction. La valeur des permis représente les intentions de construction des titulaires de permis et peut différer de la construction réelle.

Les données sont désaisonnalisées pour tenir compte des tendances saisonnières régulières dans l'activité de construction.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 34-10-0292](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=3410029201)
**Enquête :** Enquête sur les permis de bâtir
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/3410029201-fra](https://doi.org/10.25318/3410029201-fra)

</div>
