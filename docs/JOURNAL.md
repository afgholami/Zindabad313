# JOURNAL.md — Journal de bord du projet

> Chaque session importante laisse une trace ici. Format : date inversée
> (plus récent en haut), titre court, décisions prises, ce qu'il faut faire ensuite.
>
> Claude met à jour ce fichier à la fin de chaque session avec un résumé concis.

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
