---
title: Le dollar canadien se renforce de 3,1 % par rapport au dollar américain en décembre 2025
---

# Le dollar canadien se renforce de 3,1 % par rapport au dollar américain en décembre 2025

<p class="release-date">Diffusion : 2026-01-06</p>

<div class="metric-box">
  <div class="value">1,38</div>
  <div class="label">CAD par USD, décembre 2025</div>
</div>

Le dollar canadien s'est renforcé par rapport au dollar américain en décembre 2025, avec un taux de change moyen de 1,3802 dollar canadien par dollar américain. Cela représente une appréciation de 3,1 % par rapport à décembre 2024, où le taux s'établissait à 1,4240. Sur une base mensuelle, le dollar canadien s'est apprécié de 1,8 % par rapport à novembre 2025.

<div class="highlights">

**Faits saillants**

- Le dollar canadien s'est apprécié de 3,1 % sur un an par rapport au dollar américain
- Le taux de change mensuel moyen était de 1,3802 CAD par USD en décembre 2025
- Le dollar canadien s'est affaibli par rapport aux devises européennes, l'euro et le franc suisse ayant tous deux augmenté de plus de 8 %
- La couronne suédoise a enregistré le gain le plus important par rapport au dollar canadien, soit 14,4 %

</div>

## Tendance du taux de change du dollar américain

Le taux de change a fluctué tout au long de 2025, atteignant un sommet de 1,4390 CAD par USD en janvier avant de diminuer au printemps. Après une brève reprise à l'automne, le taux est retombé à 1,3802 en décembre.

```js
import * as Plot from "npm:@observablehq/plot";

const exchangeData = [
  {date: new Date("2024-01"), rate: 1.3425},
  {date: new Date("2024-02"), rate: 1.3501},
  {date: new Date("2024-03"), rate: 1.3539},
  {date: new Date("2024-04"), rate: 1.3674},
  {date: new Date("2024-05"), rate: 1.3670},
  {date: new Date("2024-06"), rate: 1.3707},
  {date: new Date("2024-07"), rate: 1.3712},
  {date: new Date("2024-08"), rate: 1.3652},
  {date: new Date("2024-09"), rate: 1.3546},
  {date: new Date("2024-10"), rate: 1.3755},
  {date: new Date("2024-11"), rate: 1.3975},
  {date: new Date("2024-12"), rate: 1.4240},
  {date: new Date("2025-01"), rate: 1.4390},
  {date: new Date("2025-02"), rate: 1.4301},
  {date: new Date("2025-03"), rate: 1.4359},
  {date: new Date("2025-04"), rate: 1.3988},
  {date: new Date("2025-05"), rate: 1.3860},
  {date: new Date("2025-06"), rate: 1.3674},
  {date: new Date("2025-07"), rate: 1.3691},
  {date: new Date("2025-08"), rate: 1.3802},
  {date: new Date("2025-09"), rate: 1.3833},
  {date: new Date("2025-10"), rate: 1.3992},
  {date: new Date("2025-11"), rate: 1.4055},
  {date: new Date("2025-12"), rate: 1.3802}
];

display(Plot.plot({
  title: "Taux de change CAD par USD (moyenne mensuelle)",
  width: 640,
  height: 280,
  y: {domain: [1.30, 1.50], grid: true, label: "CAD par USD"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([1.35, 1.40, 1.45], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.areaY(exchangeData, {x: "date", y: "rate", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(exchangeData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(exchangeData, {x: "date", y: "rate", fill: "#AF3C43", r: 3})
  ]
}));
```

## Performance des devises par rapport au dollar canadien

La performance du dollar canadien a varié considérablement selon les principales devises des partenaires commerciaux en décembre 2025. Les devises européennes se sont nettement renforcées par rapport au dollar canadien, tandis que la plupart des devises asiatiques se sont affaiblies.

```js
const currencies = [
  {name: "Couronne suédoise", change: 14.4},
  {name: "Euro", change: 8.4},
  {name: "Franc suisse", change: 8.4},
  {name: "Peso mexicain", change: 8.6},
  {name: "Réal brésilien", change: 8.4},
  {name: "Sol péruvien", change: 7.5},
  {name: "Couronne norvégienne", change: 7.5},
  {name: "Rand sud-africain", change: 4.7},
  {name: "Livre sterling", change: 2.5},
  {name: "Dollar de Singapour", change: 1.4},
  {name: "Dollar australien", change: 1.5},
  {name: "Renminbi chinois", change: 0.2},
  {name: "Dollar néo-zélandais", change: -2.5},
  {name: "Riyal saoudien", change: -2.9},
  {name: "Dollar américain", change: -3.1},
  {name: "Dollar de Hong Kong", change: -3.2},
  {name: "Yen japonais", change: -4.4},
  {name: "Won sud-coréen", change: -5.0},
  {name: "Roupie indienne", change: -8.5}
];

display(Plot.plot({
  title: "Variation sur un an par rapport au CAD par devise (%)",
  width: 640,
  height: 480,
  marginLeft: 140,
  x: {domain: [-15, 20], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(currencies, {
      y: "name",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(currencies, {
      y: "name",
      x: "change",
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + " %",
      dx: d => d.change >= 0 ? 22 : -22,
      fill: "currentColor"
    })
  ]
}));
```

## Principales devises, décembre 2025

| Devise | CAD par unité | Variation sur un an |
|--------|--------------|---------------------|
| Livre sterling | 1,8469 | +2,5 % |
| Franc suisse | 1,7317 | +8,4 % |
| Euro | 1,6162 | +8,4 % |
| Dollar américain | 1,3802 | -3,1 % |
| Dollar de Singapour | 1,0689 | +1,4 % |
| Dollar australien | 0,9164 | +1,5 % |
| Dollar néo-zélandais | 0,7983 | -2,5 % |

<div class="note-to-readers">

## Note aux lecteurs

Ces taux de change représentent des moyennes mensuelles telles que calculées par la Banque du Canada. Les taux de change sont exprimés en dollars canadiens par unité de devise étrangère. Une diminution du taux indique que le dollar canadien s'est renforcé par rapport à la devise étrangère.

La Banque du Canada publie les taux de change quotidiens de midi et de clôture ainsi que les moyennes mensuelles pour un éventail de devises.

</div>

<details>
<summary>Reproductibilité : Code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Télécharger les données de taux de change
fx <- get_cansim("33-10-0163")

# Série chronologique USD/CAD
usd_cad <- fx %>%
  filter(`Type of currency` == "U.S. dollar, monthly average") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Taux de décembre 2025
dec2025 <- usd_cad %>% filter(REF_DATE == "2025-12") %>% pull(VALUE)
dec2024 <- usd_cad %>% filter(REF_DATE == "2024-12") %>% pull(VALUE)
variation_annuelle <- (dec2025 - dec2024) / dec2024 * 100

# Toutes les devises, décembre 2025
toutes_devises <- fx %>%
  filter(REF_DATE == "2025-12") %>%
  select(`Type of currency`, VALUE) %>%
  arrange(desc(VALUE))

# Variations sur un an par devise
variation_par_devise <- fx %>%
  filter(REF_DATE %in% c("2025-12", "2024-12")) %>%
  select(`Type of currency`, REF_DATE, VALUE) %>%
  tidyr::pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(variation_annuelle = (`2025-12` - `2024-12`) / `2024-12` * 100)
```

</details>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 33-10-0163](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=3310016301)
**Enquête :** Banque du Canada
**Période de référence :** Décembre 2025

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "taux-change-decembre-2025", "fr"));
```
