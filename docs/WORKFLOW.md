# WORKFLOW.md — Comment on travaille sur ce projet

> Ce guide décrit le workflow Git **add → commit → push → PR** pour Zindabad313.
> Il est conçu pour être suivi à la lettre par Claude (et par toi si tu interviens à la main).

---

## 1. Cycle de travail standard

```
┌─────────────────────────────────────────────────────────────┐
│  1. PLAN     →  Discuter / décrire ce qu'on veut faire      │
│  2. BRANCH   →  Créer/changer de branche claude/<sujet>     │
│  3. CODE     →  Modifier les fichiers                       │
│  4. CHECK    →  git status + git diff                       │
│  5. STAGE    →  git add <fichiers précis>                   │
│  6. COMMIT   →  git commit -m "type: message"               │
│  7. PUSH     →  git push -u origin <branch>                 │
│  8. PR       →  Ouvrir une Pull Request (draft)             │
│  9. JOURNAL  →  Noter dans docs/JOURNAL.md                  │
└─────────────────────────────────────────────────────────────┘
```

## 2. Commandes essentielles

### Voir l'état
```bash
git status              # Quels fichiers ont changé ?
git diff                # Voir les modifs non stagées
git diff --staged       # Voir les modifs stagées
git log --oneline -10   # Historique des 10 derniers commits
git branch              # Quelle branche je suis ?
```

### Créer / changer de branche
```bash
# Nouvelle branche depuis main
git checkout main
git pull origin main
git checkout -b claude/<sujet>

# Revenir sur une branche existante
git checkout claude/<sujet>
```

### Stager + Commit + Push
```bash
# Stager des fichiers précis (préférer ça à `git add .`)
git add CLAUDE.md docs/JOURNAL.md

# Commit avec message clair
git commit -m "docs: mise à jour de la mémoire projet"

# Push avec tracking (-u, à faire la 1ère fois)
git push -u origin claude/<sujet>

# Push ensuite (la branche est déjà trackée)
git push
```

### Annuler proprement (non-destructif)
```bash
# Désindexer un fichier (sans perdre les modifs)
git restore --staged <fichier>

# Annuler les modifs locales d'un fichier (DESTRUCTIF)
git restore <fichier>

# Revenir au dernier commit en gardant les modifs
git reset --soft HEAD~1
```

## 3. Format des messages de commit

**Structure :** `<type>: <description>` (en français, à l'impératif)

| Type | Quand l'utiliser | Exemple |
|---|---|---|
| `feat` | Nouvelle fonctionnalité | `feat: ajout du formulaire de contact` |
| `fix` | Correction de bug | `fix: correction de l'erreur 404 sur /about` |
| `docs` | Doc / mémoire / README | `docs: clarification du workflow Git` |
| `chore` | Maintenance, config, deps | `chore: mise à jour des dépendances` |
| `refactor` | Refonte sans changement fonctionnel | `refactor: extraction du composant Header` |
| `test` | Tests | `test: ajout des tests du formulaire` |
| `style` | Mise en forme (espaces, lint) | `style: formatage des fichiers CSS` |

**Règles :**
- Une ligne de sujet ≤ 72 caractères
- Pas de point final
- Verbe à l'impératif (`ajoute`, `corrige`, `supprime`)
- Si besoin de plus d'explications → ligne vide + corps du message

## 4. Pull Requests

À chaque branche poussée, Claude ouvre une **PR en draft** :

```
Titre : <type>: <résumé court>

Corps :
## Résumé
- bullet 1
- bullet 2

## Comment tester
- [ ] étape 1
- [ ] étape 2
```

Une fois la PR validée → merge dans `main` → suppression de la branche.

## 5. Le script `ship.sh` (raccourci tout-en-un)

Pour gagner du temps, utilise :

```bash
./scripts/ship.sh "feat: ajout de la page d'accueil"
```

Ce script fait automatiquement :
1. `git status` (affichage)
2. `git add -A` sur les fichiers traqués + nouveaux (sauf `.gitignore`)
3. `git commit -m "<message>"`
4. `git push -u origin <branche-courante>`

⚠️ **Vérifie toujours `git status` avant** — `ship.sh` est rapide mais ne réfléchit pas à ta place.

## 6. Règles de sécurité

| Règle | Pourquoi |
|---|---|
| Jamais de `--force` sur `main` | Détruit l'historique partagé |
| Jamais commit `.env` ou clés | Fuites de secrets publiques |
| Toujours `git status` avant commit | Évite de pousser du bruit |
| Toujours préciser les fichiers à `add` | Évite d'inclure des fichiers oubliés |
| Branche par sujet | Garde les changements traçables et reviewables |

## 7. En cas de pépin

| Problème | Solution |
|---|---|
| "Je suis sur la mauvaise branche" | `git stash` → `git checkout <bonne>` → `git stash pop` |
| "J'ai oublié un fichier dans le dernier commit" | `git add <fichier>` → `git commit --amend --no-edit` (avant push uniquement) |
| "Mon push est refusé (non fast-forward)" | `git pull --rebase origin <branche>` puis re-push |
| "J'ai un conflit de merge" | Ouvrir les fichiers, résoudre les `<<<<<<<`, `git add`, `git commit` |
| "J'ai cassé quelque chose" | `git reflog` → retrouver le SHA → `git checkout <sha>` |

---

*Pour toute question sur Git, demande à Claude — il connaît ce workflow par cœur.*
