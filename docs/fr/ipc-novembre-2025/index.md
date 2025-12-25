---
title: Les prix à la consommation en hausse de 2,2 % d'une année à l'autre en novembre 2025
toc: false
---

# Les prix à la consommation en hausse de 2,2 % d'une année à l'autre en novembre 2025

<p class="release-date">Diffusion : 22 décembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- L'Indice des prix à la consommation a augmenté de 2,2 % d'une année à l'autre en novembre 2025, égalant la hausse d'octobre
- Les prix des aliments achetés en magasin ont augmenté de 4,2 %, sous l'effet du bœuf (+17,7 %) et du café (+27,8 %)
- La baisse des prix des voyages organisés et le ralentissement de la croissance des loyers ont exercé une pression à la baisse sur l'IPC
- Le Manitoba a affiché la plus forte hausse provinciale à 3,3 %; l'Île-du-Prince-Édouard la plus faible à 1,4 %

</div>

L'Indice des prix à la consommation (IPC) a augmenté de 2,2 % d'une année à l'autre en novembre 2025, égalant la hausse d'octobre. L'indice s'établissait à 165,4, en hausse par rapport à 161,8 un an plus tôt.

La baisse des prix des voyages organisés et de l'hébergement pour voyageurs, ainsi que le ralentissement de la croissance des loyers, ont exercé une pression à la baisse sur l'IPC d'ensemble. Ces baisses ont été compensées par la hausse des prix des biens, attribuable aux augmentations des prix des aliments achetés en magasin ainsi qu'à un recul moins prononcé des prix de l'essence.

En excluant l'essence, l'IPC a augmenté de 2,6 % pour un troisième mois consécutif.

## Tendance de l'inflation d'une année à l'autre

Le taux d'inflation annuel est demeuré dans la fourchette cible de 1 à 3 % de la Banque du Canada pendant la majeure partie de 2025. Après avoir atteint un creux de 1,6 % en septembre, le taux a légèrement augmenté au cours des derniers mois.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles du Tableau 18-10-0004
const inflationData = [
  {date: new Date("2025-06"), rate: 1.9},  // 164,4 vs 161,4
  {date: new Date("2025-07"), rate: 1.7},  // 164,9 vs 162,1
  {date: new Date("2025-08"), rate: 1.9},  // 164,8 vs 161,8
  {date: new Date("2025-09"), rate: 2.4},  // 164,9 vs 161,1
  {date: new Date("2025-10"), rate: 2.2},  // 165,3 vs 161,8
  {date: new Date("2025-11"), rate: 2.2}   // 165,4 vs 161,8
];

display(Plot.plot({
  title: "Taux d'inflation d'une année à l'autre (%)",
  width: 640,
  height: 280,
  y: {domain: [0, 4], grid: true, label: "Pourcentage"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.ruleY([1, 3], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.lineY(inflationData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(inflationData, {x: "date", y: "rate", fill: "#AF3C43", r: 4})
  ]
}));
```

## L'inflation des prix des aliments s'accélère

Les prix des aliments achetés en magasin ont augmenté de 4,2 % d'une année à l'autre en novembre, soit la plus forte hausse depuis la fin de 2023. Les principaux facteurs de cette accélération ont été les fruits frais (+4,4 %), sous l'effet de la hausse des prix des petits fruits, et les autres préparations alimentaires (+6,6 %).

Les prix du bœuf frais ou congelé (+17,7 %) et du café (+27,8 %) ont continué de contribuer de façon importante à l'inflation globale des aliments sur une base annuelle. La hausse des prix du bœuf s'explique en partie par la diminution des stocks de bovins en Amérique du Nord. Les prix du café ont été touchés par des conditions météorologiques défavorables dans les régions productrices et ont augmenté dans le contexte des tarifs américains sur les pays producteurs de café.

```js
const components = [
  {name: "Aliments", change: 4.2},
  {name: "Dépenses courantes, ameublement et équipement du ménage", change: 3.3},
  {name: "Santé et soins personnels", change: 3.0},
  {name: "Logement", change: 2.3},
  {name: "Boissons alcoolisées, produits du tabac et cannabis récréatif", change: 1.4},
  {name: "Vêtements et chaussures", change: 0.8},
  {name: "Transport", change: 0.7},
  {name: "Loisirs, formation et lecture", change: 0.4}
];

display(Plot.plot({
  title: "Variation annuelle selon la composante (%)",
  width: 700,
  height: 320,
  marginLeft: 380,
  x: {domain: [-1, 5], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(components, {
      y: "name",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(components, {
      y: "name",
      x: "change",
      text: d => d.change.toFixed(1) + " %",
      dx: 24,
      fill: "currentColor"
    })
  ]
}));
```

## Faits saillants régionaux

Sur une base annuelle en novembre, les prix ont augmenté à un rythme plus rapide dans cinq provinces, sont demeurés inchangés dans deux provinces et ont augmenté à un rythme plus lent dans les trois autres par rapport à octobre.

De toutes les provinces, c'est au Manitoba que les prix ont le plus accéléré, en hausse de 3,3 % d'une année à l'autre en novembre — le taux provincial le plus élevé. Les coûts du logement plus élevés, particulièrement les intérêts hypothécaires, ont été un facteur clé. À l'autre extrémité, l'Île-du-Prince-Édouard a enregistré la plus faible hausse à 1,4 %, bien en dessous de la moyenne nationale de 2,2 %.

Le Québec (+3,0 %) et le Nouveau-Brunswick (+2,7 %) ont également dépassé le taux national, tandis que l'Ontario (+1,9 %) et l'Alberta (+1,9 %) sont demeurés en deçà. L'écart de 1,9 point de pourcentage entre le Manitoba et l'Île-du-Prince-Édouard témoigne d'une variation régionale importante des pressions inflationnistes à travers le pays.

| Province | Variation annuelle | vs nationale |
|----------|-------------------|--------------|
| Manitoba | +3,3 % | +1,1 pp |
| Québec | +3,0 % | +0,8 pp |
| Nouveau-Brunswick | +2,7 % | +0,5 pp |
| Nouvelle-Écosse | +2,4 % | +0,2 pp |
| Terre-Neuve-et-Labrador | +2,2 % | 0,0 pp |
| Saskatchewan | +2,1 % | -0,1 pp |
| Colombie-Britannique | +2,0 % | -0,2 pp |
| Ontario | +1,9 % | -0,3 pp |
| Alberta | +1,9 % | -0,3 pp |
| Île-du-Prince-Édouard | +1,4 % | -0,8 pp |

<div class="note-to-readers">

## Note aux lecteurs

L'Indice des prix à la consommation mesure le taux de variation des prix payés par les consommateurs canadiens. Il est calculé en comparant le coût d'un panier fixe de biens et de services achetés par les consommateurs au fil du temps.

L'IPC n'est pas désaisonnalisé. Les variations d'un mois à l'autre peuvent refléter des tendances saisonnières en plus des tendances de prix sous-jacentes.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 18-10-0004](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810000401)
**Enquête :** Indice des prix à la consommation
**Période de référence :** Novembre 2025
**DOI :** [https://doi.org/10.25318/1810000401-fra](https://doi.org/10.25318/1810000401-fra)

</div>
