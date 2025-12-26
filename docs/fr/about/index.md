---
title: À propos du D-AI-LY
toc: false
---

# À propos du D-AI-LY

Le D-AI-LY est un projet expérimental qui génère des bulletins statistiques à l'aide de l'intelligence artificielle. Il s'inspire de la publication officielle de Statistique Canada, [Le Quotidien](https://www.statcan.gc.ca/fr/quo/quo), qui constitue la première source de diffusion de nouvelles données statistiques au Canada depuis 1932.

## Ce que nous faisons

Chaque jour, Le D-AI-LY :

1. **Analyse** la base de données CANSIM de Statistique Canada pour repérer les tableaux récemment mis à jour
2. **Sélectionne** les sujets dignes d'intérêt selon leur actualité, l'intérêt public et la diversité sectorielle
3. **Récupère** les données les plus récentes à l'aide de l'API officielle de Statistique Canada
4. **Génère** des articles bilingues (français et anglais) expliquant les principales conclusions
5. **Publie** les articles sur ce site Web

Toutes les données proviennent directement de Statistique Canada. Les articles sont générés par l'IA et vérifiés pour leur exactitude.

## Fonctionnement

```
┌─────────────────────────────────────────┐
│      Automatisation quotidienne (8 h)   │
└─────────────────┬───────────────────────┘
                  │
    ┌─────────────▼─────────────┐
    │  Découverte de sujets (IA)│  Quoi de neuf aujourd'hui?
    └─────────────┬─────────────┘
                  │
    ┌─────────────▼─────────────┐
    │  Récupération (R/cansim)  │  Obtenir les données StatCan
    └─────────────┬─────────────┘
                  │
    ┌─────────────▼─────────────┐
    │  Génération d'articles (IA)│  Rédiger en FR + EN
    └─────────────┬─────────────┘
                  │
    ┌─────────────▼─────────────┐
    │   Publication sur le site │  Compiler et déployer
    └───────────────────────────┘
```

## Sources des données

Toutes les données statistiques proviennent de la **base de données CANSIM de Statistique Canada** (maintenant appelée le Nouveau modèle de diffusion). Nous utilisons le [progiciel R cansim](https://mountainmath.github.io/cansim/) pour accéder aux tableaux officiels.

Chaque article comprend :
- Le numéro du tableau CANSIM
- Un lien direct vers les données sources
- La période de référence des statistiques

## Transparence sur l'IA

Ce projet utilise l'IA (Claude d'Anthropic) à deux fins :

1. **Sélection des sujets** : Identifier les diffusions statistiques les plus dignes d'intérêt
2. **Rédaction des articles** : Générer le texte de chaque article à partir des données

L'IA suit des directives strictes pour maintenir le ton neutre et clinique du reportage statistique. Elle n'éditorialise pas et ne fait pas de prédictions — elle rapporte simplement les chiffres.

**Important** : Bien que nous visions l'exactitude, le contenu généré par l'IA peut contenir des erreurs. Veuillez toujours vérifier les statistiques importantes en consultant la [source officielle de Statistique Canada](https://www.statcan.gc.ca/).

## Le style du Quotidien

Les articles suivent le style du Quotidien de Statistique Canada :

- **Neutre et clinique** — pas de langage émotionnel
- **Pyramide inversée** — les faits les plus importants en premier
- **Langage simple** — accessible au grand public
- Les titres mettent en avant le chiffre clé
- Toujours comparer à la période précédente ET à l'année précédente

## Code source ouvert

Le D-AI-LY est un projet à code source ouvert. Vous pouvez consulter le code, signaler des problèmes ou contribuer sur GitHub :

**[github.com/mountainmath/the-daily](https://github.com/mountainmath/the-daily)**

## Avertissement

Le D-AI-LY n'est pas affilié à Statistique Canada. Il s'agit d'un projet expérimental indépendant qui utilise des données accessibles au public. Pour les statistiques officielles, veuillez consulter [statcan.gc.ca](https://www.statcan.gc.ca/).

---

<p style="text-align: center; color: #666; font-size: 0.875rem;">
<a href="../">← Retour aux dernières diffusions</a>
</p>
