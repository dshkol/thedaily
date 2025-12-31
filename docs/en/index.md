---
title: Latest Releases
toc: false
---

# The Daily — Latest Releases

<p class="feed-links">
<a href="./explore/">Explore by topic</a> · <a href="./archive/">Archive</a> · <a href="./about/">About</a>
</p>

```js
const articles = await FileAttachment("../articles.json").json();
const enArticles = articles.en;

function formatDate(dateStr) {
  const d = new Date(dateStr);
  return d.toLocaleDateString("en-US", { month: "long", day: "numeric", year: "numeric" });
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

const monthGroups = groupByMonth(enArticles);
```

```js
for (const [monthKey, monthArticles] of monthGroups) {
  // Parse year and month from YYYY-MM format
  const [year, month] = monthKey.split("-");
  const monthNames = ["January", "February", "March", "April", "May", "June",
                      "July", "August", "September", "October", "November", "December"];
  const monthLabel = `${monthNames[parseInt(month) - 1]} ${year}`;

  display(html`<hr><h2>${monthLabel}</h2>`);

  for (const article of monthArticles) {
    display(html`
      <div class="article-entry">
        <strong><a href="${article.path}">${article.title}</a></strong>
        <br><span class="article-meta">Released: ${formatDate(article.date)} · Table ${article.tableNumber || "—"}</span>
        ${article.summary ? html`<p class="article-summary">${article.summary}</p>` : ""}
      </div>
    `);
  }
}
```
