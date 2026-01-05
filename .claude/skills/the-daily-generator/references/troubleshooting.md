# Troubleshooting

Common issues and solutions when generating articles.

## R Script Issues

### Data fetch fails

```
Error in get_cansim(): Connection timed out
```

**Solutions:**
1. Check internet connection
2. Verify table number format (XX-XX-XXXX)
3. Table may be deprecated; search for replacement
4. Try with refresh flag: `Rscript r-tools/fetch_cansim_enhanced.R 18-10-0004 output --refresh`

### Column not found

```
Error: object 'Products and product groups' not found
```

**Cause:** Column names vary between tables.

**Solution:** Check actual column names:
```r
df <- get_cansim("XX-XX-XXXX")
names(df)
```

### Missing subseries data

**Cause:** Not all tables have component breakdowns.

**Check:** Look at `breakdown_dimension` in JSON output. Some tables only have Canada-level aggregates.

## Observable Framework Issues

### Charts not rendering

1. Check browser console for JavaScript errors
2. Verify import statement at top of first code block only:
   ```js
   import * as Plot from "npm:@observablehq/plot";
   ```
3. Ensure data array has values (not empty)
4. Check for syntax errors in Plot.plot() call

### CSS not loading (Safari)

1. Run `npm run build` - post-build script fixes paths
2. Clear browser cache
3. Verify paths start with `/thedaily/` not `./`

### Language switcher broken

1. Verify slug added to `src/lang-map.js`
2. Check slug spelling matches folder name exactly
3. Rebuild with `npm run build`

### Module not found

```
Error: Cannot find module "npm:@observablehq/plot"
```

1. Run `npm install`
2. Check import path is `"npm:@observablehq/plot"` not a file path

## Article Content Issues

### Wrong date extracted

1. Check REF_DATE in JSON output
2. Verify date format is YYYY-MM
3. Some tables have different date granularity

### Numbers don't match StatCan website

1. Check if data is seasonally adjusted vs not
2. Verify comparing same reference period
3. Data may have revisions; refetch with `--refresh`

### French decimals showing period

Use `.replace(".", ",")` on formatted numbers.

## Build/Deploy Issues

### Build fails

1. Run `npm run clean` then `npm run build`
2. Check for syntax errors in markdown files
3. Verify all Observable code blocks are valid JS

### Changes not appearing

1. Wait 1-2 minutes for Netlify deploy
2. Check GitHub Actions for deploy status
3. Hard refresh browser (Cmd+Shift+R)

## Data Validation Failures

### Chart data doesn't match JSON

Always embed data directly from JSON:

```js
// CORRECT: Values from JSON time_series[]
const data = [
  {date: new Date("2024-11"), value: 2312337},
  // ...
];
```

Never approximate or round values differently than source.

### Percentages don't add up

Check if:
- Using weighted vs unweighted averages
- Comparing different adjustment types (SA vs NSA)
- Rounding errors accumulated
