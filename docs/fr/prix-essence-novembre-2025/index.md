---
title: Les prix de l'essence en hausse de 1,7 % en novembre 2025
toc: false
---

# Les prix de l'essence en hausse de 1,7 % en novembre 2025

<p class="release-date">Diffusion : 15 décembre 2025</p>

<div class="highlights">

**Faits saillants**

- Le prix moyen de l'essence a augmenté de 1,7 % pour atteindre 139,6 cents le litre en novembre 2025
- D'une année à l'autre, les prix de l'essence ont diminué de 7,8 %
- Vancouver a enregistré les prix les plus élevés à 162,0 cents le litre
- Edmonton affichait les prix les plus bas à 123,4 cents le litre

</div>

Le prix moyen national de l'essence ordinaire sans plomb aux stations libre-service a augmenté de 1,7 % pour atteindre 139,6 cents le litre en novembre 2025, après une baisse de 4,9 % en octobre. D'une année à l'autre, les prix de l'essence ont diminué de 7,8 % par rapport à novembre 2024.

La hausse mensuelle est survenue dans un contexte de perturbations dans les raffineries en Amérique du Nord. Les prix sont restés inférieurs aux niveaux de l'année précédente en raison de la baisse des prix mondiaux du pétrole brut par rapport à 2024.

```js
import * as Plot from "npm:@observablehq/plot";

// Données du Tableau 18-10-0001 de Statistique Canada
// Essence ordinaire sans plomb en libre-service (cents/litre)
const gasData = [
  {date: new Date("2023-01"), value: 150.3},
  {date: new Date("2023-02"), value: 148.5},
  {date: new Date("2023-03"), value: 150.3},
  {date: new Date("2023-04"), value: 160.1},
  {date: new Date("2023-05"), value: 158.8},
  {date: new Date("2023-06"), value: 161.6},
  {date: new Date("2023-07"), value: 163.1},
  {date: new Date("2023-08"), value: 170.6},
  {date: new Date("2023-09"), value: 168.3},
  {date: new Date("2023-10"), value: 157.4},
  {date: new Date("2023-11"), value: 152.2},
  {date: new Date("2023-12"), value: 145.4},
  {date: new Date("2024-01"), value: 144.1},
  {date: new Date("2024-02"), value: 149.9},
  {date: new Date("2024-03"), value: 157.3},
  {date: new Date("2024-04"), value: 169.8},
  {date: new Date("2024-05"), value: 167.6},
  {date: new Date("2024-06"), value: 162.4},
  {date: new Date("2024-07"), value: 166.5},
  {date: new Date("2024-08"), value: 162.1},
  {date: new Date("2024-09"), value: 150.3},
  {date: new Date("2024-10"), value: 151.6},
  {date: new Date("2024-11"), value: 151.4},
  {date: new Date("2024-12"), value: 150.5},
  {date: new Date("2025-01"), value: 156.7},
  {date: new Date("2025-02"), value: 157.7},
  {date: new Date("2025-03"), value: 154.8},
  {date: new Date("2025-04"), value: 139.2},
  {date: new Date("2025-05"), value: 141.7},
  {date: new Date("2025-06"), value: 140.7},
  {date: new Date("2025-07"), value: 139.6},
  {date: new Date("2025-08"), value: 141.6},
  {date: new Date("2025-09"), value: 144.2},
  {date: new Date("2025-10"), value: 137.2},
  {date: new Date("2025-11"), value: 139.6}
];

display(Plot.plot({
  title: "Prix de l'essence ordinaire sans plomb (cents le litre)",
  width: 680,
  height: 300,
  y: {domain: [120, 180], grid: true, label: "Cents le litre"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(gasData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(gasData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(gasData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " ¢", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation régionale

Les prix de l'essence ont continué de varier considérablement à travers le pays en novembre. Vancouver a enregistré les prix les plus élevés à 162,0 cents le litre, tandis qu'Edmonton affichait les prix les plus bas à 123,4 cents le litre.

Les villes de la Colombie-Britannique affichaient généralement les prix les plus élevés, reflétant la taxe sur le carbone et les autres taxes sur les carburants de la province. Les villes des Prairies ont continué d'avoir les prix les plus bas à l'échelle nationale.

```js
const cityData = [
  {city: "Vancouver, C.-B.", price: 162.0},
  {city: "Victoria, C.-B.", price: 160.0},
  {city: "Montréal, Qc", price: 156.0},
  {city: "St. John's, T.-N.-L.", price: 153.0},
  {city: "Québec, Qc", price: 150.0},
  {city: "Whitehorse, Yn", price: 150.0},
  {city: "Saint John, N.-B.", price: 149.0},
  {city: "Charlottetown, Î.-P.-É.", price: 147.0},
  {city: "Halifax, N.-É.", price: 143.0},
  {city: "Moyenne canadienne", price: 139.6},
  {city: "Toronto, Ont.", price: 137.0},
  {city: "Ottawa, Ont.", price: 136.0},
  {city: "Winnipeg, Man.", price: 131.0},
  {city: "Regina, Sask.", price: 129.0},
  {city: "Calgary, Alb.", price: 127.0},
  {city: "Edmonton, Alb.", price: 123.4}
];

