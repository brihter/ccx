#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
skills_src="$script_dir/skills"

for skills_trg in "$HOME/.claude/skills" "$HOME/.agents/skills"; do
  mkdir -p "$skills_trg"
  skills_trg="$(cd "$skills_trg" && pwd)"

  old_skill="$skills_trg/ccx-auto-optimize"
  if [[ -d "$old_skill" || -L "$old_skill" ]]; then
    rm -rf -- "$old_skill"
    echo "[+] removed renamed ccx-auto-optimize from $skills_trg"
  fi

  for skill_dir in "$skills_src"/*/; do
    skill_name="$(basename "$skill_dir")"
    dest="$skills_trg/$skill_name"
    mkdir -p "$dest"
    cp -rT "$skill_dir" "$dest"
    echo "[+] installed $skill_name in $skills_trg"
  done
done

echo "[+] done"
