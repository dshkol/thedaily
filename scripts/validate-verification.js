/**
 * Pre-build validation for verification JSON
 *
 * Ensures every article declares a verification_json in frontmatter
 * and that the referenced JSON file exists.
 *
 * Run: node scripts/validate-verification.js
 * Exit codes: 0 = success, 1 = validation failed
 */

import { readdir, readFile, access } from 'fs/promises';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const projectRoot = join(__dirname, '..');
const docsDir = join(projectRoot, 'docs');

// Pages that don't require verification JSON
const EXCLUDED_SLUGS = ['index', 'explore', 'about'];

/**
 * Parse YAML frontmatter from markdown content
 */
function parseFrontmatter(content) {
  const lines = content.split('\n');
  const fmStart = lines.findIndex(l => l.trim() === '---');
  if (fmStart === -1) return {};

  const fmEnd = lines.slice(fmStart + 1).findIndex(l => l.trim() === '---');
  if (fmEnd === -1) return {};

  const fmLines = lines.slice(fmStart + 1, fmStart + 1 + fmEnd);
  const result = {};

  for (const line of fmLines) {
    const colonIdx = line.indexOf(':');
    if (colonIdx > 0) {
      const key = line.slice(0, colonIdx).trim();
      let value = line.slice(colonIdx + 1).trim();
      // Remove quotes
      value = value.replace(/^["']|["']$/g, '');
      result[key] = value;
    }
  }

  return result;
}

/**
 * Check if file exists
 */
async function fileExists(path) {
  try {
    await access(path);
    return true;
  } catch {
    return false;
  }
}

/**
 * Find all article directories
 */
async function findArticles(lang) {
  const langDir = join(docsDir, lang);
  const entries = await readdir(langDir, { withFileTypes: true });

  const articles = [];
  for (const entry of entries) {
    if (!entry.isDirectory()) continue;
    if (EXCLUDED_SLUGS.includes(entry.name)) continue;

    const indexPath = join(langDir, entry.name, 'index.md');
    if (await fileExists(indexPath)) {
      articles.push({
        slug: entry.name,
        lang,
        path: indexPath
      });
    }
  }

  return articles;
}

async function main() {
  console.log('Validating verification JSON for all articles...\n');

  const errors = [];
  const warnings = [];
  let validCount = 0;

  // Check English articles (canonical source)
  const enArticles = await findArticles('en');

  for (const article of enArticles) {
    const content = await readFile(article.path, 'utf-8');
    const frontmatter = parseFrontmatter(content);

    if (!frontmatter.verification_json) {
      errors.push(`${article.lang}/${article.slug}: Missing verification_json in frontmatter`);
      continue;
    }

    const jsonPath = join(projectRoot, frontmatter.verification_json);
    if (!await fileExists(jsonPath)) {
      errors.push(`${article.lang}/${article.slug}: JSON file not found: ${frontmatter.verification_json}`);
      continue;
    }

    validCount++;
  }

  // French articles don't need separate verification (they use same data)
  // but we could optionally check they exist

  console.log(`Checked ${enArticles.length} articles`);
  console.log(`Valid: ${validCount}`);

  if (errors.length > 0) {
    console.log(`\nErrors (${errors.length}):`);
    for (const err of errors) {
      console.log(`  ✗ ${err}`);
    }
  }

  if (warnings.length > 0) {
    console.log(`\nWarnings (${warnings.length}):`);
    for (const warn of warnings) {
      console.log(`  ? ${warn}`);
    }
  }

  if (errors.length > 0) {
    console.log('\n❌ Build validation FAILED');
    console.log('Add verification_json to article frontmatter:');
    console.log('---');
    console.log('title: Your Article Title');
    console.log('verification_json: output/your_data.json');
    console.log('---');
    process.exit(1);
  }

  console.log('\n✓ All articles have valid verification JSON');
  process.exit(0);
}

main().catch(err => {
  console.error('Validation script error:', err);
  process.exit(1);
});
