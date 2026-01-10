---
title: La production d'électricité en baisse de 6,7 % en septembre 2025
verification_json: output/data_25_10_0015_enhanced.json
toc: false
---

# La production d'électricité en baisse de 6,7 % en septembre 2025

<p class="release-date">Diffusion : 25 décembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- La production d'électricité a diminué de 6,7 % pour s'établir à 44,4 TWh en septembre 2025
- Le Québec et l'Ontario ont chacun produit 12,6 TWh, représentant ensemble 57 % de la production nationale
- La production solaire a augmenté de 15,1 % d'une année à l'autre; le nucléaire a reculé de 10,8 %
- L'hydroélectricité a représenté 52 % de la production totale

</div>

La production d'électricité au Canada a totalisé 44,4 térawattheures (TWh) en septembre 2025, en baisse de 6,7 % par rapport à août. Comparativement à septembre 2024, la production a diminué de 2,4 %.

Le déclin saisonnier reflète une demande d'électricité plus faible à mesure que les besoins de climatisation estivaux diminuent. La production atteint généralement son sommet pendant les mois d'hiver, lorsque la demande de chauffage est la plus élevée.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles du Tableau 25-10-0015 de Statistique Canada
const generationData = [
  {date: new Date("2024-09"), value: 45.5},
  {date: new Date("2024-10"), value: 47.3},
  {date: new Date("2024-11"), value: 50.3},
  {date: new Date("2024-12"), value: 61.6},
  {date: new Date("2025-01"), value: 66.8},
  {date: new Date("2025-02"), value: 59.2},
  {date: new Date("2025-03"), value: 56.6},
  {date: new Date("2025-04"), value: 48.8},
  {date: new Date("2025-05"), value: 46.5},
  {date: new Date("2025-06"), value: 46.0},
  {date: new Date("2025-07"), value: 50.0},
  {date: new Date("2025-08"), value: 47.6},
  {date: new Date("2025-09"), value: 44.4}
];

