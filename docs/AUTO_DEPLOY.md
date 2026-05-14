# AUTO_DEPLOY.md — Auto-déploiement GitHub → Infomaniak

> Workflow GitHub Actions qui déclenche un build Infomaniak après chaque push sur `main`.

---

## 🔧 Setup (à faire une seule fois)

### 1. Générer un Personal Access Token Infomaniak

1. Va sur https://manager.infomaniak.com/v3/infomaniak-api
2. Onglet **"Tokens"** (PAS "Applications OAuth2", c'est différent)
3. **Créer un token**
4. Donne-lui un nom (`github-actions-zindabad313`)
5. Scope : **basic** (suffit pour gérer l'hébergement)
6. Durée : 1 an (ou plus si dispo)
7. **Copie le token** (commence par un long string aléatoire)

### 2. Trouver les IDs `hosting` et `site`

Lance le workflow en mode **discover** (voir section "Utilisation") sans
`INFOMANIAK_HOSTING_ID` ni `INFOMANIAK_SITE_ID`. Il listera tes produits → tu y trouveras les IDs.

### 3. Ajouter les 3 secrets sur GitHub

Va sur https://github.com/afgholami/Zindabad313/settings/secrets/actions

Clique **New repository secret**, ajoute 3 secrets :

| Nom du secret | Valeur |
|---|---|
| `INFOMANIAK_API_TOKEN` | Le Personal Access Token généré à l'étape 1 |
| `INFOMANIAK_HOSTING_ID` | L'ID du hosting (trouvé via discover) |
| `INFOMANIAK_SITE_ID` | L'ID du site (trouvé via discover) |

> Les secrets OAuth2 `INFOMANIAK_CLIENT_ID` / `INFOMANIAK_CLIENT_SECRET` créés
> initialement ne servent finalement plus (l'OAuth2 client_credentials n'est
> pas supporté par Infomaniak). Tu peux les supprimer si tu veux.

## 🚀 Utilisation

### Auto-deploy (automatique)

Chaque `git push origin main` déclenche le workflow → l'app se rebuild sur Infomaniak.

### Discover (manuel)

Pour trouver les IDs hosting/site :

1. Va sur https://github.com/afgholami/Zindabad313/actions
2. Onglet **"Auto-deploy on Infomaniak"** dans la liste
3. Bouton **"Run workflow"**
4. Sélectionne **action: discover**
5. Lance, regarde les logs → notes les IDs

### Build / Restart manuel

Même chose mais sélectionne `build` ou `restart`.

## 🩹 Si ça échoue

Le workflow tente 2 endpoints différents (Infomaniak ne documente pas publiquement
l'endpoint de build). Si les 2 échouent :

1. Lance le mode **discover** pour voir la structure de l'API
2. Inspecte la réponse — cherche un champ qui ressemble à un endpoint de build
3. Mets à jour `deploy.yml` avec le bon endpoint

## 🔒 Sécurité

- Les 4 secrets ne sont jamais visibles dans les logs GitHub
- Le Client Secret peut être régénéré sur Infomaniak en cas de fuite
- Limite : 60 req/min côté Infomaniak (largement suffisant)
