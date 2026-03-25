#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
skills_src="$script_dir/skills"
skills_trg="$HOME/.claude/skills"

mkdir -p "$skills_trg"

for skill_dir in "$skills_src"/*/; do
  skill_name="$(basename "$skill_dir")"
  echo "[*] installing $skill_name ..."
  cp -r "$skill_dir" "$skills_trg/$skill_name"
done

echo "[*] done"
