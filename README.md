# ccx

claude code xtras, a collection of custom skills for claude code.

## skills

| command | file | description |
|---------|------|-------------|
| `/ccx-auto-optimize` | [SKILL.md](skills/ccx-auto-optimize/SKILL.md) | auto optimize code inspired by [karpathy/autoresearch](https://github.com/karpathy/autoresearch) |
| `/ccx-benchmark` | [SKILL.md](skills/ccx-benchmark/SKILL.md) | measure and compare performance with reproducible benchmarks |
| `/ccx-test` | [SKILL.md](skills/ccx-test/SKILL.md) | write tests following kent beck's [test desiderata](https://testdesiderata.com/) |

## installation

```bash
git clone https://github.com/brihter/ccx.git
cd ccx
./install.sh
```

this copies all skills into `~/.claude/skills/`, where claude code automatically discovers them. note that running the install again will overwrite any existing skills with the same name.
