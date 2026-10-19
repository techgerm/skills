#!/usr/bin/env bash
set -euo pipefail

if [[ $# -gt 1 || ${1:-} == --help || ${1:-} == -h ]]; then
  printf 'Usage: bash %s [home-directory]\n' "${BASH_SOURCE[0]}"
  printf 'Defaults to your home directory. Existing instruction files are backed up.\n'
  if [[ $# -gt 1 ]]; then
    exit 1
  fi
  exit 0
fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
repo_dir="$(cd -- "$script_dir/.." && pwd -P)"
source_file="$repo_dir/instructions/AGENTS.md"
home_dir="$(cd -- "${1:-$HOME}" && pwd -P)"
codex_file="$home_dir/.codex/AGENTS.md"
claude_file="$home_dir/.claude/CLAUDE.md"

if [[ ! -s "$source_file" ]]; then
  printf 'Missing or empty instruction file: %s\n' "$source_file" >&2
  exit 1
fi

for directory in "$home_dir/.codex" "$home_dir/.claude"; do
  if [[ ( -e "$directory" || -L "$directory" ) && ! -d "$directory" ]]; then
    printf 'Expected a directory: %s\n' "$directory" >&2
    exit 1
  fi
done

for destination in "$codex_file" "$claude_file"; do
  if [[ -d "$destination" && ! -L "$destination" ]]; then
    printf 'Expected an instruction file, found a directory: %s\n' "$destination" >&2
    exit 1
  fi
done

mkdir -p "$home_dir/.codex" "$home_dir/.claude"

ensure_link() {
  local destination="$1"
  local target="$2"
  local backup=""
  local backup_base=""
  local counter=0

  if [[ -L "$destination" && "$(readlink "$destination")" == "$target" ]]; then
    printf 'Already linked: %s\n' "$destination"
    return
  fi

  if [[ -e "$destination" || -L "$destination" ]]; then
    backup_base="$destination.backup.$(date +%Y%m%d-%H%M%S)"
    backup="$backup_base"
    while [[ -e "$backup" || -L "$backup" ]]; do
      counter=$((counter + 1))
      backup="$backup_base.$counter"
    done
    mv "$destination" "$backup"
    printf 'Backed up: %s\n' "$backup"
  fi

  if ! ln -s "$target" "$destination"; then
    if [[ -n "$backup" ]]; then
      mv "$backup" "$destination"
      printf 'Restored: %s\n' "$destination" >&2
    fi
    return 1
  fi

  printf 'Linked: %s -> %s\n' "$destination" "$target"
}

ensure_link "$codex_file" "$source_file"
ensure_link "$claude_file" "$codex_file"

printf 'Global instructions are ready. Start new Codex and Claude sessions to load them.\n'
