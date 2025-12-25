---
title: Archives
toc: false
---

# Archives des articles

Parcourez toutes les diffusions par date ou type d'indicateur.

```js
// Article data - all published releases
const articles = [
  {
    title: "Passagers aériens en hausse de 2,2 % en octobre 2025",
    slug: "passagers-aeriens-octobre-2025",
    date: "2025-12-23",
    table: "23-10-0079",
    indicator: "Transport",
    summary: "Les grandes compagnies aériennes canadiennes ont transporté 7,1 millions de passagers en octobre 2025."
  },
  {
    title: "Les prix à la consommation en hausse de 2,2 % en novembre 2025",
    slug: "ipc-novembre-2025",
    date: "2025-12-22",
    table: "18-10-0004",
    indicator: "Prix",
    summary: "L'Indice des prix à la consommation a augmenté de 2,2 % en novembre par rapport au même mois un an plus tôt."
  },
  {
    title: "Ventes au détail en baisse de 0,2 % en octobre 2025",
    slug: "commerce-detail-octobre-2025",
    date: "2025-12-20",
    table: "20-10-0008",
    indicator: "Commerce",
    summary: "Les ventes au détail ont diminué de 0,2 % pour s'établir à 67,0 milliards de dollars en octobre 2025."
  },
  {
    title: "Prix des logements neufs inchangés en novembre 2025",
    slug: "indice-prix-logements-neufs-novembre-2025",
    date: "2025-12-19",
    table: "18-10-0205",
    indicator: "Logement",
    summary: "L'Indice des prix des logements neufs est demeuré inchangé (0,0 %) en novembre 2025."
  },
  {
    title: "Mises en chantier à 254 058 unités en novembre 2025",
    slug: "mises-en-chantier-novembre-2025",
    date: "2025-12-19",
    table: "34-10-0158",
    indicator: "Logement",
    summary: "Les mises en chantier ont augmenté de 9,4 % pour atteindre un taux annuel désaisonnalisé de 254 058 unités."
  },
  {
    title: "PIB réel en baisse de 0,3 % en octobre 2025",
    slug: "pib-octobre-2025",
    date: "2025-12-23",
    table: "36-10-0434",
    indicator: "PIB",
    summary: "Le produit intérieur brut réel a diminué de 0,3 % en octobre 2025."
  },
  {
    title: "Exportations de marchandises en hausse de 6,3 % en octobre 2025",
    slug: "commerce-international-octobre-2025",
    date: "2025-12-18",
    table: "12-10-0011",
    indicator: "Commerce",
    summary: "Les exportations de marchandises ont augmenté de 6,3 % pour atteindre 64,2 milliards de dollars."
  },
  {
    title: "Permis de bâtir en baisse de 3,4 % en octobre 2025",
    slug: "permis-batir-octobre-2025",
    date: "2025-12-17",
    table: "34-10-0066",
    indicator: "Logement",
    summary: "La valeur totale des permis de bâtir a diminué de 3,4 % pour s'établir à 11,8 milliards de dollars."
  },
  {
    title: "Prix de l'essence en hausse de 1,7 % en novembre 2025",
    slug: "prix-essence-novembre-2025",
    date: "2025-12-15",
    table: "18-10-0001",
    indicator: "Prix",
    summary: "Le prix moyen de l'essence a augmenté de 1,7 % pour atteindre 139,6 cents le litre en novembre 2025."
  },
  {
    title: "Ventes en gros en hausse de 0,1 % en octobre 2025",
    slug: "commerce-gros-octobre-2025",
    date: "2025-12-12",
    table: "20-10-0003",
    indicator: "Commerce",
    summary: "Les ventes en gros ont augmenté de 0,1 % pour s'établir à 86,0 milliards de dollars en octobre 2025."
  },
  {
    title: "Emploi en hausse de 54 000 en novembre 2025",
    slug: "epa-novembre-2025",
    date: "2025-12-05",
    table: "14-10-0287",
    indicator: "Travail",
    summary: "L'emploi a augmenté de 54 000 en novembre 2025 et le taux de chômage a reculé à 6,5 %."
  }
];

// Get unique months and indicators for filters
const months = [...new Set(articles.map(a => a.date.slice(0, 7)))].sort().reverse();
const indicators = [...new Set(articles.map(a => a.indicator))].sort();
```

```js
// Filter controls
const monthFilter = view(Inputs.select(
  ["Tous les mois", ...months],
  {label: "Mois", value: "Tous les mois"}
));

const indicatorFilter = view(Inputs.select(
  ["Tous les indicateurs", ...indicators],
  {label: "Indicateur", value: "Tous les indicateurs"}
));
```

```js
// Apply filters
const filteredArticles = articles.filter(a => {
  const matchMonth = monthFilter === "Tous les mois" || a.date.startsWith(monthFilter);
  const matchIndicator = indicatorFilter === "Tous les indicateurs" || a.indicator === indicatorFilter;
  return matchMonth && matchIndicator;
});
```

<div class="article-count">

Affichage de **${filteredArticles.length}** articles sur ${articles.length}

</div>

```js
// Render filtered articles
display(html`
  <div class="archive-list">
    ${filteredArticles.map(a => html`
      <div class="archive-item">
        <a href="/fr/${a.slug}/" class="archive-title">${a.title}</a>
        <div class="archive-meta">
          <span class="archive-date">${a.date}</span>
          <span class="archive-indicator">${a.indicator}</span>
          <span class="archive-table">Tableau ${a.table}</span>
        </div>
        <p class="archive-summary">${a.summary}</p>
      </div>
    `)}
  </div>
`);
```

<style>
.article-count {
  margin: 1.5rem 0;
  padding: 0.75rem 1rem;
  background: #f5f5f5;
  border-radius: 4px;
}

.archive-list {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.archive-item {
  padding-bottom: 1.5rem;
  border-bottom: 1px solid #eee;
}

.archive-title {
  font-size: 1.1rem;
  font-weight: 600;
  color: #AF3C43;
  text-decoration: none;
}

.archive-title:hover {
  text-decoration: underline;
}

.archive-meta {
  display: flex;
  gap: 1rem;
  margin-top: 0.5rem;
  font-size: 0.875rem;
  color: #666;
}

.archive-indicator {
  background: #AF3C43;
  color: white;
  padding: 0.1rem 0.5rem;
  border-radius: 3px;
  font-size: 0.75rem;
}

.archive-table {
  font-family: monospace;
}

.archive-summary {
  margin-top: 0.5rem;
  color: #333;
  font-size: 0.95rem;
}
</style>
