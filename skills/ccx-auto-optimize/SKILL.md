---
name: ccx-auto-optimize
description: Auto-optimize code by iteratively benchmarking one change at a time, keeping only verified improvements. Use this skill whenever the user asks to optimize, speed up or improve the performance of code or making something faster even if they don't specify a methodology.
---

Optimize the implementation for performance. Work one file at a time. Isolate every benchmark run: change one idea, test it, then keep only verified improvements.

Guidelines:

* avoid copying or allocating in hot paths; prefer views, slices, in-place updates, and buffer reuse when ownership is clear
* avoid intermediate collections; fuse transformations, stream results, or write directly to the destination
* avoid repeated work; cache derived values and hoist loop invariants
* keep data layouts cache-friendly and loops simple
* move I/O, logging, locks, and syscalls out of inner loops or batch them
* prefer algorithmic improvements over micro-optimizations
* keep complex code only when benchmarks justify it

Constraints:

* evaluate at most 5 ideas per file
* if no worthwhile ideas are found, leave the implementation unchanged

Notes:

* if no benchmark command is apparent, ask the user before proceeding
* if no test command is apparent, ask the user before proceeding

Process:

First rank ideas by expected theoretical impact, then test them from highest to lowest likely yield.

1. benchmark the current implementation to establish a baseline
2. identify one optimization
3. implement only that change
4. run relevant tests; if they fail, fix the implementation
5. rerun the benchmark and compare against baseline
6. decide:
   * faster -> keep the change
   * slower -> discard the change
   * no meaningful difference -> keep the simpler code
7. if kept, use the updated version as the new baseline

On completion, show a summary table with columns: idea, result (kept/discarded), baseline time, new time, % change.
