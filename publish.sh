#!/usr/bin/env bash
# One-shot publisher: initialises git, commits, and pushes to GitHub.
# Usage: bash publish.sh
set -euo pipefail

command -v git >/dev/null || { echo "git is not installed: https://git-scm.com/downloads"; exit 1; }

read -r -p "Your GitHub username [abdess-el]: " USER_NAME
USER_NAME=${USER_NAME:-abdess-el}
read -r -p "Repository name [cadence-sel-mux-45nm]: " REPO
REPO=${REPO:-cadence-sel-mux-45nm}

[ -d .git ] || git init -b main
git add .
git commit -m "Initial commit: hierarchical CMOS cell 'sel' (Virtuoso, schematic/layout/DRC/LVS)" || echo "Nothing new to commit."

if command -v gh >/dev/null && gh auth status >/dev/null 2>&1; then
  # GitHub CLI path: creates the repo and pushes in one step
  gh repo create "$USER_NAME/$REPO" --public --source=. --remote=origin --push \
    --description "Hierarchical CMOS logic cell in Cadence Virtuoso (45nm): schematic, symbol, layout, Assura DRC/LVS"
else
  echo
  echo "GitHub CLI not available/logged in. Create an EMPTY repo named '$REPO' at https://github.com/new"
  echo "(do NOT tick README/.gitignore/license), then press Enter."
  read -r _
  git remote remove origin 2>/dev/null || true
  git remote add origin "https://github.com/$USER_NAME/$REPO.git"
  git push -u origin main
fi
echo "Done: https://github.com/$USER_NAME/$REPO"