display(Plot.plot({
  title: "Production d'électricité, septembre 2024 à septembre 2025",
  width: 680,
  height: 300,
  y: {domain: [40, 70], grid: true, label: "Térawattheures (TWh)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(generationData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(generationData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(generationData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " TWh", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Production par source

L'hydroélectricité est demeurée la source dominante d'électricité au Canada, produisant 22,9 TWh en septembre — représentant 52 % de la production totale. Les ressources hydroélectriques abondantes du Canada, particulièrement au Québec, en Colombie-Britannique et au Manitoba, en font l'un des plus grands producteurs hydroélectriques au monde.

Les combustibles fossiles (gaz naturel et charbon) ont contribué 11,7 TWh, tandis que les centrales nucléaires ont produit 6,4 TWh. L'énergie éolienne a ajouté 2,9 TWh au réseau.

```js
// Graphique en gaufre : l'hydroélectricité représente 52 % de la production totale
// Grille de 20×5 (100 cellules) pour correspondre à la largeur de l'article
const cols = 20;
const shares = [
  {source: "Hydroélectricité", pct: 52, color: "#AF3C43"},
  {source: "Combustibles fossiles", pct: 26, color: "#E57373"},
  {source: "Nucléaire", pct: 14, color: "#FFAB91"},
  {source: "Éolien", pct: 7, color: "#81C784"},
  {source: "Solaire", pct: 1, color: "#FFD54F"}
];

// Construire la grille de gaufre (20 colonnes × 5 rangées)
let waffle = [];
let idx = 0;
for (const s of shares) {
  for (let i = 0; i < s.pct; i++) {
    waffle.push({x: idx % cols, y: Math.floor(idx / cols), source: s.source});
    idx++;
  }
}

display(Plot.plot({
  title: "Production par source — L'hydroélectricité domine à 52 %",
  width: 640,
  height: 180,
  axis: null,
  color: {
    domain: shares.map(d => d.source),
    range: shares.map(d => d.color),
    legend: true
  },
  marks: [
    Plot.cell(waffle, {x: "x", y: "y", fill: "source", inset: 1, rx: 3})
  ]
}));
```

```js
// Graphique en sucettes pour les valeurs de production
const sources = [
  {source: "Hydroélectricité", value: 22.9},
  {source: "Combustibles fossiles", value: 11.7},
  {source: "Nucléaire", value: 6.4},
  {source: "Éolien", value: 2.9},
  {source: "Solaire", value: 0.6}
];

display(Plot.plot({
  title: "Production d'électricité par source, septembre 2025 (TWh)",
  width: 640,
  height: 220,
  marginLeft: 160,
  marginRight: 60,
  x: {domain: [0, 25], grid: true, label: "Térawattheures"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.link(sources, {
      y1: "source",
      y2: "source",
      x1: 0,
      x2: "value",
      stroke: "#AF3C43",
      strokeWidth: 2,
      sort: {y1: "-x2"}
    }),
    Plot.dot(sources, {
      y: "source",
      x: "value",
      fill: "#AF3C43",
      r: 6,
      sort: {y: "-x"}
    }),
    Plot.text(sources, {
      y: "source",
      x: "value",
      text: d => d.value.toFixed(1).replace(".", ",") + " TWh",
      dx: 12,
      textAnchor: "start",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Répartition provinciale

Le Québec et l'Ontario ont chacun produit environ 12 600 GWh en septembre, représentant ensemble 57 % de la production totale d'électricité du Canada. L'Alberta a contribué 16 %, suivie de la Colombie-Britannique à 13 %.

```js
const provinces = [
  {province: "Québec", value: 12645, pct: 28.5},
  {province: "Ontario", value: 12642, pct: 28.5},
  {province: "Alberta", value: 6964, pct: 15.7},
  {province: "Colombie-Britannique", value: 5627, pct: 12.7},
  {province: "Saskatchewan", value: 1954, pct: 4.4},
  {province: "Terre-Neuve-et-Labrador", value: 1787, pct: 4.0},
  {province: "Manitoba", value: 1447, pct: 3.3}
];

display(Plot.plot({
  title: "Production d'électricité par province, septembre 2025",
  width: 640,
  height: 280,
  marginLeft: 200,
  marginRight: 80,
  x: {domain: [0, 14000], grid: true, label: "Gigawattheures (GWh)"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.link(provinces, {
      y1: "province",
      y2: "province",
      x1: 0,
      x2: "value",
      stroke: "#AF3C43",
      strokeWidth: 2
    }),
    Plot.dot(provinces, {
      y: "province",
      x: "value",
      fill: "#AF3C43",
      r: 6
    }),
    Plot.text(provinces, {
      y: "province",
      x: "value",
      text: d => d.value.toLocaleString("fr-CA") + " (" + d.pct.toFixed(1).replace(".", ",") + " %)",
      dx: 8,
      textAnchor: "start",
      fontSize: 11
    })
  ]
}));
```

La production du Québec est presque entièrement hydroélectrique, tandis que l'Ontario dépend fortement de l'énergie nucléaire. La production de l'Alberta est dominée par le gaz naturel.

## Variation d'une année à l'autre par source

Comparativement à septembre 2024, la production solaire a augmenté de 15,1 % et les combustibles fossiles ont progressé de 8,6 %. Cependant, la production nucléaire a diminué de 10,8 %, l'éolien a reculé de 6,9 % et l'hydroélectricité a baissé de 4,7 %.

```js
const yoyData = [
  {source: "Solaire", change: 15.1, value: 611},
  {source: "Combustibles fossiles", change: 8.6, value: 11677},
  {source: "Hydroélectricité", change: -4.7, value: 22870},
  {source: "Éolien", change: -6.9, value: 2865},
  {source: "Nucléaire", change: -10.8, value: 6378}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre de la production par source (%)",
  width: 640,
  height: 220,
  marginLeft: 160,
  marginRight: 70,
  x: {domain: [-15, 20], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.link(yoyData, {
      y1: "source",
      y2: "source",
      x1: 0,
      x2: "change",
      stroke: "#AF3C43",
      strokeWidth: 2
    }),
    Plot.dot(yoyData, {
      y: "source",
      x: "change",
      fill: "#AF3C43",
      r: 6
    }),
    Plot.text(yoyData, {
      y: "source",
      x: 20,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 11
    })
  ]
}));
```

Le déclin de la production nucléaire reflète l'entretien planifié des installations d'Ontario Power Generation. La production éolienne a été plus faible en raison de vitesses de vent inférieures à la moyenne en septembre.

<div class="note-to-readers">

## Note aux lecteurs

Les données sur la production d'électricité comprennent l'électricité produite par les services publics d'électricité, les établissements industriels qui produisent de l'électricité pour leur propre usage et les autres producteurs d'électricité. Un térawattheure équivaut à 1 000 gigawattheures ou 1 000 000 mégawattheures.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 25-10-0015](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2510001501)
**Enquête :** Enquête mensuelle sur la production, les livraisons et les réceptions d'électricité et sur la charge de pointe mensuelle garantie
**Période de référence :** Septembre 2025
**DOI :** [https://doi.org/10.25318/2510001501-fra](https://doi.org/10.25318/2510001501-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "production-electricite-septembre-2025", "fr"));
```
