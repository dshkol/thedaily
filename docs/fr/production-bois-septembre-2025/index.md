---
title: La production de bois d'oeuvre en baisse de 2,7 % sur un an en septembre 2025
toc: false
---

# La production de bois d'oeuvre en baisse de 2,7 % sur un an en septembre 2025

<p class="release-date">Diffusion : 29 decembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- La production de bois d'oeuvre a atteint 3 845 milliers de metres cubes en septembre 2025, en baisse de 2,7 % par rapport a septembre 2024
- Les expeditions ont augmente de 2,2 % sur un an pour atteindre 4 016 milliers de metres cubes, tandis que les stocks ont diminue de 14,8 %
- Le Quebec a mene la production provinciale avec 1 190 milliers de metres cubes, en hausse de 15,8 % par rapport a l'annee precedente
- La production de l'interieur de la Colombie-Britannique a diminue de 23,3 % sur un an pour atteindre 883 milliers de metres cubes
- Les resineux representaient 98,1 % de la production totale, l'epinette, le pin et le sapin constituant 90,9 % des resineux

</div>

Les scieries canadiennes ont produit 3 845 milliers de metres cubes de bois d'oeuvre en septembre 2025, en hausse de 2,3 % par rapport a aout, mais en baisse de 2,7 % par rapport au meme mois l'annee precedente. Pour les neuf premiers mois de 2025, la production a totalise 35 737 milliers de metres cubes, en baisse de 3,9 % par rapport a la meme periode en 2024.

Les expeditions ont depasse la production en septembre, atteignant 4 016 milliers de metres cubes, en hausse de 14,4 % par rapport a aout et de 2,2 % par rapport a septembre 2024. Le niveau plus eleve des expeditions par rapport a la production a contribue a une baisse des stocks, qui ont diminue de 2,8 % par rapport a aout pour atteindre 6 436 milliers de metres cubes et etaient en baisse de 14,8 % sur un an.

```js
import * as Plot from "npm:@observablehq/plot";

// Donnees reelles de Statistique Canada, Tableau 16-10-0017
const productionData = [
  {date: new Date("2023-10"), value: 4485},
  {date: new Date("2023-11"), value: 4486},
  {date: new Date("2023-12"), value: 3413},
  {date: new Date("2024-01"), value: 3996},
  {date: new Date("2024-02"), value: 4352},
  {date: new Date("2024-03"), value: 4397},
  {date: new Date("2024-04"), value: 4557},
  {date: new Date("2024-05"), value: 4475},
  {date: new Date("2024-06"), value: 3988},
  {date: new Date("2024-07"), value: 3682},
  {date: new Date("2024-08"), value: 3773},
  {date: new Date("2024-09"), value: 3951},
  {date: new Date("2024-10"), value: 4251},
  {date: new Date("2024-11"), value: 3997},
  {date: new Date("2024-12"), value: 3333},
  {date: new Date("2025-01"), value: 3872},
  {date: new Date("2025-02"), value: 3687},
  {date: new Date("2025-03"), value: 4326},
  {date: new Date("2025-04"), value: 4278},
  {date: new Date("2025-05"), value: 4144},
  {date: new Date("2025-06"), value: 3996},
  {date: new Date("2025-07"), value: 3832},
  {date: new Date("2025-08"), value: 3758},
  {date: new Date("2025-09"), value: 3845}
];

display(Plot.plot({
  title: "Production totale de bois d'oeuvre, octobre 2023 a septembre 2025",
  width: 680,
  height: 300,
  y: {domain: [3000, 4800], grid: true, label: "Milliers de metres cubes"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(productionData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(productionData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(productionData.slice(-1), {x: "date", y: "value", text: d => d.value.toLocaleString("fr-CA"), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Production provinciale

Le Quebec etait la plus grande province productrice de bois d'oeuvre en septembre 2025, avec une production de 1 190 milliers de metres cubes, en hausse de 15,8 % par rapport a septembre 2024. L'Alberta a suivi avec 759 milliers de metres cubes, en hausse de 2,5 % sur un an.

La production de l'interieur de la Colombie-Britannique a diminue de 23,3 % sur un an pour atteindre 883 milliers de metres cubes. En Colombie-Britannique, l'interieur nord a diminue de 24,4 % pour atteindre 425 milliers de metres cubes, tandis que l'interieur sud a baisse de 22,2 % pour atteindre 458 milliers de metres cubes.

```js
const provincialData = [
  {name: "Quebec", value: 1190, yoy: 15.8},
  {name: "Interieur de la C.-B.", value: 883, yoy: -23.3},
  {name: "Alberta", value: 759, yoy: 2.5},
  {name: "Interieur sud, C.-B.", value: 458, yoy: -22.2},
  {name: "Interieur nord, C.-B.", value: 425, yoy: -24.4},
  {name: "Ontario", value: 401, yoy: null},
  {name: "Nouvelle-Ecosse", value: 82, yoy: -1.6},
  {name: "Saskatchewan", value: 74, yoy: null}
];

