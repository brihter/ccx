# ccx

claude code xtras, a collection of custom skills for claude code.

## skills

| skill | description |
|-------|-------------|
| `/ccx-auto-optimize` | iteratively benchmark and optimize code, keeping only verified improvements |

## installation

```bash
git clone https://github.com/brihter/ccx.git
cd ccx
./install.sh
```

this copies all skills into `~/.claude/skills/`, where claude code automatically discovers them. note that running the install again will overwrite any existing skills with the same name.
