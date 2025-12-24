---
name: the-daily-publish
description: Build and publish The D-AI-LY microsite. Use when asked to publish, build the site, update the homepage, deploy articles, or rebuild the archive.
---

# The D-AI-LY Publisher

Build and publish the static microsite with latest articles.

## Quick Commands

**Build site (no publish):**
```bash
python3 build_site.py
```

**Build and publish:**
```bash
python3 build_site.py
git add output/ site/
git commit -m "Add: <headline>"
git push
```

## Site Structure

```
site/
├── index.html        # Homepage (latest 5 articles)
├── archive.html      # Full archive by month
├── articles.json     # Metadata for all articles
├── articles/         # Article HTML files
│   ├── cpi-november-2025.html
│   └── retail-october-2025.html
└── css/
    └── style.css     # StatCan-inspired styling
```

## Build Process

The `build_site.py` script:

1. **Scans** `output/articles/` for HTML files
2. **Extracts** metadata from each article:
   - Title (from `<h1>` tag)
   - Date (from filename or release date div)
   - Table number (from source section)
3. **Generates** `site/index.html` with latest 5 articles
4. **Generates** `site/archive.html` with all articles grouped by month
5. **Copies** articles to `site/articles/`
6. **Saves** `site/articles.json` with full metadata

## Publishing Workflow

### Standard Publish

```bash
# 1. Ensure articles are generated in output/articles/
ls output/articles/

# 2. Build the site
python3 build_site.py

# 3. Preview locally
open site/index.html

# 4. Commit and push
git add output/ site/
git commit -m "Add: <headline from latest article>"
git push
```

### Commit Message Format

```
Add: Consumer prices up 2.2% year over year in November 2025

- Source: CANSIM Table 18-10-0004
- Reference period: November 2025
```

For multiple articles in one commit:
```
Add: 2 articles (CPI November, Retail October)

- Consumer prices up 2.2% year over year in November 2025
- Retail sales down 0.2% in October 2025
```

## Hosting Options

The site is static HTML and can be deployed to:

1. **GitHub Pages** - Push to `gh-pages` branch or `/docs` folder
2. **Netlify** - Connect repo for auto-deploy
3. **Vercel** - Connect repo for auto-deploy
4. **Any static host** - Upload `site/` directory

## Rollback

To remove a published article:

```bash
# 1. Delete the article file
rm output/articles/<slug>.html

# 2. Rebuild site
python3 build_site.py

# 3. Commit the removal
git add output/ site/
git commit -m "Remove: <article title>"
git push
```

## Verification Checklist

Before publishing, verify:
- [ ] `site/index.html` shows correct latest articles
- [ ] `site/archive.html` includes all articles
- [ ] Article links work (click through from index)
- [ ] CSS styles are loading properly
- [ ] AI disclosure is visible in footer

## Troubleshooting

**Index shows wrong articles:**
- Check file dates in `output/articles/`
- Articles are sorted by date descending
- Verify date extraction from filenames

**Missing article in archive:**
- Ensure article has a valid `<h1>` title
- Check for HTML parsing errors

**Broken styles:**
- Verify `site/css/style.css` exists
- Check relative paths in HTML
