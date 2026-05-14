# AUTO_DEPLOY.md — Auto-déploiement GitHub → Infomaniak

> Workflow GitHub Actions qui déclenche un build Infomaniak après chaque push sur `main`.

---

## 🔧 Setup (à faire une seule fois)

### 1. Credentials Infomaniak OAuth2

Tu as déjà créé une **application OAuth2** sur Infomaniak (Profil → Application API).
Récupère :
- **Client ID** (visible dans la liste des apps)
- **Client Secret** (généré une fois, à conserver dans un gestionnaire de mots de passe)

### 2. Trouver les IDs `hosting` et `site`

Lance le workflow en mode **discover** (voir section "Utilisation") sans `INFOMANIAK_HOSTING_ID` ni `INFOMANIAK_SITE_ID`. Il listera les hostings/sites disponibles. Note :
- `INFOMANIAK_HOSTING_ID` (ex: `123456`)
- `INFOMANIAK_SITE_ID` (ex: `789012`)

### 3. Ajouter les 4 secrets sur GitHub

Va sur https://github.com/afgholami/Zindabad313/settings/secrets/actions

Clique **New repository secret**, ajoute 4 secrets :

| Nom du secret | Valeur |
|---|---|
| `INFOMANIAK_CLIENT_ID` | Le Client ID OAuth2 |
| `INFOMANIAK_CLIENT_SECRET` | Le Client Secret OAuth2 |
| `INFOMANIAK_HOSTING_ID` | L'ID du hosting (trouvé via discover) |
| `INFOMANIAK_SITE_ID` | L'ID du site (trouvé via discover) |

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
