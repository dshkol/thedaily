/**
 * Tests for fix-paths.js
 * Run with: node --test scripts/fix-paths.test.js
 */

import { describe, it } from 'node:test';
import assert from 'node:assert';
import { transformContent, getPatterns } from './fix-paths.js';

describe('fix-paths', () => {
  describe('transformContent', () => {
    it('should convert ./_import paths in href attributes', () => {
      const input = '<link href="./_import/style.f3b25c2f.css">';
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, '<link href="/thedaily/_import/style.f3b25c2f.css">');
      assert.strictEqual(modified, true);
    });

    it('should convert ./_import paths in src attributes', () => {
      const input = '<script src="./_observablehq/client.js"></script>';
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, '<script src="/thedaily/_observablehq/client.js"></script>');
      assert.strictEqual(modified, true);
    });

    it('should convert ../../_import paths (nested directories)', () => {
      const input = '<link href="../../_import/style.f3b25c2f.css">';
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, '<link href="/thedaily/_import/style.f3b25c2f.css">');
      assert.strictEqual(modified, true);
    });

    it('should convert ../../../_import paths (deeply nested)', () => {
      const input = '<link href="../../../_observablehq/runtime.js">';
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, '<link href="/thedaily/_observablehq/runtime.js">');
      assert.strictEqual(modified, true);
    });

    it('should convert JS import from statements with ./ paths', () => {
      const input = 'import {define} from "./_observablehq/client.js";';
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, 'import {define} from "/thedaily/_observablehq/client.js";');
      assert.strictEqual(modified, true);
    });

    it('should convert JS import from statements with ../ paths', () => {
      const input = 'import {define} from "../../_observablehq/client.js";';
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, 'import {define} from "/thedaily/_observablehq/client.js";');
      assert.strictEqual(modified, true);
    });

    it('should convert dynamic import() calls with ./ paths', () => {
      const input = 'import("./_npm/d3@7.9.0/d3.js")';
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, 'import("/thedaily/_npm/d3@7.9.0/d3.js")');
      assert.strictEqual(modified, true);
    });

    it('should convert dynamic import() calls with ../ paths', () => {
      const input = 'import("../../_npm/d3@7.9.0/d3.js")';
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, 'import("/thedaily/_npm/d3@7.9.0/d3.js")');
      assert.strictEqual(modified, true);
    });

    it('should NOT modify paths that do not start with underscore', () => {
      const input = '<a href="./en/cpi-november-2025/">CPI Article</a>';
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, input);
      assert.strictEqual(modified, false);
    });

    it('should NOT modify absolute paths', () => {
      const input = '<link href="/thedaily/_import/style.css">';
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, input);
      assert.strictEqual(modified, false);
    });

    it('should NOT modify external URLs', () => {
      const input = '<link href="https://fonts.googleapis.com/css">';
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, input);
      assert.strictEqual(modified, false);
    });

    it('should handle multiple replacements in one file', () => {
      const input = `
<link href="./_import/style.css">
<script src="./_observablehq/client.js"></script>
import {define} from "./_observablehq/runtime.js";
`;
      const expected = `
<link href="/thedaily/_import/style.css">
<script src="/thedaily/_observablehq/client.js"></script>
import {define} from "/thedaily/_observablehq/runtime.js";
`;
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, expected);
      assert.strictEqual(modified, true);
    });

    it('should return modified=false when no changes are made', () => {
      const input = '<p>Hello world</p>';
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, input);
      assert.strictEqual(modified, false);
    });

    it('should use custom base path when provided', () => {
      const input = '<link href="./_import/style.css">';
      const { content, modified } = transformContent(input, '/custom-base');

      assert.strictEqual(content, '<link href="/custom-base/_import/style.css">');
      assert.strictEqual(modified, true);
    });

    it('should handle _npm paths correctly', () => {
      const input = '<link rel="modulepreload" href="../../_npm/@observablehq/plot@0.6.17/d761ef9b.js">';
      const { content, modified } = transformContent(input);

      assert.strictEqual(content, '<link rel="modulepreload" href="/thedaily/_npm/@observablehq/plot@0.6.17/d761ef9b.js">');
      assert.strictEqual(modified, true);
    });

    it('should handle real-world HTML from dist/index.html', () => {
      const input = `<!DOCTYPE html>
<html>
<head>
<link rel="preload" as="style" href="./_import/style.f3b25c2f.css">
<link rel="modulepreload" href="./_observablehq/client.4d77b266.js">
<script type="module">
import "./_observablehq/client.4d77b266.js";
</script>
</head>
</html>`;

      const { content, modified } = transformContent(input);

      assert.ok(content.includes('href="/thedaily/_import/style.f3b25c2f.css"'));
      assert.ok(content.includes('href="/thedaily/_observablehq/client.4d77b266.js"'));
      assert.ok(!content.includes('href="./_'));
      assert.strictEqual(modified, true);
    });

    it('should handle real-world HTML from nested article page', () => {
      const input = `<!DOCTYPE html>
<html>
<head>
<link rel="preload" as="style" href="../../_import/style.f3b25c2f.css">
<link rel="modulepreload" href="../../_observablehq/client.4d77b266.js">
</head>
<body>
<script type="module">
import {define} from "../../_observablehq/client.4d77b266.js";
</script>
</body>
</html>`;

      const { content, modified } = transformContent(input);

      assert.ok(content.includes('href="/thedaily/_import/style.f3b25c2f.css"'));
      assert.ok(content.includes('from "/thedaily/_observablehq/client.4d77b266.js"'));
      assert.ok(!content.includes('href="../../_'));
      assert.ok(!content.includes('from "../../_'));
      assert.strictEqual(modified, true);
    });
  });

  describe('getPatterns', () => {
    it('should return 8 patterns', () => {
      const patterns = getPatterns('/thedaily');
      assert.strictEqual(patterns.length, 8);
    });

    it('should include href patterns for ./ and ../ paths', () => {
      const patterns = getPatterns('/thedaily');
      const hrefPatterns = patterns.filter(p => p.replacement.includes('href='));
      assert.strictEqual(hrefPatterns.length, 2);
    });

    it('should include src patterns for ./ and ../ paths', () => {
      const patterns = getPatterns('/thedaily');
      const srcPatterns = patterns.filter(p => p.replacement.includes('src='));
      assert.strictEqual(srcPatterns.length, 2);
    });

    it('should include from patterns for ./ and ../ paths', () => {
      const patterns = getPatterns('/thedaily');
      const fromPatterns = patterns.filter(p => p.replacement.includes('from "'));
      assert.strictEqual(fromPatterns.length, 2);
    });

    it('should include dynamic import patterns for ./ and ../ paths', () => {
      const patterns = getPatterns('/thedaily');
      const importPatterns = patterns.filter(p => p.replacement.includes('import("'));
      assert.strictEqual(importPatterns.length, 2);
    });
  });
});