display(Plot.plot({
  title: "Prix de l'essence par ville, novembre 2025 (cents le litre)",
  width: 600,
  height: 400,
  marginLeft: 160,
  x: {grid: true, label: "Cents le litre", domain: [110, 170]},
  y: {label: null},
  marks: [
    Plot.barX(cityData, {
      y: "city",
      x: "price",
      fill: d => d.city === "Moyenne canadienne" ? "#1f77b4" : "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(cityData, {
      y: "city",
      x: "price",
      text: d => d.price.toFixed(1).replace(".", ",") + " ¢",
      dx: 25,
      fill: "currentColor"
    })
  ]
}));
```

## Comparaison d'une année à l'autre

Les prix de l'essence en novembre 2025 étaient inférieurs de 7,8 % à ceux de novembre 2024, alors que les prix étaient en moyenne de 151,4 cents le litre. La baisse d'une année à l'autre reflète la diminution des prix mondiaux du pétrole brut par rapport à 2024.

Les prix ont atteint un sommet en 2024 à 169,8 cents le litre en avril et ont généralement diminué depuis, avec une baisse notable en avril 2025 qui a amené les prix sous la barre des 140 cents le litre pour la première fois depuis le début de 2022.

<div class="note-to-readers">

## Note aux lecteurs

Les prix de détail de l'essence sont recueillis pour 14 centres urbains à travers le Canada. Les prix représentent les moyennes mensuelles de l'essence ordinaire sans plomb aux stations libre-service.

Les prix de l'essence sont influencés par les prix mondiaux du pétrole brut, les opérations des raffineries, la demande saisonnière, les taxes et les conditions du marché local. Les prix peuvent varier considérablement d'une province à l'autre en raison des différences dans les taxes provinciales sur les carburants et la tarification du carbone.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 18-10-0001](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810000101)
**Enquête :** Prix de détail mensuels moyens de l'essence et du mazout
**Période de référence :** Novembre 2025
**DOI :** [https://doi.org/10.25318/1810000101-fra](https://doi.org/10.25318/1810000101-fra)

</div>

<details>
<summary>Reproductibilité : Code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Télécharger les données sur les prix de l'essence
gas <- get_cansim("18-10-0001") %>%
  filter(`Type of fuel` == "Regular unleaded gasoline at self service filling stations")

# Série chronologique de la moyenne nationale
national <- gas %>%
  filter(GEO == "Canada") %>%
  filter(REF_DATE >= "2023-01") %>%
  select(REF_DATE, VALUE) %>%
  arrange(REF_DATE)

# Prix par ville pour le mois le plus récent
cities <- gas %>%
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
