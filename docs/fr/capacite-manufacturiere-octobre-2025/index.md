---
title: Le taux d'utilisation de la capacite industrielle progresse de 0,1 point de pourcentage en octobre 2025
toc: false
---

# Le taux d'utilisation de la capacite industrielle progresse de 0,1 point de pourcentage en octobre 2025

<p class="release-date">Diffusion : 30 decembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- Le taux d'utilisation de la capacite industrielle s'est etabli a 80,8 % en octobre 2025, en hausse de 0,1 point de pourcentage par rapport a octobre 2024
- D'un mois a l'autre, le taux a augmente de 0,5 point de pourcentage par rapport a 80,3 % en septembre
- La fabrication de produits du petrole et du charbon a affiche le taux le plus eleve a 90,8 %
- Les usines de produits textiles ont enregistre la plus forte hausse d'une annee a l'autre (+11,4 pp), tandis que les produits en caoutchouc ont connu la plus forte baisse (-12,9 pp)

</div>

Les fabricants canadiens ont fonctionne a 80,8 % de leur capacite en octobre 2025, pratiquement inchange par rapport a 80,7 % un an plus tot. Sur une base mensuelle, le taux d'utilisation a augmente de 0,5 point de pourcentage par rapport a septembre 2025.

La hausse modeste d'une annee a l'autre reflete des mouvements compensatoires entre les industries, les gains dans la fabrication de textiles et de vetements etant contrebalances par les baisses dans les produits en caoutchouc et les produits metalliques.

```js
import * as Plot from "npm:@observablehq/plot";

// Donnees reelles de Statistique Canada, Tableau 16-10-0012
const capacityData = [
  {date: new Date("2024-10"), value: 80.7},
  {date: new Date("2024-11"), value: 79.7},
  {date: new Date("2024-12"), value: 75.6},
  {date: new Date("2025-01"), value: 78.0},
  {date: new Date("2025-02"), value: 77.2},
  {date: new Date("2025-03"), value: 80.2},
  {date: new Date("2025-04"), value: 77.0},
  {date: new Date("2025-05"), value: 78.4},
  {date: new Date("2025-06"), value: 78.6},
  {date: new Date("2025-07"), value: 76.8},
  {date: new Date("2025-08"), value: 79.0},
  {date: new Date("2025-09"), value: 80.3},
  {date: new Date("2025-10"), value: 80.8}
];

display(Plot.plot({
  title: "Taux d'utilisation de la capacite industrielle, octobre 2024 a octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [72, 84], grid: true, label: "Pourcentage"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(capacityData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(capacityData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(capacityData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " %", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Utilisation par industrie

La fabrication de produits du petrole et du charbon a fonctionne au taux le plus eleve (90,8 %), suivie de la fabrication de materiel de transport (88,9 %) et de la fabrication de produits informatiques et electroniques (87,9 %).

A l'autre extremite, la fabrication de produits en caoutchouc a fonctionne a 72,0 % de sa capacite, suivie de la fabrication de produits metalliques (72,5 %) et de la fabrication de produits en bois (73,3 %).

```js
const industries = [
  {name: "Petrole et charbon", value: 90.8},
  {name: "Materiel de transport", value: 88.9},
  {name: "Informatique et electronique", value: 87.9},
  {name: "Textiles", value: 84.2},
  {name: "Meubles", value: 83.9},
  {name: "Papier", value: 83.8},
  {name: "Vetements", value: 82.6},
  {name: "Aliments", value: 82.0}
];

display(Plot.plot({
  title: "Taux d'utilisation par industrie, octobre 2025 (%)",
  width: 640,
  height: 340,
  marginLeft: 200,
  marginRight: 60,
  x: {domain: [60, 95], grid: true, label: "Pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([80.8], {stroke: "#666", strokeDasharray: "4,4"}),
    Plot.barX(industries, {
      y: "name",
      x: "value",
      x1: 60,
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(industries, {
      y: "name",
      x: d => d.value + 1,
      text: d => d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "start",
      fill: "currentColor",
      fontSize: 11
    }),
    Plot.text([{x: 80.8, label: "Total : 80,8 %"}], {
      x: "x",
      y: "Petrole et charbon",
      text: "label",
      dy: -20,
      fill: "#666",
      fontSize: 10
    })
  ]
}));
```

## Variation d'une annee a l'autre

Les usines de produits textiles ont enregistre la plus forte hausse d'une annee a l'autre, soit 11,4 points de pourcentage, passant de 72,8 % en octobre 2024 a 84,2 % en octobre 2025. La fabrication de vetements a suivi avec un gain de 9,9 points de pourcentage.

La fabrication de produits en caoutchouc a connu la plus forte baisse, reculant de 12,9 points de pourcentage pour passer de 84,9 % a 72,0 %. La fabrication de produits metalliques a diminue de 5,0 points de pourcentage.

```js
const yoyData = [
  {name: "Textiles", change: 11.4},
  {name: "Vetements", change: 9.9},
  {name: "Tabac", change: 6.2},
  {name: "Materiel de transport", change: 5.6},
  {name: "Meubles", change: 4.8},
  {name: "Impression", change: -3.0},
  {name: "Produits en bois", change: -3.0},
  {name: "Mineraux non metal.", change: -4.5},
  {name: "Produits metalliques", change: -5.0},
  {name: "Caoutchouc", change: -12.9}
];

display(Plot.plot({
  title: "Variation annuelle du taux d'utilisation, octobre 2025 (pp)",
  width: 640,
  height: 380,
  marginLeft: 180,
  marginRight: 60,
  x: {domain: [-16, 14], grid: true, label: "Variation en points de pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "name",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(yoyData, {
      y: "name",
      x: d => d.change >= 0 ? d.change + 0.5 : d.change - 0.5,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " pp",
      textAnchor: d => d.change >= 0 ? "start" : "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

Le taux d'utilisation de la capacite mesure dans quelle mesure les industries manufacturieres utilisent leur capacite de production. Il est calcule comme le rapport entre la production reelle et la production potentielle. Un taux plus eleve indique une plus grande utilisation de la capacite disponible.

Les donnees sont recueillies mensuellement aupres des fabricants et couvrent toutes les industries du secteur de la fabrication (SCIAN 31-33). Les estimations sont desaisonnalisees.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 16-10-0012](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1610001201)
**Enquete :** Enquete mensuelle sur les industries manufacturieres
**Periode de reference :** Octobre 2025
**DOI :** [https://doi.org/10.25318/1610001201-fra](https://doi.org/10.25318/1610001201-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "capacite-manufacturiere-octobre-2025", "fr"));
```
