---
title: Archive
toc: false
---

# Article Archive

Browse all releases by date or indicator type.

```js
// Article data - all published releases
const articles = [
  {
    title: "Airline passengers up 2.2% in October 2025",
    slug: "airline-passengers-october-2025",
    date: "2025-12-23",
    table: "23-10-0079",
    indicator: "Transport",
    summary: "Major Canadian airlines carried 7.1 million passengers in October 2025, up 2.2% year over year."
  },
  {
    title: "Consumer prices up 2.2% year over year in November 2025",
    slug: "cpi-november-2025",
    date: "2025-12-22",
    table: "18-10-0004",
    indicator: "Prices",
    summary: "The Consumer Price Index rose 2.2% in November compared with the same month a year earlier."
  },
  {
    title: "Retail sales down 0.2% in October 2025",
    slug: "retail-trade-october-2025",
    date: "2025-12-20",
    table: "20-10-0008",
    indicator: "Trade",
    summary: "Retail sales decreased 0.2% to $67.0 billion in October 2025."
  },
  {
    title: "New housing prices unchanged in November 2025",
    slug: "new-housing-price-index-november-2025",
    date: "2025-12-19",
    table: "18-10-0205",
    indicator: "Housing",
    summary: "The New Housing Price Index was unchanged (0.0%) in November 2025."
  },
  {
    title: "Housing starts at 254,058 units in November 2025",
    slug: "housing-starts-november-2025",
    date: "2025-12-19",
    table: "34-10-0158",
    indicator: "Housing",
    summary: "Housing starts rose 9.4% to a seasonally adjusted annual rate of 254,058 units."
  },
  {
    title: "Real GDP down 0.3% in October 2025",
    slug: "gdp-october-2025",
    date: "2025-12-23",
    table: "36-10-0434",
    indicator: "GDP",
    summary: "Real gross domestic product decreased 0.3% in October 2025."
  },
  {
    title: "Merchandise exports up 6.3% in October 2025",
    slug: "trade-october-2025",
    date: "2025-12-18",
    table: "12-10-0011",
    indicator: "Trade",
    summary: "Merchandise exports increased 6.3% to $64.2 billion in October 2025."
  },
  {
    title: "Building permits down 3.4% in October 2025",
    slug: "building-permits-october-2025",
    date: "2025-12-17",
    table: "34-10-0066",
    indicator: "Housing",
    summary: "The total value of building permits decreased 3.4% to $11.8 billion."
  },
  {
    title: "Gasoline prices up 1.7% in November 2025",
    slug: "gasoline-prices-november-2025",
    date: "2025-12-15",
    table: "18-10-0001",
    indicator: "Prices",
    summary: "Average gasoline prices rose 1.7% to 139.6 cents per litre in November 2025."
  },
  {
    title: "Wholesale sales up 0.1% in October 2025",
    slug: "wholesale-trade-october-2025",
    date: "2025-12-12",
    table: "20-10-0003",
    indicator: "Trade",
    summary: "Wholesale sales increased 0.1% to $86.0 billion in October 2025."
  },
  {
    title: "Employment up 54,000 in November 2025",
    slug: "lfs-november-2025",
    date: "2025-12-05",
    table: "14-10-0287",
    indicator: "Labour",
    summary: "Employment rose by 54,000 in November 2025, and the unemployment rate fell to 6.5%."
  }
];

// Get unique months and indicators for filters
const months = [...new Set(articles.map(a => a.date.slice(0, 7)))].sort().reverse();
const indicators = [...new Set(articles.map(a => a.indicator))].sort();
```

```js
// Filter controls
const monthFilter = view(Inputs.select(
  ["All months", ...months],
  {label: "Month", value: "All months"}
));

const indicatorFilter = view(Inputs.select(
  ["All indicators", ...indicators],
  {label: "Indicator", value: "All indicators"}
));
```

```js
// Apply filters
const filteredArticles = articles.filter(a => {
  const matchMonth = monthFilter === "All months" || a.date.startsWith(monthFilter);
  const matchIndicator = indicatorFilter === "All indicators" || a.indicator === indicatorFilter;
  return matchMonth && matchIndicator;
});
```

<div class="article-count">

Showing **${filteredArticles.length}** of ${articles.length} articles

</div>

```js
// Render filtered articles
display(html`
  <div class="archive-list">
    ${filteredArticles.map(a => html`
      <div class="archive-item">
        <a href="/en/${a.slug}/" class="archive-title">${a.title}</a>
        <div class="archive-meta">
          <span class="archive-date">${a.date}</span>
          <span class="archive-indicator">${a.indicator}</span>
          <span class="archive-table">Table ${a.table}</span>
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
