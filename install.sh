#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
skills_src="$script_dir/skills"
skills_trg="$HOME/.claude/skills"

mkdir -p "$skills_trg"
skills_trg="$(cd "$skills_trg" && pwd)"

for skill_dir in "$skills_src"/*/; do
  skill_name="$(basename "$skill_dir")"
  dest="$skills_trg/$skill_name"
  mkdir -p "$dest"
  cp -rT "$skill_dir" "$dest"
  echo "[+] installed $skill_name"
done

echo "[+] done"