display(Plot.plot({
  title: "Production de bois d'oeuvre par region, septembre 2025 (milliers de metres cubes)",
  width: 680,
  height: 340,
  marginLeft: 160,
  marginRight: 60,
  x: {grid: true, label: "Milliers de metres cubes"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(provincialData, {
      y: "name",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(provincialData, {
      y: "name",
      x: 1250,
      text: d => d.value.toLocaleString("fr-CA"),
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Composition par essence

Les resineux ont domine la production de bois d'oeuvre en septembre 2025, representant 3 773 milliers de metres cubes, soit 98,1 % du total. La production de feuillus a totalise 72 milliers de metres cubes.

Parmi les resineux, l'epinette, le pin et le sapin (EPS) representaient 3 428 milliers de metres cubes, soit 90,9 % de la production de resineux. La production de sapin de Douglas et de meleze de l'Ouest a totalise 140 milliers de metres cubes, tandis que la production de thuya geant a atteint 52 milliers de metres cubes.

```js
// Grille 20x5 (100 cellules) correspondant a la largeur standard de 640px
const cols = 20;
const shares = [
  {source: "Epinette, pin, sapin (89 %)", pct: 89, color: "#AF3C43"},
  {source: "Autres resineux (9 %)", pct: 9, color: "#E57373"},
  {source: "Feuillus (2 %)", pct: 2, color: "#FFAB91"}
];

let waffle = [];
let idx = 0;
for (const s of shares) {
  for (let i = 0; i < s.pct; i++) {
    waffle.push({x: idx % cols, y: Math.floor(idx / cols), source: s.source});
    idx++;
  }
}

display(Plot.plot({
  title: "Production de bois d'oeuvre par groupe d'essences, septembre 2025",
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

## Production, expeditions et stocks

Les expeditions de 4 016 milliers de metres cubes ont depasse la production de 3 845 milliers de metres cubes en septembre 2025, reduisant les niveaux des stocks. Les stocks ont diminue a 6 436 milliers de metres cubes a la fin de septembre, leur niveau le plus bas en 13 mois.

```js
const indicatorData = [
  {date: new Date("2024-09"), production: 3951, expeditions: 3929, stocks: 7556},
  {date: new Date("2024-10"), production: 4251, expeditions: 4442, stocks: 7337},
  {date: new Date("2024-11"), production: 3997, expeditions: 4054, stocks: 6981},
  {date: new Date("2024-12"), production: 3333, expeditions: 3184, stocks: 7166},
  {date: new Date("2025-01"), production: 3872, expeditions: 3801, stocks: 7079},
  {date: new Date("2025-02"), production: 3687, expeditions: 3429, stocks: 7349},
  {date: new Date("2025-03"), production: 4326, expeditions: 4201, stocks: 7048},
  {date: new Date("2025-04"), production: 4278, expeditions: 3956, stocks: 7425},
  {date: new Date("2025-05"), production: 4144, expeditions: 4356, stocks: 7198},
  {date: new Date("2025-06"), production: 3996, expeditions: 4240, stocks: 6814},
  {date: new Date("2025-07"), production: 3832, expeditions: 4056, stocks: 6500},
  {date: new Date("2025-08"), production: 3758, expeditions: 3509, stocks: 6620},
  {date: new Date("2025-09"), production: 3845, expeditions: 4016, stocks: 6436}
];

display(Plot.plot({
  title: "Production et expeditions, septembre 2024 a septembre 2025",
  width: 680,
  height: 300,
  y: {domain: [3000, 4600], grid: true, label: "Milliers de metres cubes"},
  x: {type: "utc", label: null},
  color: {legend: true},
  marks: [
    Plot.lineY(indicatorData, {x: "date", y: "production", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.lineY(indicatorData, {x: "date", y: "expeditions", stroke: "#2e7d32", strokeWidth: 2, strokeDasharray: "4,2"}),
    Plot.dot(indicatorData.slice(-1), {x: "date", y: "production", fill: "#AF3C43", r: 4}),
    Plot.dot(indicatorData.slice(-1), {x: "date", y: "expeditions", fill: "#2e7d32", r: 4}),
    Plot.text([{x: new Date("2025-04"), y: 4400, text: "Production"}], {x: "x", y: "y", text: "text", fill: "#AF3C43", fontSize: 11}),
    Plot.text([{x: new Date("2025-04"), y: 4200, text: "Expeditions"}], {x: "x", y: "y", text: "text", fill: "#2e7d32", fontSize: 11})
  ]
}));
```

| Indicateur | Septembre 2025 | Aout 2025 | Var. mensuelle | Septembre 2024 | Var. annuelle |
|-----------|---------------:|------------:|-----------:|---------------:|-----------:|
| Production | 3 845 | 3 758 | +2,3 % | 3 951 | -2,7 % |
| Expeditions | 4 016 | 3 509 | +14,4 % | 3 929 | +2,2 % |
| Stocks | 6 436 | 6 620 | -2,8 % | 7 556 | -14,8 % |

<div class="note-to-readers">

## Note aux lecteurs

Les donnees sur la production, les expeditions et les stocks de bois d'oeuvre sont recueillies aupres des scieries produisant 50 milliers de pieds-planche ou plus par annee. Les donnees sont declarees en metres cubes. Les essences de resineux comprennent l'epinette, le pin, le sapin, le sapin de Douglas, le meleze de l'Ouest, la pruche et le thuya geant. Les feuillus comprennent toutes les autres essences de bois d'oeuvre.

Les donnees de la Colombie-Britannique sont desagregees en regions cotieres et interieures, l'interieur etant subdivise en sous-regions nord et sud. Certaines donnees provinciales sont supprimees pour respecter les exigences de confidentialite.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 16-10-0017](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1610001701)
**Enquete :** Enquete mensuelle sur les scieries
**Periode de reference :** Septembre 2025
**DOI :** [https://doi.org/10.25318/1610001701-fra](https://doi.org/10.25318/1610001701-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "production-bois-septembre-2025", "fr"));
```
