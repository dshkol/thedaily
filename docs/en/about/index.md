---
title: About The D-AI-LY
toc: false
---

# About The D-AI-LY

The D-AI-LY generates statistical bulletins from Statistics Canada's CANSIM database using a Skills-based LLM harness. It was built with Claude Code but should work with any agentic CLI tool that can invoke SKILL.MD files. It is not affiliated with Statistics Canada in any way.

## Process

1. Fetch metadata from CANSIM/NDM tables via the [cansim R package](https://mountainmath.github.io/cansim/) to autonomously identify new and interesting data and retreive structured data objects. 
2. Generate bilingual articles (EN/FR) using an LLM model following specific guidance on narrative, voice, tone, and visual style. 
3. Publish and build a static site using the Observable.js framework.

Each article cites its source table, documents R code for reproducibility, and links to official Statistics Canada data.

## Limitations

LLM-generated content goes through automated reviews but may very well still contain errors. Do not use for any official purposes and verify statistics by consulting the [official Statistics Canada source](https://www.statcan.gc.ca/)

## More Information

- [How The D-AI-LY Works](https://www.dshkol.com/post/the-daily/) — This is a blog post that goes into much more detail on how this system works, what each skill does, and how the skills were assembled. 
- [GitHub Repository](https://github.com/dshkol/thedaily) — I've published this project as an open-source repo. All content including custom SKILL.MD files is available in the repo here. 

---

<p style="text-align: center; color: #666; font-size: 0.875rem;">
<a href="../">← Back to Latest Releases</a>
</p>
