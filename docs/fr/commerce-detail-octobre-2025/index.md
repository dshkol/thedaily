---
title: Les ventes au détail reculent de 0,2 % en octobre 2025
toc: false
---

# Les ventes au détail reculent de 0,2 % en octobre 2025

<p class="release-date">Diffusion : 20 décembre 2025</p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont diminué de 0,2 % pour s'établir à 69,4 milliards de dollars en octobre 2025
- D'une année à l'autre, les ventes au détail ont augmenté de 2,0 % par rapport à octobre 2024
- Les magasins de vêtements et d'accessoires vestimentaires ont enregistré la plus forte hausse d'une année à l'autre, soit 9,8 %
- Les stations-service et les distributeurs de combustibles ont reculé de 3,0 % par rapport à octobre 2024

</div>

Les ventes au détail ont diminué de 0,2 % pour s'établir à 69,4 milliards de dollars en octobre 2025, après une baisse de 0,9 % en septembre. En excluant les concessionnaires de véhicules automobiles et de pièces, les ventes au détail ont reculé de 0,3 %.

D'une année à l'autre, les ventes au détail ont progressé de 2,0 % par rapport à octobre 2024. En volume, les ventes au détail ont augmenté de 1,2 % par rapport à l'année précédente.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles du Tableau 20-10-0056 de Statistique Canada (valeurs en milliards $)
const retailData = [
  {date: new Date("2023-01"), value: 66.3},
  {date: new Date("2023-02"), value: 65.7},
  {date: new Date("2023-03"), value: 65.3},
  {date: new Date("2023-04"), value: 65.6},
  {date: new Date("2023-05"), value: 65.7},
  {date: new Date("2023-06"), value: 66.0},
  {date: new Date("2023-07"), value: 65.9},
  {date: new Date("2023-08"), value: 65.9},
  {date: new Date("2023-09"), value: 66.6},
  {date: new Date("2023-10"), value: 66.5},
  {date: new Date("2023-11"), value: 66.6},
  {date: new Date("2023-12"), value: 66.3},
  {date: new Date("2024-01"), value: 66.1},
  {date: new Date("2024-02"), value: 66.2},
  {date: new Date("2024-03"), value: 66.2},
  {date: new Date("2024-04"), value: 66.8},
  {date: new Date("2024-05"), value: 66.0},
  {date: new Date("2024-06"), value: 65.9},
  {date: new Date("2024-07"), value: 66.9},
  {date: new Date("2024-08"), value: 67.1},
  {date: new Date("2024-09"), value: 67.5},
  {date: new Date("2024-10"), value: 68.0},
  {date: new Date("2024-11"), value: 68.3},
  {date: new Date("2024-12"), value: 70.0},
  {date: new Date("2025-01"), value: 69.7},
  {date: new Date("2025-02"), value: 69.2},
  {date: new Date("2025-03"), value: 69.8},
  {date: new Date("2025-04"), value: 70.0},
  {date: new Date("2025-05"), value: 69.2},
  {date: new Date("2025-06"), value: 70.1},
  {date: new Date("2025-07"), value: 69.5},
  {date: new Date("2025-08"), value: 70.2},
  {date: new Date("2025-09"), value: 69.6},
  {date: new Date("2025-10"), value: 69.4}
];

display(Plot.plot({
  title: "Ventes au détail (en milliards de dollars), désaisonnalisées",
  width: 680,
  height: 300,
  y: {domain: [62, 72], grid: true, label: "Milliards $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Ventes par secteur

Les concessionnaires de véhicules automobiles et de pièces, le plus important sous-secteur du commerce de détail, ont enregistré des ventes de 19,1 milliards de dollars en octobre, en hausse de 0,6 % par rapport à l'année précédente. Les ventes des détaillants de produits alimentaires et de boissons sont demeurées inchangées d'une année à l'autre, à 13,0 milliards de dollars.

Les magasins de vêtements et d'accessoires vestimentaires ont enregistré la plus forte augmentation d'une année à l'autre, soit 9,8 %, pour atteindre 3,1 milliards de dollars en octobre 2025.

```js
const sectorData = [
  {sector: "Vêtements et accessoires", change: 9.8},
  {sector: "Détaillants divers", change: 8.9},
  {sector: "Articles de sport, loisirs, livres", change: 7.3},
  {sector: "Marchandises diverses", change: 4.8},
  {sector: "Santé et soins personnels", change: 4.0},
  {sector: "Meubles, électronique, électroménagers", change: 3.1},
  {sector: "Matériaux de construction et jardinage", change: 2.0},
  {sector: "Épiceries et dépanneurs", change: 1.3},
  {sector: "Véhicules automobiles et pièces", change: 0.6},
  {sector: "Aliments et boissons", change: 0.0},
  {sector: "Concessionnaires d'automobiles neuves", change: -1.6},
  {sector: "Stations-service et combustibles", change: -3.0}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre par secteur (%)",
  width: 640,
  height: 380,
  marginLeft: 220,
  marginRight: 60,
  x: {domain: [-5, 12], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(sectorData, {
      y: "sector",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(sectorData, {
      y: "sector",
      x: d => d.change >= 0 ? 12 : -5,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      textAnchor: d => d.change >= 0 ? "start" : "end",
      dx: d => d.change >= 0 ? 5 : -5,
      fill: "currentColor"
    })
  ]
}));
```

## Variation provinciale

Les ventes au détail ont augmenté dans la plupart des provinces et territoires d'une année à l'autre. Le Nouveau-Brunswick a enregistré la plus forte croissance d'une année à l'autre parmi les provinces, soit 5,5 %, tandis que la Saskatchewan a affiché la plus faible augmentation, soit 0,8 %.

| Province | Octobre 2025 (en millions $) | Variation annuelle |
|----------|------------------------------|-------------------|
| Nouveau-Brunswick | 1 579 | +5,5 % |
| Île-du-Prince-Édouard | 307 | +4,6 % |
| Terre-Neuve-et-Labrador | 1 068 | +2,6 % |
| Colombie-Britannique | 9 444 | +2,6 % |
| Ontario | 25 859 | +2,1 % |
| Québec | 15 618 | +1,9 % |
| Nouvelle-Écosse | 1 874 | +1,6 % |
| Alberta | 8 927 | +1,4 % |
| Manitoba | 2 339 | +0,9 % |
| Saskatchewan | 2 178 | +0,8 % |

<div class="note-to-readers">

## Note aux lecteurs

Le présent communiqué porte sur les estimations mensuelles du commerce de détail. Les estimations sont fondées sur une enquête-échantillon auprès des détaillants partout au Canada.

Toutes les données du présent communiqué sont désaisonnalisées, sauf indication contraire. Pour obtenir des renseignements sur la désaisonnalisation, voir Données désaisonnalisées - Foire aux questions.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>
