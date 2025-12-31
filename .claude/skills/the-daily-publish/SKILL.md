---
name: the-daily-publish
description: Build and publish The D-AI-LY microsite. Use when asked to publish, build the site, deploy articles, preview locally, or push changes to production.
---

# The D-AI-LY Publisher

Build and deploy the Observable Framework microsite.

## Quick Commands

```bash
# Preview locally
npm run dev

# Build for production
npm run build

# Commit and deploy
git add docs/ src/
git commit -m "Add: <headline>"
git push
```

## Site Structure

```
docs/
├── en/
│   ├── index.md           # English feed page
│   └── <slug>/index.md    # English articles
├── fr/
│   ├── index.md           # French feed page
│   └── <slug>/index.md    # French articles
├── about/                 # About pages
├── style.css              # Global styles
└── components/            # Shared components
src/
└── lang-map.js            # EN↔FR slug mappings
```

## Build Process

`npm run build` runs Observable Framework build plus post-build path fixes for Safari compatibility.

Output goes to `dist/` for deployment.

## Deployment

GitHub Actions auto-deploys to Netlify on push to main branch.

**Manual deploy:**
```bash
git add docs/ src/
git commit -m "Add: <headline from article>"
git push
```

## Commit Message Format

Single article:
```
Add: Consumer prices up 2.2% year over year in November 2025

- Source: CANSIM Table 18-10-0004
- Reference period: November 2025
```

Multiple articles:
```
Add: 2 articles (CPI November, Retail October)

- Consumer prices up 2.2% in November 2025
- Retail sales down 0.2% in October 2025
```

## Pre-Publish Checklist

- [ ] `npm run dev` shows articles correctly
- [ ] Language switcher works between EN/FR
- [ ] Charts render with correct colors
- [ ] All links work (source, DOI)
- [ ] Index pages updated with new entries

## Rollback

To remove a published article:

```bash
rm -rf docs/en/<slug>/ docs/fr/<slug-fr>/
# Remove from index pages and lang-map.js
git add -A
git commit -m "Remove: <article title>"
git push
```

## Troubleshooting

**Build fails:**
- Check for syntax errors in markdown
- Verify Observable code blocks are valid JS
- Run `npm run clean` then `npm run build`

**Changes not appearing:**
- Wait 1-2 min for Netlify deploy
- Check GitHub Actions status
- Hard refresh (Cmd+Shift+R)

**Safari path issues:**
- `npm run build` includes fix-paths.js post-build
- Paths should start with `/thedaily/`
