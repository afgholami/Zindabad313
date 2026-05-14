# STITCH.md — Workflow Google Stitch → Site déployé

> Comment utiliser **Google Stitch** pour générer des UI, et intégrer le
> résultat dans le projet jusqu'au déploiement sur `ehsan.laus-angeles.ch`
> (puis `gholami.ch`).

---

## 1. Qu'est-ce que Stitch

**Google Stitch** (https://stitch.withgoogle.com) est un outil IA de Google Labs
qui transforme un prompt texte en interface utilisateur :
- Génère du **HTML + Tailwind CSS**
- Permet d'itérer ("rends le plus dark", "ajoute une nav", "change la police")
- Exporte le code propre, prêt à intégrer

C'est notre **source de design** pour le projet.

## 2. Deux modes d'utilisation

### Mode A — Via le site web Stitch (le plus simple, à toi de jouer)

1. Va sur https://stitch.withgoogle.com
2. Connecte-toi avec ton compte Google
3. Décris ce que tu veux en français (ex: *« une landing page sombre,
   moderne, qui présente Ehsan Gholami, avec une grande photo, un titre,
   et 3 sections : à propos, projets, contact »*)
4. Itère jusqu'à être content
5. Clique sur **Export** → copie le HTML
6. Colle-le dans Claude : *« Voici le HTML de Stitch, intègre-le »*
7. Je le mets dans `public/index.html`, je push, c'est en ligne

**Avantages :** zéro setup, marche tout de suite.
**Inconvénients :** copier-coller manuel.

### Mode B — Via le skill Claude Code (plus avancé)

Quand tu utilises Claude Code en local (terminal/desktop), tu peux installer
les **skills officiels Google Labs Stitch** :

```bash
./scripts/install-stitch-skill.sh
```

Ce script clone https://github.com/google-labs-code/stitch-skills dans
`~/.claude/skills/stitch-skills`. Une fois fait, Claude peut générer des
designs Stitch directement sans copier-coller, via le MCP server Stitch.

**Skills inclus** (d'après le repo officiel) :
- `design-md` : transforme un prompt vague en prompt Stitch optimisé
- `react:components` : convertit un écran Stitch en composants React
- `remotion` : génère des vidéos walkthrough depuis les écrans Stitch
- `shadcn-ui` : intégration shadcn/ui

**Prérequis :**
- Claude Code installé en local (CLI ou desktop)
- Compte Google connecté à Stitch
- MCP server Stitch configuré (instructions dans le repo)

> ⚠️ **Important** : le sandbox Claude Code on the web (où on est maintenant)
> n'a pas d'accès réseau pour cloner des dépôts externes ni pour appeler des
> MCP servers Stitch. Donc **mode B = uniquement quand tu seras en local**.

## 3. Intégration dans le projet

Quel que soit le mode :

```
Stitch (génère du HTML/CSS Tailwind)
        ↓
public/index.html        (page d'accueil)
public/<page>.html       (autres pages)
        ↓
server.js  (Express sert le dossier public/)
        ↓
git push → Infomaniak → ehsan.laus-angeles.ch
```

### Si le HTML utilise Tailwind

Stitch génère du HTML avec des classes Tailwind. Deux options :

1. **CDN Tailwind** (rapide, pas optimal) : ajouter
   `<script src="https://cdn.tailwindcss.com"></script>` dans le `<head>`
2. **Build Tailwind** (propre, à terme) : on installera `tailwindcss` comme
   dépendance et on compilera le CSS

Pour l'apprentissage, on commence avec le CDN. Quand le site sera prêt
pour la prod (`gholami.ch`), on passera au build local pour la perf.

## 4. Bonnes pratiques pour les prompts Stitch

| Bon prompt | Pourquoi |
|---|---|
| « Landing page sombre, moderne, **pour Ehsan Gholami développeur basé à Genève**, avec sections About / Projects / Contact, style minimaliste, accents bleu nuit » | Donne le **contexte**, le **but**, et la **direction visuelle** |
| « Reprends le design d'Apple.com mais pour un site perso » | Référence visuelle claire |
| « Ajoute une nav sticky en haut avec logo à gauche, 4 liens à droite » | Instructions **précises** sur les modifs |

| Mauvais prompt | Pourquoi |
|---|---|
| « Fais-moi un site cool » | Trop vague |
| « Comme avant mais mieux » | Pas de direction |

## 5. Itération avec Claude

Workflow type :

1. Tu génères un écran sur Stitch
2. Tu copies le HTML
3. Tu dis à Claude : *« Intègre ça comme page d'accueil et déploie »*
4. Claude :
   - Met le HTML dans `public/index.html`
   - Ajuste si besoin (responsive, accessibilité, perf)
   - Commit + push
   - Le site se met à jour automatiquement

---

*Stitch fait le design, Claude fait l'intégration, Infomaniak fait l'hébergement, toi tu pilotes.*
