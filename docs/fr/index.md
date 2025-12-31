---
title: Dernières publications
toc: false
---

# Le Quotidien — Dernières publications

<p class="feed-links">
<a href="./explore/">Explorer par sujet</a> · <a href="./archive/">Archives</a> · <a href="./about/">A propos</a>
</p>

```js
const articles = await FileAttachment("../articles.json").json();
const frArticles = articles.fr;

function formatDate(dateStr) {
  const d = new Date(dateStr);
  return d.toLocaleDateString("fr-CA", { day: "numeric", month: "long", year: "numeric" });
}

// Group by month
function groupByMonth(articles) {
  const groups = {};
  for (const a of articles) {
    const monthKey = a.date.substring(0, 7); // YYYY-MM
    if (!groups[monthKey]) groups[monthKey] = [];
    groups[monthKey].push(a);
  }
  return Object.entries(groups).sort((a, b) => b[0].localeCompare(a[0]));
}

const monthGroups = groupByMonth(frArticles);
```

```js
for (const [monthKey, monthArticles] of monthGroups) {
  // Parse year and month from YYYY-MM format
  const [year, month] = monthKey.split("-");
  const monthNames = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin",
                      "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"];
  const monthLabelCap = `${monthNames[parseInt(month) - 1]} ${year}`;

  display(html`<hr><h2>${monthLabelCap}</h2>`);

  for (const article of monthArticles) {
    display(html`
      <div class="article-entry">
        <strong><a href="${article.path}">${article.title}</a></strong>
        <br><span class="article-meta">Diffusé : ${formatDate(article.date)} · Tableau ${article.tableNumber || "—"}</span>
        ${article.summary ? html`<p class="article-summary">${article.summary}</p>` : ""}
      </div>
    `);
  }
}
```
