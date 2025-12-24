---
title: Les ventes en gros en légère hausse de 0,1 % en octobre 2025
toc: false
---

# Les ventes en gros en légère hausse de 0,1 % en octobre 2025

<p class="release-date">Diffusion : 12 décembre 2025</p>

<div class="highlights">

**Faits saillants**

- Les ventes en gros ont augmenté de 0,1 % pour atteindre 86,0 milliards de dollars en octobre 2025
- Les ventes de véhicules automobiles et de pièces ont progressé de 2,3 % pour atteindre 14,7 milliards de dollars
- Les ventes de produits agricoles ont bondi de 16,7 % pour atteindre 2,0 milliards de dollars
- En volume, les ventes en gros ont diminué de 0,7 %

</div>

Les ventes des grossistes canadiens ont augmenté de 0,1 % pour atteindre 86,0 milliards de dollars en octobre 2025, soit la cinquième hausse en six mois. En volume, les ventes en gros ont reculé de 0,7 %, ce qui indique que la hausse des prix a compensé les baisses de volume.

Les ventes ont augmenté dans quatre des sept sous-secteurs, représentant environ la moitié des ventes en gros totales. Les hausses ont été menées par les sous-secteurs des véhicules automobiles et pièces et des produits agricoles.

```js
import * as Plot from "npm:@observablehq/plot";

// Données du Tableau 20-10-0003 de Statistique Canada
// Commerce de gros excluant le pétrole et les oléagineux/céréales (en milliards $)
const salesData = [
  {date: new Date("2023-01"), value: 84.9},
  {date: new Date("2023-02"), value: 82.7},
  {date: new Date("2023-03"), value: 81.8},
  {date: new Date("2023-04"), value: 81.0},
  {date: new Date("2023-05"), value: 83.4},
  {date: new Date("2023-06"), value: 81.7},
  {date: new Date("2023-07"), value: 82.0},
  {date: new Date("2023-08"), value: 83.6},
  {date: new Date("2023-09"), value: 82.9},
  {date: new Date("2023-10"), value: 82.3},
  {date: new Date("2023-11"), value: 83.1},
  {date: new Date("2023-12"), value: 83.1},
  {date: new Date("2024-01"), value: 82.6},
  {date: new Date("2024-02"), value: 82.4},
  {date: new Date("2024-03"), value: 81.5},
  {date: new Date("2024-04"), value: 84.1},
  {date: new Date("2024-05"), value: 83.2},
  {date: new Date("2024-06"), value: 82.2},
  {date: new Date("2024-07"), value: 82.5},
  {date: new Date("2024-08"), value: 81.9},
  {date: new Date("2024-09"), value: 82.6},
  {date: new Date("2024-10"), value: 83.9},
  {date: new Date("2024-11"), value: 83.6},
  {date: new Date("2024-12"), value: 84.1},
  {date: new Date("2025-01"), value: 85.2},
  {date: new Date("2025-02"), value: 85.7},
  {date: new Date("2025-03"), value: 86.1},
  {date: new Date("2025-04"), value: 84.0},
  {date: new Date("2025-05"), value: 83.8},
  {date: new Date("2025-06"), value: 84.9},
  {date: new Date("2025-07"), value: 86.3},
  {date: new Date("2025-08"), value: 85.5},
  {date: new Date("2025-09"), value: 86.0},
  {date: new Date("2025-10"), value: 86.0}
];

display(Plot.plot({
  title: "Ventes en gros (en milliards $)",
  width: 680,
  height: 300,
  y: {domain: [78, 90], grid: true, label: "Milliards $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(salesData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Rendement par sous-secteur

Les ventes de véhicules automobiles et de pièces ont augmenté de 2,3 % pour atteindre 14,7 milliards de dollars en octobre, stimulées par les ventes plus élevées dans le groupe des véhicules automobiles. La hausse provient en grande partie des ventes en gros plus élevées de véhicules de tourisme fabriqués à l'étranger, ainsi que d'autobus et de camions de transport.

Les grossistes de produits agricoles ont affiché un bond de 16,7 % pour atteindre 2,0 milliards de dollars, marquant une sixième hausse mensuelle consécutive et une augmentation de 28,1 % d'une année à l'autre.

```js
const subsectorData = [
  {sector: "Véhicules automobiles et pièces", change: 2.3, value: 14.7},
  {sector: "Produits agricoles", change: 16.7, value: 2.0},
  {sector: "Aliments, boissons, tabac", change: -0.2, value: 15.2},
  {sector: "Machines et équipement", change: 0.5, value: 13.8},
  {sector: "Articles personnels et ménagers", change: -0.8, value: 8.4},
  {sector: "Matériaux de construction", change: 0.3, value: 10.1},
  {sector: "Divers", change: -3.7, value: 10.9}
];

