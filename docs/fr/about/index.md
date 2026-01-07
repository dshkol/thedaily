---
title: À propos du D-AI-LY
toc: false
---

# À propos du D-AI-LY

Le D-AI-LY génère des bulletins statistiques à partir de la base de données CANSIM de Statistique Canada en utilisant un système LLM basé sur des Skills. Il a été construit avec Claude Code mais devrait fonctionner avec tout outil CLI agentique capable d'invoquer des fichiers SKILL.MD. Il n'est aucunement affilié à Statistique Canada.

## Processus

1. Récupérer les métadonnées des tableaux CANSIM/NDM via le [progiciel R cansim](https://mountainmath.github.io/cansim/) pour identifier de manière autonome des données nouvelles et intéressantes et récupérer des objets de données structurées.
2. Générer des articles bilingues (FR/EN) à l'aide d'un modèle LLM suivant des directives spécifiques sur le narratif, la voix, le ton et le style visuel.
3. Publier et compiler un site statique en utilisant le cadre Observable.js.

Chaque article cite son tableau source, documente le code R pour la reproductibilité et renvoie aux données officielles de Statistique Canada.

## Limitations

Le contenu généré par LLM passe par des revues automatisées mais peut très bien contenir des erreurs. Ne pas utiliser à des fins officielles et vérifier les statistiques en consultant la [source officielle de Statistique Canada](https://www.statcan.gc.ca/).

## Plus d'information

- [Comment fonctionne Le D-AI-LY](https://www.dshkol.com/post/the-daily/) — Article de blogue qui explique en détail le fonctionnement de ce système, ce que fait chaque skill et comment les skills ont été assemblés.
- [Dépôt GitHub](https://github.com/dshkol/thedaily) — Ce projet est publié en tant que dépôt open-source. Tout le contenu, y compris les fichiers SKILL.MD personnalisés, est disponible dans le dépôt.

---

<p style="text-align: center; color: #666; font-size: 0.875rem;">
<a href="../">← Retour aux dernières diffusions</a>
</p>
