---
title: Les mises en chantier en hausse de 9,4 % en novembre 2025
toc: false
---

# Les mises en chantier en hausse de 9,4 % en novembre 2025

<p class="release-date">Diffusion : 16 décembre 2025</p>

<div class="highlights">

**Faits saillants**

- Les mises en chantier ont augmenté de 9,4 % pour atteindre 254 058 unités (taux annuel désaisonnalisé) en novembre 2025
- Les mises en chantier de logements collectifs ont progressé de 14,5 % pour atteindre 193 800 unités
- Les mises en chantier de maisons individuelles ont reculé de 2,9 % pour s'établir à 39 700 unités
- D'une année à l'autre, les mises en chantier réelles dans les régions urbaines ont diminué de 3 %

</div>

Les mises en chantier ont augmenté de 9,4 % pour atteindre un taux annuel désaisonnalisé de 254 058 unités en novembre 2025, rebondissant après une baisse de 17 % en octobre. La hausse a été stimulée par une augmentation des intentions de construction de logements collectifs.

Les mises en chantier de logements collectifs ont progressé de 14,5 % pour atteindre 193 800 unités en novembre, tandis que les mises en chantier de maisons individuelles ont reculé de 2,9 % pour s'établir à 39 700 unités. La tendance sur six mois des mises en chantier a diminué de 1,7 % pour s'établir à 264 445 unités, montrant des signes de ralentissement de la construction résidentielle.

```js
import * as Plot from "npm:@observablehq/plot";

// Données du Tableau 34-10-0158 de Statistique Canada (TAAD, milliers d'unités)
const startsData = [
  {date: new Date("2024-01"), total: 231.3},
  {date: new Date("2024-02"), total: 260.0},
  {date: new Date("2024-03"), total: 242.2},
  {date: new Date("2024-04"), total: 242.4},
  {date: new Date("2024-05"), total: 267.5},
  {date: new Date("2024-06"), total: 241.4},
  {date: new Date("2024-07"), total: 275.9},
  {date: new Date("2024-08"), total: 213.2},
  {date: new Date("2024-09"), total: 224.0},
  {date: new Date("2024-10"), total: 244.8},
  {date: new Date("2024-11"), total: 267.3},
  {date: new Date("2024-12"), total: 236.2},
  {date: new Date("2025-01"), total: 239.1},
  {date: new Date("2025-02"), total: 229.9},
  {date: new Date("2025-03"), total: 214.1},
  {date: new Date("2025-04"), total: 262.2},
  {date: new Date("2025-05"), total: 269.9},
  {date: new Date("2025-06"), total: 262.3},
  {date: new Date("2025-07"), total: 252.1},
  {date: new Date("2025-08"), total: 217.4},
  {date: new Date("2025-09"), total: 223.7},
  {date: new Date("2025-10"), total: 232.2},
  {date: new Date("2025-11"), total: 254.1}
];

display(Plot.plot({
  title: "Mises en chantier (taux annuel désaisonnalisé, milliers d'unités)",
  width: 680,
  height: 300,
  y: {domain: [200, 290], grid: true, label: "Milliers d'unités"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(startsData, {x: "date", y: "total", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(startsData.slice(-1), {x: "date", y: "total", fill: "#AF3C43", r: 5}),
    Plot.text(startsData.slice(-1), {x: "date", y: "total", text: d => d.total.toFixed(1).replace(".", ",") + " K", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Répartition par type de logement

Les mises en chantier de logements collectifs, qui comprennent les appartements, les maisons en rangée et les maisons jumelées, représentaient 83 % du total des mises en chantier en novembre. Les appartements et autres types de logements ont mené la hausse, passant à 158 500 unités contre 134 500 unités en octobre.

```js
const dwellingData = [
  {type: "Maisons individuelles", nov: 39.7, oct: 40.9, change: -2.9},
  {type: "Maisons jumelées", nov: 11.9, oct: 11.6, change: 2.6},
  {type: "Maisons en rangée", nov: 23.0, oct: 23.2, change: -0.9},
  {type: "Appartements et autres", nov: 158.5, oct: 134.5, change: 17.8}
];

