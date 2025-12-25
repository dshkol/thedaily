#!/usr/bin/env node
/**
 * Post-build script to convert relative asset paths to absolute paths.
 * Fixes Safari compatibility issues with proxied subdirectory deployments.
 *
 * Converts: href="./_import/..." and src="./_import/..."
 * To:       href="/thedaily/_import/..." and src="/thedaily/_import/..."
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const DIST_DIR = path.join(__dirname, '..', 'dist');
const BASE_PATH = '/thedaily';

/**
 * Get the regex patterns for path replacement.
 * @param {string} basePath - The base path to use in replacements
 * @returns {Array<{regex: RegExp, replacement: string}>}
 */
export function getPatterns(basePath) {
  return [
    // Match ./_something
    { regex: /href="\.\/(_[^"]+)"/g, replacement: `href="${basePath}/$1"` },
    { regex: /src="\.\/(_[^"]+)"/g, replacement: `src="${basePath}/$1"` },
    // Match ../_something or ../../_something etc.
    { regex: /href="(?:\.\.\/)+(_[^"]+)"/g, replacement: `href="${basePath}/$1"` },
    { regex: /src="(?:\.\.\/)+(_[^"]+)"/g, replacement: `src="${basePath}/$1"` },
    // Match JS imports: from "./_something" or from "../../_something"
    { regex: /from "\.\/(_[^"]+)"/g, replacement: `from "${basePath}/$1"` },
    { regex: /from "(?:\.\.\/)+(_[^"]+)"/g, replacement: `from "${basePath}/$1"` },
    // Match dynamic imports: import("./_something") or import("../../_something")
    { regex: /import\("\.\/(_[^"]+)"\)/g, replacement: `import("${basePath}/$1")` },
    { regex: /import\("(?:\.\.\/)+(_[^"]+)"\)/g, replacement: `import("${basePath}/$1")` },
  ];
}

/**
 * Transform content by replacing relative paths with absolute paths.
 * @param {string} content - The HTML/JS content to transform
 * @param {string} basePath - The base path to use (default: /thedaily)
 * @returns {{content: string, modified: boolean}}
 */
export function transformContent(content, basePath = BASE_PATH) {
  const patterns = getPatterns(basePath);
  let modified = false;
  let result = content;

  for (const { regex, replacement } of patterns) {
    const newContent = result.replace(regex, replacement);
    if (newContent !== result) {
      result = newContent;
      modified = true;
    }
  }

  return { content: result, modified };
}

function processHtmlFile(filePath) {
  const content = fs.readFileSync(filePath, 'utf8');
  const { content: newContent, modified } = transformContent(content);

  if (modified) {
    fs.writeFileSync(filePath, newContent);
    console.log(`Fixed paths in: ${path.relative(DIST_DIR, filePath)}`);
  }
}

function processDirectory(dir) {
  const entries = fs.readdirSync(dir, { withFileTypes: true });

  for (const entry of entries) {
    const fullPath = path.join(dir, entry.name);

    if (entry.isDirectory()) {
      processDirectory(fullPath);
    } else if (entry.name.endsWith('.html')) {
      processHtmlFile(fullPath);
    }
  }
}

// Only run when executed directly (not when imported for testing)
if (import.meta.url === `file://${process.argv[1]}`) {
  console.log('Fixing asset paths for Safari compatibility...');
  processDirectory(DIST_DIR);
  console.log('Done!');
}
