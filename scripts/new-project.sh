#!/usr/bin/env bash
# Scaffold a new git repo with a sensible .gitignore.
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "usage: new-project <dirname>" >&2
  exit 1
fi

NAME="$1"
mkdir -p "$NAME"
cd "$NAME"
git init -b main

cat > .gitignore <<'EOF'
.DS_Store
*.log
.env
.env.*
node_modules/
__pycache__/
*.pyc
.venv/
dist/
build/
EOF

echo "# ${NAME}" > README.md
git add .
git commit -m "initial commit"
echo "created $(pwd)"