display(Plot.plot({
  title: "Mises en chantier par type de logement, novembre 2025 (milliers d'unités)",
  width: 600,
  height: 250,
  marginLeft: 160,
  x: {grid: true, label: "Milliers d'unités"},
  y: {label: null},
  marks: [
    Plot.barX(dwellingData, {
      y: "type",
      x: "nov",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(dwellingData, {
      y: "type",
      x: "nov",
      text: d => d.nov.toFixed(1).replace(".", ",") + " K",
      dx: 25,
      fill: "currentColor"
    })
  ]
}));
```

## Faits saillants provinciaux

Le Québec a mené toutes les provinces avec 63 500 unités en rythme annuel en novembre, suivi de l'Ontario avec 55 100 unités. L'Alberta a enregistré 53 600 unités, tandis que la Colombie-Britannique a déclaré 41 600 unités.

| Province | Novembre 2025 (TAAD, milliers) | Part du total |
|----------|-------------------------------|---------------|
| Québec | 63,5 | 25,0 % |
| Ontario | 55,1 | 21,7 % |
| Alberta | 53,6 | 21,1 % |
| Colombie-Britannique | 41,6 | 16,4 % |
| Manitoba | 14,1 | 5,6 % |
| Nouveau-Brunswick | 12,5 | 4,9 % |
| Nouvelle-Écosse | 7,6 | 3,0 % |
| Saskatchewan | 3,4 | 1,3 % |
| Terre-Neuve-et-Labrador | 2,1 | 0,8 % |
| Île-du-Prince-Édouard | 0,6 | 0,2 % |

## Rendement des régions métropolitaines

Parmi les grandes régions urbaines, Montréal a affiché une augmentation de 24 % d'une année à l'autre des mises en chantier réelles, compensant partiellement les baisses à Toronto (-11 %) et à Vancouver (-1 %).

<div class="note-to-readers">

## Note aux lecteurs

Les données sur les mises en chantier sont compilées par la Société canadienne d'hypothèques et de logement (SCHL) et représentent le nombre de nouvelles unités de logement résidentiel dont la construction a commencé.

Les taux annuels désaisonnalisés (TAAD) sont utilisés pour faciliter les comparaisons d'un mois à l'autre en éliminant les tendances saisonnières régulières. La tendance sur six mois est une moyenne mobile qui atténue la volatilité mensuelle.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 34-10-0158](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=3410015801)
**Enquête :** Société canadienne d'hypothèques et de logement, Mises en chantier
**Période de référence :** Novembre 2025
**DOI :** [https://doi.org/10.25318/3410015801-fra](https://doi.org/10.25318/3410015801-fra)

</div>

<details>
<summary>Reproductibilité : Code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Télécharger les mises en chantier (DTAD par province)
starts_saar <- get_cansim("34-10-0158") %>%
  filter(GEO == "Canada") %>%
  filter(REF_DATE >= "2024-01") %>%
  select(REF_DATE, VALUE) %>%
  arrange(REF_DATE)

# Télécharger les mises en chantier par type de logement
starts_type <- get_cansim("34-10-0156") %>%
  filter(GEO == "Canada") %>%
  filter(`Type of dwelling` %in% c("Single", "Semi-detached", "Row", "Apartment")) %>%
  filter(REF_DATE == "2025-11") %>%
  select(`Type of dwelling`, VALUE)

# Calculer la variation d'un mois à l'autre
nov2025 <- starts_saar %>% filter(REF_DATE == "2025-11") %>% pull(VALUE)
oct2025 <- starts_saar %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
mom_change <- (nov2025 - oct2025) / oct2025 * 100

# Calculer la variation d'une année à l'autre
nov2024 <- starts_saar %>% filter(REF_DATE == "2024-11") %>% pull(VALUE)
yoy_change <- (nov2025 - nov2024) / nov2024 * 100
```

</details>
