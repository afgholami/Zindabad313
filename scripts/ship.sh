#!/usr/bin/env bash
# ship.sh — Raccourci add + commit + push pour Zindabad313
#
# Usage :
#   ./scripts/ship.sh "feat: ajout de la page d'accueil"
#
# Que fait ce script :
#   1. Affiche `git status` pour que tu vois ce qui change
#   2. Demande confirmation avant de stager
#   3. `git add -A` (tous les fichiers traqués + nouveaux, .gitignore respecté)
#   4. `git commit -m "<message>"`
#   5. `git push -u origin <branche-courante>`
#
# Sécurité :
#   - Refuse de tourner sur `main` (force à utiliser une branche claude/*)
#   - Refuse les messages vides ou < 10 caractères

set -euo pipefail

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# --- Vérifs préliminaires ---

if [ $# -lt 1 ]; then
  echo -e "${RED}❌ Erreur : message de commit manquant${NC}"
  echo "Usage : ./scripts/ship.sh \"type: description\""
  echo "Exemple : ./scripts/ship.sh \"feat: ajout du formulaire de contact\""
  exit 1
fi

MESSAGE="$1"

if [ ${#MESSAGE} -lt 10 ]; then
  echo -e "${RED}❌ Erreur : message trop court (< 10 caractères)${NC}"
  echo "Sois plus descriptif."
  exit 1
fi

BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$BRANCH" = "main" ]; then
  echo -e "${RED}❌ Erreur : tu es sur 'main'.${NC}"
  echo "Crée une branche : git checkout -b claude/<sujet>"
  exit 1
fi

# --- État actuel ---

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}📍 Branche courante :${NC} $BRANCH"
echo -e "${BLUE}💬 Message de commit :${NC} $MESSAGE"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

echo -e "\n${YELLOW}📋 État du repo (git status) :${NC}"
git status --short

if [ -z "$(git status --porcelain)" ]; then
  echo -e "\n${YELLOW}⚠️  Rien à commiter. Rien à pousser.${NC}"
  exit 0
fi

# --- Confirmation ---

echo ""
read -p "$(echo -e ${YELLOW}❓ Continuer \(stage + commit + push\) ? [y/N] ${NC})" -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo -e "${RED}Abandonné.${NC}"
  exit 1
fi

# --- Stage + Commit + Push ---

echo -e "\n${BLUE}➕ git add -A${NC}"
git add -A

echo -e "\n${BLUE}📝 git commit${NC}"
git commit -m "$MESSAGE"

echo -e "\n${BLUE}🚀 git push -u origin $BRANCH${NC}"
git push -u origin "$BRANCH"

echo -e "\n${GREEN}✅ C'est en ligne !${NC}"
echo -e "${GREEN}   Branche : $BRANCH${NC}"
echo -e "${GREEN}   Commit : $MESSAGE${NC}"
