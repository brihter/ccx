---
name: ccx-auto-optimize
description: Auto-optimize code by iteratively benchmarking one change at a time, keeping only verified improvements. Use this skill whenever the user asks to optimize, speed up or improve the performance of code or making something faster even if they don't specify a methodology.
---

Optimize the implementation for performance.

Work one file at a time and one optimization idea at a time.
Do not evaluate files or ideas in parallel, benchmark runs must stay isolated.

For each file:

1. run a benchmark on the current implementation to establish a baseline
2. identify one potential optimization
3. implement only that change
4. run the relevant tests to verify correctness, if tests fail, try to fix the implementation
5. rerun the benchmark and compare against the baseline
6. decide:
   * if faster -> keep the change
   * if slower -> discard the change
   * if no meaningful difference -> keep the simpler code
7. if kept, treat the updated version as the new baseline before evaluating the next idea

Constraints:

* evaluate at most 5 ideas per file
* never combine multiple ideas into a single benchmark cycle
* if no worthwhile ideas are found, leave the implementation unchanged

On completion, always show a summary table with columns: idea, result (kept/discarded), baseline time, new time, % change.

Notes:

* if no benchmark command is apparent, ask the user before proceeding
* if no test command is apparent, ask the user before proceeding
