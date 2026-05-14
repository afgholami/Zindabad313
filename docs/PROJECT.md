# PROJECT.md — Infos techniques du projet

> ⚠️ **Ne JAMAIS commit de mots de passe, clés API ou identifiants dans ce fichier.**
> Seulement des **références** vers où trouver l'info (gestionnaire de mots de passe, etc.).

---

## 1. Domaines

### Domaine final (production)
| Info | Valeur |
|---|---|
| Nom de domaine | `gholami.ch` |
| Extension | `.ch` (Suisse) |
| Registrar (probable) | Infomaniak (à confirmer une fois connecté) |
| Statut | 🟡 Accès en cours de récupération |

### Sous-domaine de test (bac à sable)
| Info | Valeur |
|---|---|
| Sous-domaine | `ehsan.laus-angeles.ch` |
| Domaine parent | `laus-angeles.ch` (propriété de l'utilisateur) |
| Rôle | Environnement de test pour s'entraîner avec Google Stitch avant de pousser sur `gholami.ch` |
| Statut | 🟡 Création en cours (Node.js, installation avancée sur Infomaniak) |

## 1bis. Stack technique choisie

| Élément | Valeur |
|---|---|
| Runtime | **Node.js 22 LTS** |
| Framework serveur | **Express** (minimal, sert des fichiers statiques) |
| Gestionnaire de paquets | **npm** |
| Point d'entrée | `server.js` |
| Source du HTML/CSS | **Google Stitch** (https://stitch.withgoogle.com/) — génère du HTML + Tailwind CSS |
| Mode de déploiement | Git push sur Infomaniak (à confirmer une fois la config terminée) |

## 2. Hébergement

| Info | Valeur |
|---|---|
| Hébergeur | **Infomaniak Network SA** |
| Pays | Suisse (Genève) |
| IPv4 du domaine | `217.26.61.109` (plage Infomaniak `217.26.0.0/16`) |
| IPv6 du domaine | `2a00:d70:0:b:2002:0:d91a:3d6d` (plage `2a00:d70::/32`) |
| Manager client | https://manager.infomaniak.com/ |
| Webmail | https://mail.infomaniak.com |

### Identification de l'hébergeur

L'hébergeur a été identifié via :
1. Résolution DNS du domaine (`217.26.61.109`)
2. Croisement avec les plages IP RIPE/ARIN connues d'Infomaniak

## 3. Accès (références uniquement)

> 🔒 Stocker les vrais identifiants dans un **gestionnaire de mots de passe**
> (Bitwarden, 1Password, KeePass, etc.), **jamais dans ce repo**.

| Service | Type d'accès | Où trouver |
|---|---|---|
| Manager Infomaniak | Login web | _à compléter_ |
| FTP/SFTP | Login + mot de passe | _à compléter_ |
| Base de données | Host + user + pass | _à compléter_ |
| Webmail | Login + mot de passe | _à compléter_ |

## 4. Stack technique

_(À remplir une fois qu'on aura exploré le site existant)_

| Élément | Valeur |
|---|---|
| Type de site | _inconnu pour l'instant_ |
| Langage backend | _?_ |
| CMS éventuel | _?_ |
| Base de données | _?_ |
| Build / déploiement | _?_ |

## 5. Liens utiles

- **GitHub** : https://github.com/afgholami/zindabad313
- **Manager Infomaniak** : https://manager.infomaniak.com/v3/hosting
- **Webmail Infomaniak** : https://mail.infomaniak.com
- **Support Infomaniak** : https://www.infomaniak.com/fr/support

## 6. Récupération d'accès (si compte perdu)

Si les identifiants fournis ne donnent que des accès limités (FTP / DB / mail)
sans accès au compte principal Infomaniak :

1. Vérifier le **WHOIS** du domaine pour identifier le titulaire enregistré
2. Contacter le support Infomaniak avec :
   - Preuve d'identité (carte d'identité du titulaire WHOIS)
   - Facture éventuelle
   - Numéro de client si disponible
3. Demander une **réinitialisation du mot de passe** ou un **transfert de propriété**

---

*Mettre à jour ce fichier au fur et à mesure que tu récupères les accès.*
