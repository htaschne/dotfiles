#!/usr/bin/env bash
# Bootstrap this dotfiles repository after cloning it to ~/.config.

set -euo pipefail

readonly APP_NAME="dotfiles setup"
readonly TMUX_LINK="$HOME/.tmux.conf"
readonly TMUX_TARGET=".config/.tmux.conf"

ASSUME_YES=false
DRY_RUN=false

color() {
  if [[ -t 1 && "${NO_COLOR:-}" == "" ]]; then
    printf '\033[%sm' "$1"
  fi
}

reset() { color 0; }
bold() { color 1; }
cyan() { color '36'; }
green() { color '32'; }
yellow() { color '33'; }
red() { color '31'; }

headline() {
  printf '\n'
  cyan; bold
  printf '  ┌──────────────────────────────┐\n'
  printf '  │       %s       │\n' "$APP_NAME"
  printf '  └──────────────────────────────┘\n'
  reset
}

note() {
  cyan; printf '  › '; reset
  printf '%s\n' "$*"
}

success() {
  green; printf '  ✓ '; reset
  printf '%s\n' "$*"
}

warning() {
  yellow; printf '  ! '; reset
  printf '%s\n' "$*"
}

fail() {
  red; printf '  ✗ '; reset
  printf '%s\n' "$*" >&2
  exit 1
}

usage() {
  cat <<'EOF'
Usage: ./install.sh [--yes] [--dry-run]

  --yes       Apply the setup without displaying the interactive menu.
  --dry-run   Show the changes that would be made, without making them.
  --help      Show this help.
EOF
}

run() {
  if "$DRY_RUN"; then
    printf '      would run:'
    printf ' %q' "$@"
    printf '\n'
  else
    "$@"
  fi
}

repo_root() {
  git -C "$(dirname "$0")" rev-parse --show-toplevel 2>/dev/null
}

verify_location() {
  local root expected
  root="$(repo_root)" || fail "Run this script from a clone of the dotfiles repository."
  expected="$HOME/.config"

  [[ "$root" == "$expected" ]] || fail "This repository must be cloned to $expected (found $root)."
  [[ -f "$root/.tmux.conf" ]] || fail "Missing $root/.tmux.conf."
}

install_submodules() {
  note "Initializing Git submodules"
  run git -C "$REPO_ROOT" submodule sync --recursive
  run git -C "$REPO_ROOT" submodule update --init --recursive
  success "Submodules are ready"
}

backup_path() {
  local stamp candidate suffix
  stamp="$(date +%Y%m%d-%H%M%S)"
  candidate="${TMUX_LINK}.before-dotfiles-${stamp}"
  suffix=1
  while [[ -e "$candidate" || -L "$candidate" ]]; do
    candidate="${TMUX_LINK}.before-dotfiles-${stamp}-${suffix}"
    suffix=$((suffix + 1))
  done
  printf '%s\n' "$candidate"
}

install_tmux_link() {
  local current backup

  if [[ -L "$TMUX_LINK" ]]; then
    current="$(readlink "$TMUX_LINK")"
    if [[ "$current" == "$TMUX_TARGET" ]]; then
      success "Tmux configuration link is already correct"
      return
    fi
  fi

  if [[ -e "$TMUX_LINK" || -L "$TMUX_LINK" ]]; then
    backup="$(backup_path)"
    warning "Saving existing ~/.tmux.conf to ${backup#$HOME/}"
    run mv "$TMUX_LINK" "$backup"
  fi

  note "Linking ~/.tmux.conf → $TMUX_TARGET"
  run ln -s "$TMUX_TARGET" "$TMUX_LINK"
  success "Tmux configuration is linked"
}

show_plan() {
  printf '\n'
  bold; printf '  Setup plan\n'; reset
  printf '  • Repository: %s\n' "$REPO_ROOT"
  printf '  • Initialize and update submodules\n'
  printf '  • Link ~/.tmux.conf → %s\n' "$TMUX_TARGET"
  printf '\n'
}

install() {
  verify_location
  show_plan
  install_submodules
  install_tmux_link
  printf '\n'
  green; bold; printf '  All set. Your dotfiles are configured.\n'; reset
}

menu() {
  headline
  verify_location
  show_plan
  printf '  [1] Install / repair configuration\n'
  printf '  [2] Preview setup plan\n'
  printf '  [3] Exit\n\n'
  printf '  Choose an option: '
  read -r choice

  case "$choice" in
    1) install ;;
    2) success "Preview complete; no changes made." ;;
    3) note "No changes made." ;;
    *) fail "Please run the installer again and choose 1, 2, or 3." ;;
  esac
}

while (($#)); do
  case "$1" in
    --yes) ASSUME_YES=true ;;
    --dry-run) DRY_RUN=true ;;
    --help|-h) usage; exit 0 ;;
    *) fail "Unknown option: $1 (try --help)" ;;
  esac
  shift
done

REPO_ROOT="$(repo_root)" || fail "Run this script from a clone of the dotfiles repository."

if "$ASSUME_YES" || ! [[ -t 0 ]]; then
  headline
  install
else
  menu
fi
