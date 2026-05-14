# CLAUDE.md — Mémoire du projet Zindabad313

> Ce fichier est lu automatiquement par Claude à chaque session. Il contient le contexte
> permanent du projet, les conventions et l'état actuel. **Garder à jour.**

---

## 1. Identité du projet

- **Nom** : Zindabad313
- **Propriétaire** : afgholami
- **Repo GitHub** : `afgholami/zindabad313`
- **Domaine final (production)** : `gholami.ch`
- **Domaine de test (bac à sable)** : `ehsan.laus-angeles.ch` (sous-domaine sur `laus-angeles.ch`)
- **Hébergeur** : **Infomaniak** (Suisse, Genève) — confirmé via IP `217.26.61.109`
- **Stack** : Node.js 22 LTS + Express (sert du HTML/CSS statique)
- **Outil de design UI** : **Google Stitch** (https://stitch.withgoogle.com/) — génère du HTML/CSS Tailwind à partir de prompts
- **Langue de travail** : Français (utilisateur francophone)
- **Objectif** : monter en compétence sur le sous-domaine de test, puis migrer le résultat validé vers `gholami.ch`

## 2. Mode de collaboration avec Claude

Claude travaille **de bout en bout** sur ce projet :

1. Tu décris ce que tu veux (haut niveau, en français)
2. Claude planifie, code, teste, commit, push, ouvre PR
3. Claude met à jour la mémoire (`CLAUDE.md`, `docs/JOURNAL.md`) après chaque étape clé

**Principes :**
- Toujours travailler sur une branche `claude/<sujet>` (jamais directement sur `main`)
- Toujours commit + push après chaque jalon (pas de travail perdu)
- Toujours ouvrir une PR (en draft) pour tracer les changements
- Toujours documenter les décisions importantes dans `docs/JOURNAL.md`

## 3. Conventions Git

### Branches
- `main` → branche stable, protégée
- `claude/<sujet-en-kebab-case>` → branche de travail (ex: `claude/setup-workflow`)

### Messages de commit
Format **Conventional Commits** simplifié :
```
<type>: <description courte en français>

<corps optionnel expliquant le pourquoi>
```

Types autorisés : `feat`, `fix`, `docs`, `chore`, `refactor`, `test`, `style`

Exemples :
- `feat: ajout du formulaire de contact`
- `fix: correction du bug d'affichage mobile`
- `docs: mise à jour de la mémoire projet`

### Workflow standard (à chaque modif)
```bash
git status                      # vérifier ce qui change
git add <fichiers>              # stager (jamais `git add .` sans réfléchir)
git commit -m "type: message"   # commit clair
git push -u origin <branch>     # push avec tracking
```

Le script `scripts/ship.sh` automatise ça (voir `docs/WORKFLOW.md`).

## 4. Structure du dépôt

```
Zindabad313/
├── CLAUDE.md              ← Tu es ici (mémoire principale)
├── README.md              ← Vitrine publique du repo
├── .gitignore
├── .claude/
│   └── settings.json      ← Permissions Claude (autorisations bash, etc.)
├── docs/
│   ├── WORKFLOW.md        ← Workflow Git détaillé + commandes
│   ├── PROJECT.md         ← Infos hébergement, accès, comptes
│   └── JOURNAL.md         ← Journal des décisions et apprentissages
└── scripts/
    └── ship.sh            ← Script add/commit/push tout-en-un
```

## 5. État actuel

| Élément | Statut |
|---|---|
| Repo GitHub | ✅ Créé (`afgholami/zindabad313`) |
| Domaine `gholami.ch` (final) | 🟡 Hébergé chez Infomaniak — accès en cours de récupération |
| Sous-domaine `ehsan.laus-angeles.ch` (test) | 🟡 Création en cours sur Infomaniak (Node.js, installation avancée) |
| Structure projet | ✅ Initialisée |
| Workflow Claude | ✅ Documenté |
| Code applicatif | ❌ Pas encore commencé (Express minimal à créer) |
| Stitch (Google) | 🟡 À utiliser pour générer le HTML/CSS |

## 6. Ce que Claude doit faire automatiquement

À chaque session, **sans qu'on le redemande** :

1. **Lire ce fichier** (fait automatiquement par le harness)
2. **Lire `docs/JOURNAL.md`** pour le contexte récent
3. **Vérifier `git status`** avant de modifier quoi que ce soit
4. **Travailler sur la bonne branche** (jamais directement `main`)
5. **Commit + push** dès qu'un jalon est atteint (ne jamais accumuler)
6. **Mettre à jour le journal** (`docs/JOURNAL.md`) à la fin de chaque session

## 7. Ce que Claude NE doit PAS faire

- ❌ Push sur `main` directement
- ❌ Force push (`git push -f`) sans demande explicite
- ❌ `git reset --hard`, `rm -rf`, sans confirmation
- ❌ Commit de secrets (`.env`, mots de passe, clés API) → toujours utiliser `.gitignore`
- ❌ Inventer des URLs, des identifiants ou des accès
- ❌ Modifier `CLAUDE.md` sans expliquer pourquoi dans le commit

## 8. Apprentissage continu

Quand Claude découvre une info utile (préférence utilisateur, convention,
choix technique récurrent), il l'ajoute :
- **Si c'est permanent** → dans ce fichier (`CLAUDE.md`)
- **Si c'est ponctuel/historique** → dans `docs/JOURNAL.md`

---

*Dernière mise à jour : 2026-05-14 — Initialisation du projet*
