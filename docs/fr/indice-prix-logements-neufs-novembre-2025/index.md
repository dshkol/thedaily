---
title: Les prix des logements neufs inchangés en novembre 2025
toc: false
---

# Les prix des logements neufs inchangés en novembre 2025

<p class="release-date">Diffusion : 19 décembre 2025</p>

<div class="highlights">

**Faits saillants**

- L'Indice des prix des logements neufs est demeuré inchangé (0,0 %) en novembre 2025
- D'une année à l'autre, les prix des logements neufs ont diminué de 1,9 %
- Les prix des maisons ont reculé tandis que les prix des terrains se sont stabilisés
- La Saskatchewan a mené les hausses provinciales avec une augmentation de 0,5 %

</div>

L'Indice des prix des logements neufs (IPLN) est demeuré inchangé (0,0 %) en novembre 2025, après une baisse de 0,4 % en octobre. D'une année à l'autre, les prix des logements neufs ont diminué de 1,9 % par rapport à novembre 2024.

La valeur de l'indice national s'établissait à 122,2 (2017=100), poursuivant une baisse graduelle amorcée en avril 2025. Les prix des maisons (excluant les terrains) ont reculé de 0,1 % d'un mois à l'autre, tandis que les prix des terrains sont restés inchangés.

```js
import * as Plot from "npm:@observablehq/plot";

// Données du Tableau 18-10-0205 de Statistique Canada
// Indice des prix des logements neufs, Total (maison et terrain), 2017=100
const nhpiData = [
  {date: new Date("2023-01"), value: 125.2},
  {date: new Date("2023-02"), value: 124.9},
  {date: new Date("2023-03"), value: 124.9},
  {date: new Date("2023-04"), value: 124.8},
  {date: new Date("2023-05"), value: 124.9},
  {date: new Date("2023-06"), value: 125.0},
  {date: new Date("2023-07"), value: 124.9},
  {date: new Date("2023-08"), value: 125.0},
  {date: new Date("2023-09"), value: 124.7},
  {date: new Date("2023-10"), value: 124.7},
  {date: new Date("2023-11"), value: 124.4},
  {date: new Date("2023-12"), value: 124.4},
  {date: new Date("2024-01"), value: 124.3},
  {date: new Date("2024-02"), value: 124.4},
  {date: new Date("2024-03"), value: 124.4},
  {date: new Date("2024-04"), value: 124.7},
  {date: new Date("2024-05"), value: 124.9},
  {date: new Date("2024-06"), value: 124.7},
  {date: new Date("2024-07"), value: 125.0},
  {date: new Date("2024-08"), value: 125.0},
  {date: new Date("2024-09"), value: 125.0},
  {date: new Date("2024-10"), value: 124.5},
  {date: new Date("2024-11"), value: 124.6},
  {date: new Date("2024-12"), value: 124.5},
  {date: new Date("2025-01"), value: 124.4},
  {date: new Date("2025-02"), value: 124.5},
  {date: new Date("2025-03"), value: 124.5},
  {date: new Date("2025-04"), value: 124.0},
  {date: new Date("2025-05"), value: 123.7},
  {date: new Date("2025-06"), value: 123.4},
  {date: new Date("2025-07"), value: 123.3},
  {date: new Date("2025-08"), value: 122.9},
  {date: new Date("2025-09"), value: 122.7},
  {date: new Date("2025-10"), value: 122.2},
  {date: new Date("2025-11"), value: 122.2}
];

display(Plot.plot({
  title: "Indice des prix des logements neufs (2017=100)",
  width: 680,
  height: 300,
  y: {domain: [120, 128], grid: true, label: "Indice (2017=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(nhpiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(nhpiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(nhpiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ","), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Prix des maisons par rapport aux terrains

La composante maison seulement de l'indice (excluant les terrains) a reculé de 0,1 % en novembre, tandis que la composante terrain seulement est restée inchangée. D'une année à l'autre, les prix des maisons ont diminué de 1,7 % et les prix des terrains ont baissé de 2,5 %.

```js
const componentData = [
  {component: "Total (maison et terrain)", index: 122.2, yoyChange: -1.9},
  {component: "Maison seulement", index: 124.0, yoyChange: -1.7},
  {component: "Terrain seulement", index: 117.2, yoyChange: -2.5}
];

