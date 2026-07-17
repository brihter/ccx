# ccx

claude code xtras, a collection of custom skills for claude code.

## skills

| command | file | description |
|---------|------|-------------|
| `/ccx-optimize` | [SKILL.md](skills/ccx-optimize/SKILL.md) | optimize code, inspired by [karpathy/autoresearch](https://github.com/karpathy/autoresearch) |
| `/ccx-benchmark` | [SKILL.md](skills/ccx-benchmark/SKILL.md) | measure and compare performance with reproducible benchmarks |
| `/ccx-plot` | [SKILL.md](skills/ccx-plot/SKILL.md) | create plots and save them as svgs, inspired by [socec](https://github.com/socec) |
| `/ccx-simplify` | [SKILL.md](skills/ccx-simplify/SKILL.md) | simplify code while preserving exact behavior |
| `/ccx-test` | [SKILL.md](skills/ccx-test/SKILL.md) | write tests following kent beck's [test desiderata](https://testdesiderata.com/) |

## installation

```bash
git clone https://github.com/brihter/ccx.git
cd ccx
./install.sh
```

this copies all skills into `~/.claude/skills/`, where claude code automatically discovers them. note that running the install again will overwrite any existing skills with the same name.

## credits

the plotting guide on which `/ccx-plot` is based was originally written by [socec](https://github.com/socec).
