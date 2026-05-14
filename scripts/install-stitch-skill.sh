#!/usr/bin/env bash
# install-stitch-skill.sh — Installation des skills Google Stitch pour Claude Code
#
# Usage :
#   ./scripts/install-stitch-skill.sh
#
# À exécuter sur ta machine locale (terminal/desktop), PAS dans le sandbox web.
# Pourquoi : Claude Code on the web n'a pas d'accès réseau pour cloner des
# dépôts externes, et les skills sont chargés depuis le filesystem local
# (~/.claude/skills/) au démarrage.
#
# Sources :
#   - Officiel Google Labs : https://github.com/google-labs-code/stitch-skills
#   - Doc Claude Code skills : https://code.claude.com/docs/en/skills

set -euo pipefail

# Couleurs
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

SKILLS_DIR="${HOME}/.claude/skills"
STITCH_DIR="${SKILLS_DIR}/stitch-skills"
REPO_URL="https://github.com/google-labs-code/stitch-skills.git"

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}📦 Installation des Google Stitch Skills${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# Vérifs préliminaires
if ! command -v git &> /dev/null; then
  echo -e "${RED}❌ git n'est pas installé. Installe-le d'abord.${NC}"
  exit 1
fi

# Création du dossier skills si absent
mkdir -p "$SKILLS_DIR"

# Clone ou update
if [ -d "$STITCH_DIR/.git" ]; then
  echo -e "${YELLOW}📥 Skills déjà installés — mise à jour...${NC}"
  git -C "$STITCH_DIR" pull --ff-only
else
  echo -e "${YELLOW}📥 Clonage depuis ${REPO_URL}...${NC}"
  git clone "$REPO_URL" "$STITCH_DIR"
fi

echo -e "\n${GREEN}✅ Skills installés dans ${STITCH_DIR}${NC}"

# Listing
echo -e "\n${BLUE}📚 Skills disponibles :${NC}"
ls -1 "$STITCH_DIR" 2>/dev/null | grep -v '^\.' | grep -v 'README' | sed 's/^/  • /' || true

echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}⚠️  Étape suivante : configurer le MCP server Stitch${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Les skills nécessitent un MCP server Stitch. Pour le configurer :"
echo "  1. Lance 'claude' dans ce dossier"
echo "  2. Utilise la commande /mcp pour ajouter le serveur Stitch"
echo "  3. Suis les instructions du README dans ${STITCH_DIR}"
echo ""
echo "Une fois fait, redémarre Claude Code pour charger les skills."
