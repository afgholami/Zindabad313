# Zindabad313

Repo de travail pour le projet **gholami.ch** (hébergé chez Infomaniak).

## 📚 Documentation

| Fichier | Contenu |
|---|---|
| [`CLAUDE.md`](./CLAUDE.md) | Mémoire principale du projet (lue par Claude à chaque session) |
| [`docs/WORKFLOW.md`](./docs/WORKFLOW.md) | Workflow Git (add / commit / push / PR) |
| [`docs/PROJECT.md`](./docs/PROJECT.md) | Infos techniques (domaine, hébergement, accès) |
| [`docs/JOURNAL.md`](./docs/JOURNAL.md) | Journal de bord (décisions + apprentissage) |

## 🚀 Pour pousser des changements

```bash
# Méthode automatique (recommandée)
./scripts/ship.sh "feat: description du changement"

# Méthode manuelle
git add <fichiers>
git commit -m "type: message"
git push -u origin <branche>
```

⚠️ Ne jamais travailler directement sur `main`. Toujours sur une branche `claude/<sujet>`.

## 🤖 Travailler avec Claude

Claude lit automatiquement [`CLAUDE.md`](./CLAUDE.md) à chaque session. Il connaît :
- Le contexte du projet (domaine, hébergeur, etc.)
- Le workflow Git à suivre
- Les conventions de commit
- Ce qu'il ne doit pas faire

Pour démarrer une session : décris simplement ce que tu veux faire, en français.

---

*Projet privé — Only for me.*
