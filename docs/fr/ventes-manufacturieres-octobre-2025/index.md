---
title: Les ventes du secteur manufacturier en baisse de 1,0 % en octobre 2025
toc: false
---

# Les ventes du secteur manufacturier en baisse de 1,0 % en octobre 2025

<p class="release-date">Diffusion : 25 décembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes du secteur manufacturier ont diminué de 1,0 % pour s'établir à 71,5 milliards de dollars en octobre 2025
- Les ventes ont progressé de 0,7 % par rapport à octobre 2024
- La fabrication d'aliments a mené toutes les industries avec 13,2 milliards de dollars
- Les ventes de matériel de transport ont totalisé 11,5 milliards de dollars

</div>

Les ventes du secteur manufacturier ont diminué de 1,0 % pour s'établir à 71,5 milliards de dollars en octobre 2025, après un gain de 3,5 % en septembre. D'une année à l'autre, les ventes ont progressé de 0,7 % par rapport à octobre 2024.

La baisse a été généralisée, 11 des 21 industries ayant déclaré des ventes plus faibles. La fabrication de matériel de transport et les métaux de première transformation figuraient parmi les principaux contributeurs à la diminution.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles du Tableau 16-10-0047 de Statistique Canada
const salesData = [
  {date: new Date("2024-10"), value: 71.0},
  {date: new Date("2024-11"), value: 71.5},
  {date: new Date("2024-12"), value: 71.8},
  {date: new Date("2025-01"), value: 72.8},
  {date: new Date("2025-02"), value: 72.4},
  {date: new Date("2025-03"), value: 71.3},
  {date: new Date("2025-04"), value: 69.3},
  {date: new Date("2025-05"), value: 68.3},
  {date: new Date("2025-06"), value: 68.9},
  {date: new Date("2025-07"), value: 70.5},
  {date: new Date("2025-08"), value: 69.8},
  {date: new Date("2025-09"), value: 72.2},
  {date: new Date("2025-10"), value: 71.5}
];

display(Plot.plot({
  title: "Ventes du secteur manufacturier, octobre 2024 à octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [65, 75], grid: true, label: "Milliards $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(salesData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Ventes par industrie

La fabrication d'aliments est demeurée la plus grande industrie, avec des ventes de 13,2 milliards de dollars en octobre. La fabrication de matériel de transport a suivi à 11,5 milliards de dollars, ce qui comprend l'assemblage de véhicules automobiles et la fabrication de pièces.

La première transformation des métaux a déclaré 5,1 milliards de dollars de ventes, tandis que la fabrication de produits chimiques a totalisé 5,2 milliards de dollars.

```js
const industries = [
  {name: "Fabrication d'aliments", value: 13.2},
  {name: "Matériel de transport", value: 11.5},
  {name: "Métaux de première transformation", value: 6.1},
  {name: "Produits chimiques", value: 5.2},
  {name: "Machines", value: 4.6},
  {name: "Produits métalliques", value: 4.4},
  {name: "Produits en plastique et en caoutchouc", value: 3.5},
  {name: "Pièces de véhicules automobiles", value: 3.0},
  {name: "Produits en bois", value: 2.9}
];

display(Plot.plot({
  title: "Ventes du secteur manufacturier par industrie, octobre 2025 (milliards $)",
  width: 680,
  height: 340,
  marginLeft: 240,
  marginRight: 60,
  x: {grid: true, label: "Milliards $"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(industries, {
      y: "name",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(industries, {
      y: "name",
      x: 14,
      text: d => d.value.toFixed(1).replace(".", ",") + " G$",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

Les ventes du secteur manufacturier représentent la valeur estimée des biens fabriqués et vendus par les établissements au Canada. Les estimations sont fondées sur une enquête auprès des établissements manufacturiers et sont désaisonnalisées.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 16-10-0047](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1610004701)
**Enquête :** Enquête mensuelle sur les industries manufacturières
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/1610004701-fra](https://doi.org/10.25318/1610004701-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "ventes-manufacturieres-octobre-2025", "fr"));
```