display(Plot.plot({
  title: "Composantes de l'IPLN, novembre 2025",
  width: 500,
  height: 200,
  marginLeft: 180,
  x: {domain: [110, 130], grid: true, label: "Indice (2017=100)"},
  y: {label: null},
  marks: [
    Plot.barX(componentData, {
      y: "component",
      x: "index",
      fill: "#AF3C43"
    }),
    Plot.text(componentData, {
      y: "component",
      x: "index",
      text: d => d.index.toFixed(1).replace(".", ","),
      dx: 20,
      fill: "currentColor"
    })
  ]
}));
```

## Variation provinciale

La Saskatchewan a mené les hausses provinciales avec une augmentation de 0,5 % en novembre, suivie du Manitoba et de l'Alberta à 0,3 % chacun. L'Ontario et la Colombie-Britannique ont enregistré de légères baisses de 0,1 % et 0,2 % respectivement.

Le Québec a continué d'afficher l'indice provincial le plus élevé à 148,7, reflétant une croissance des prix plus forte au cours de la dernière décennie par rapport aux autres provinces.

| Province | Indice (2017=100) | Variation mensuelle |
|----------|------------------|---------------------|
| Québec | 148,7 | +0,1 % |
| Manitoba | 145,0 | +0,3 % |
| Nouvelle-Écosse | 128,1 | 0,0 % |
| Colombie-Britannique | 125,0 | -0,2 % |
| Île-du-Prince-Édouard | 124,4 | 0,0 % |
| Canada | 122,2 | 0,0 % |
| Nouveau-Brunswick | 120,9 | 0,0 % |
| Ontario | 119,5 | -0,1 % |
| Alberta | 118,7 | +0,3 % |
| Saskatchewan | 109,8 | +0,5 % |
| Terre-Neuve-et-Labrador | 109,5 | 0,0 % |

<div class="note-to-readers">

## Note aux lecteurs

L'Indice des prix des logements neufs mesure les variations au fil du temps des prix de vente des entrepreneurs pour les maisons résidentielles neuves dont les caractéristiques détaillées restent inchangées entre deux périodes consécutives. L'indice couvre les maisons individuelles neuves, les maisons jumelées et les maisons en rangée.

L'indice utilise une année de base de 2017 (2017=100). Les valeurs supérieures à 100 indiquent des niveaux de prix plus élevés qu'en 2017.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 18-10-0205](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810020501)
**Enquête :** Indice des prix des logements neufs
**Période de référence :** Novembre 2025
**DOI :** [https://doi.org/10.25318/1810020501-fra](https://doi.org/10.25318/1810020501-fra)

</div>

<details>
<summary>Reproductibilité : Code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Télécharger les données de l'Indice des prix des logements neufs
nhpi <- get_cansim("18-10-0205")

# Série chronologique nationale (total maison et terrain)
national <- nhpi %>%
  filter(GEO == "Canada") %>%
  filter(`New housing price indexes` == "Total (house and land)") %>%
  filter(REF_DATE >= "2023-01") %>%
  select(REF_DATE, VALUE) %>%
  arrange(REF_DATE)

# Composantes pour le mois le plus récent
components <- nhpi %>%
  filter(GEO == "Canada") %>%
  filter(REF_DATE == "2025-11") %>%
  filter(`New housing price indexes` %in% c(
    "Total (house and land)", "House only", "Land only"
  )) %>%
  select(`New housing price indexes`, VALUE)

# Ventilation provinciale
provinces <- nhpi %>%
  filter(`New housing price indexes` == "Total (house and land)") %>%
  filter(REF_DATE == "2025-11") %>%
  filter(GEO != "Canada") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))

# Calculer les variations
nov2025 <- national %>% filter(REF_DATE == "2025-11") %>% pull(VALUE)
oct2025 <- national %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
nov2024 <- national %>% filter(REF_DATE == "2024-11") %>% pull(VALUE)

mom_change <- (nov2025 - oct2025) / oct2025 * 100
yoy_change <- (nov2025 - nov2024) / nov2024 * 100
```

</details>