display(Plot.plot({
  title: "Variation mensuelle par sous-secteur (%)",
  width: 600,
  height: 280,
  marginLeft: 200,
  x: {grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(subsectorData, {
      y: "sector",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#1f77b4",
      sort: {y: "-x"}
    }),
    Plot.text(subsectorData, {
      y: "sector",
      x: d => d.change >= 0 ? d.change + 0.5 : d.change - 0.5,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      textAnchor: d => d.change >= 0 ? "start" : "end",
      fill: "currentColor"
    })
  ]
}));
```

## Variation provinciale

L'Ontario a mené les hausses des ventes en gros provinciales en octobre, avec des ventes en hausse de 0,9 % pour atteindre 44,3 milliards de dollars. Sans l'Ontario, les ventes de marchandises en gros au Canada ont reculé de 0,8 %.

La plus forte baisse est survenue au Québec, où les ventes ont diminué de 2,9 % pour s'établir à 14,9 milliards de dollars. Les grossistes québécois ont déclaré des ventes plus faibles dans cinq des sept sous-secteurs, menées par le sous-secteur des aliments, boissons et tabac.

| Province | Octobre 2025 (en milliards $) | Variation mensuelle |
|----------|------------------------------|---------------------|
| Ontario | 44,3 | +0,9 % |
| Québec | 14,9 | -2,9 % |
| Colombie-Britannique | 8,5 | +0,2 % |
| Alberta | 8,2 | +0,1 % |
| Saskatchewan | 4,0 | +4,6 % |
| Manitoba | 2,0 | +5,0 % |
| Nouvelle-Écosse | 1,3 | -1,5 % |
| Nouveau-Brunswick | 0,8 | -3,5 % |

## Stocks

Les stocks totaux des grossistes sont restés pratiquement inchangés à 135,4 milliards de dollars en octobre. Le ratio des stocks aux ventes a légèrement diminué pour s'établir à 1,57 contre 1,58 en septembre.

Les baisses des stocks d'aliments, de boissons et de tabac (-2,6 %) et d'articles personnels et ménagers (-1,3 %) ont été compensées par les hausses des stocks de véhicules automobiles (+2,7 %).

<div class="note-to-readers">

## Note aux lecteurs

Les données de cette diffusion sont désaisonnalisées pour éliminer les tendances saisonnières régulières. La série principale exclut le pétrole, les produits pétroliers, les autres hydrocarbures, les oléagineux et les céréales afin de fournir une mesure moins touchée par la volatilité des prix de ces produits.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0003](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010000301)
**Enquête :** Enquête mensuelle sur le commerce de gros
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/2010000301-fra](https://doi.org/10.25318/2010000301-fra)

</div>

<details>
<summary>Reproductibilité : Code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Télécharger les données du commerce de gros
wholesale <- get_cansim("20-10-0003") %>%
  filter(GEO == "Canada") %>%
  filter(`Trade sector` == "Wholesale trade") %>%
  filter(`Adjustments` == "Seasonally adjusted")

# Série chronologique des ventes totales
sales_ts <- wholesale %>%
  filter(`North American Industry Classification System (NAICS)` ==
         "Wholesale trade [41]") %>%
  filter(REF_DATE >= "2023-01") %>%
  select(REF_DATE, VALUE) %>%
  arrange(REF_DATE)

# Ventilation par sous-secteur pour le mois le plus récent
subsectors <- wholesale %>%
  filter(REF_DATE == "2025-10") %>%
  filter(!grepl("Wholesale trade \\[41\\]",
         `North American Industry Classification System (NAICS)`)) %>%
  select(`North American Industry Classification System (NAICS)`, VALUE)

# Calculer les variations
oct2025 <- sales_ts %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
sep2025 <- sales_ts %>% filter(REF_DATE == "2025-09") %>% pull(VALUE)
mom_change <- (oct2025 - sep2025) / sep2025 * 100
```

</details>
