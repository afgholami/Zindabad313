# JOURNAL.md — Journal de bord du projet

> Chaque session importante laisse une trace ici. Format : date inversée
> (plus récent en haut), titre court, décisions prises, ce qu'il faut faire ensuite.
>
> Claude met à jour ce fichier à la fin de chaque session avec un résumé concis.

---

## 2026-05-14 — Squelette Express + workflow Stitch

### Contexte
- Sur Infomaniak, méthode d'installation choisie : **Git** (déploiement
  automatique depuis le repo GitHub)
- L'utilisateur veut que je sois son "dev senior full-stack de bout en bout"
- Demande d'installer le skill Stitch depuis GitHub

### Recherches faites
- Skill officiel Google Labs : https://github.com/google-labs-code/stitch-skills
- Compatibilité Claude Code, Cursor, Gemini CLI, Antigravity
- Skills inclus : `design-md`, `react:components`, `remotion`, `shadcn-ui`, etc.
- Nécessite un MCP server Stitch + Claude Code en local

### Limitation identifiée
- Le sandbox **Claude Code on the web** n'a pas d'accès réseau externe
  (impossible de cloner GitHub, d'appeler le MCP Stitch, etc.)
- Solution : préparer un script d'install pour quand l'utilisateur sera
  en local, et en attendant utiliser Stitch via son site web
  (https://stitch.withgoogle.com) en copier-coller

### Ce qui a été fait
- `package.json` : Node 22 + Express 4
- `server.js` : serveur Express minimal qui sert `public/`, avec route `/healthz` et 404
- `public/index.html` + `public/404.html` : page d'accueil et 404 stylées
  (placeholder en attendant le design Stitch)
- `scripts/install-stitch-skill.sh` : clone `google-labs-code/stitch-skills`
  dans `~/.claude/skills/` (à lancer en local)
- `docs/STITCH.md` : workflow complet Stitch → site (mode web + mode skill)

### Brief envoyé à l'utilisateur (infos à fournir)
- URL Git que demande Infomaniak (+ clé SSH publique éventuelle)
- Chemin du dossier de déploiement sur Infomaniak
- Port que Node doit écouter (souvent `process.env.PORT`)
- Confirmation accès gholami.ch
- Plus tard : contenu du site, charte couleurs, logo, langues, etc.

### Prochaines étapes
- [ ] L'utilisateur fournit l'URL Git + clé SSH éventuelle sur Infomaniak
- [ ] Tester le déploiement avec la page de test actuelle
- [ ] Vérifier que `ehsan.laus-angeles.ch` répond correctement
- [ ] Une fois OK : générer le premier vrai design via Stitch et l'intégrer

---

## 2026-05-14 — Choix stack & sous-domaine de test

### Contexte
- Récupération d'accès `gholami.ch` toujours en cours
- L'utilisateur a créé un sous-domaine `ehsan.laus-angeles.ch` sur Infomaniak
- Objectif : utiliser ce sous-domaine comme **bac à sable** pour s'entraîner
  avant de pousser sur `gholami.ch`

### Décisions
- **Stack** : Node.js 22 LTS + Express (sert du HTML/CSS statique)
- **Outil UI** : **Google Stitch** (https://stitch.withgoogle.com/) — l'utilisateur
  veut s'en servir pour générer le design
- **Installation Infomaniak** : "Installation avancée" (pas le template rapide)
  → environnement vierge, on déploie notre propre code depuis le repo Git
- **Point d'entrée** : `server.js`
- **Gestionnaire de paquets** : npm

### Workflow type prévu
```
Stitch génère le HTML/CSS  →  on l'intègre dans /public/  →
Express le sert  →  git push  →  Infomaniak déploie  →
test sur ehsan.laus-angeles.ch  →  une fois validé : migration vers gholami.ch
```

### Prochaines étapes
- [ ] Finir la config Node.js sur Infomaniak (version 22, entry point `server.js`)
- [ ] Récupérer les infos de déploiement Infomaniak (Git push ou SFTP ?)
- [ ] Créer le squelette Express minimal (`server.js`, `package.json`, `public/`)
- [ ] Premier déploiement de test (juste "Hello world" en HTML)
- [ ] Générer un premier écran avec Stitch et l'intégrer

---

## 2026-05-14 — Initialisation du projet

### Contexte
- L'utilisateur (afgholami) possède le domaine `gholami.ch`
- Il a des identifiants d'accès mais ne sait pas chez quel hébergeur
- Le contact qui a créé le site n'est plus joignable

### Découvertes
- **Hébergeur identifié** : Infomaniak (Suisse)
  - IPv4 `217.26.61.109` → plage Infomaniak
  - IPv6 `2a00:d70:0:b:2002:0:d91a:3d6d` → plage Infomaniak
- Manager client : https://manager.infomaniak.com/

### Décisions
- **Workflow Git** : branches `claude/<sujet>` + commits Conventional Commits FR
- **Mémoire Claude** : `CLAUDE.md` à la racine + `docs/JOURNAL.md` pour l'historique
- **Script ship.sh** : raccourci pour `add + commit + push`
- **Langue** : tout en français (utilisateur francophone)

### Structure créée
```
CLAUDE.md              ← Mémoire principale
docs/WORKFLOW.md       ← Workflow Git
docs/PROJECT.md        ← Infos techniques (hébergement, domaine)
docs/JOURNAL.md        ← Ce fichier
scripts/ship.sh        ← Helper add/commit/push
.claude/settings.json  ← Permissions Claude
```

### Prochaines étapes
- [ ] Récupérer les accès Infomaniak (en cours par l'utilisateur)
- [ ] Une fois connecté : documenter le type de site existant (CMS, code, etc.)
- [ ] Décider de la stratégie : refaire à neuf ou reprendre l'existant ?
- [ ] Cloner le site actuel dans le repo pour avoir une sauvegarde Git

---

<!--
TEMPLATE pour les futures entrées (à copier-coller) :

## YYYY-MM-DD — Titre court de la session

### Contexte
- ...

### Ce qui a été fait
- ...

### Décisions
- ...

### Prochaines étapes
- [ ] ...

-->
