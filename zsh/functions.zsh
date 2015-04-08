# Small helpers — keep portable, no project assumptions.

mkcd() {
  mkdir -p "$1" && cd "$1"
}

gclone() {
  if [[ $# -lt 1 ]]; then
    echo "usage: gclone <repo-url> [dir]" >&2
    return 1
  fi
  local dest="${2:-$(basename "$1" .git)}"
  git clone "$1" "$dest" && cd "$dest"
}

# Find and cd to a git repo root from anywhere inside it.
grt() {
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -d "$dir/.git" ]]; then
      cd "$dir"
      return 0
    fi
    dir="$(dirname "$dir")"
  done
  echo "not inside a git repo" >&2
  return 1
}
