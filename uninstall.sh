#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
skills_src="$script_dir/skills"

skill_names=(ccx-auto-optimize)
for skill_dir in "$skills_src"/*/; do
  skill_names+=("$(basename "$skill_dir")")
done

for skills_trg in "$HOME/.claude/skills" "$HOME/.agents/skills"; do
  for skill_name in "${skill_names[@]}"; do
    dest="$skills_trg/$skill_name"
    if [[ -d "$dest" || -L "$dest" ]]; then
      rm -rf -- "$dest"
      echo "[+] uninstalled $skill_name from $skills_trg"
    fi
  done
done

echo "[+] done"
