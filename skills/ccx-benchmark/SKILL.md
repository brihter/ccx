---
name: ccx-benchmark
description: Write benchmarks following Benchmark Desiderata. Triggered when the user asks to write, add or create benchmarks, measure performance, compare implementations, validate a speedup, establish a baseline, or mentions throughput, latency, microbenchmarks or performance regressions.
---

Write benchmarks for the specified code. Follow the Benchmark Desiderata below.

## Benchmark Desiderata

Optimize for these properties, weigh tradeoffs carefully:

* Representative - use realistic inputs, sizes and access patterns.
* Isolated - benchmark one thing at a time.
* Deterministic - keep runs stable enough to compare.
* Honest - make sure the work cannot be optimized away.
* Warmed-up - exclude setup and warmup from measured time when the harness supports it.
* Specific - if a benchmark regresses, it should be clear what got slower.
* Readable - benchmark names should describe the workload, not the implementation.
* Automated - benchmarks should run from the project's normal tooling.

## Notes

* These are defaults, not rigid rules. Override them when the situation calls for it.
* Prefer the project's existing benchmark harness, file layout and naming conventions.
* Never invent an ad-hoc timing loop if the ecosystem already has a proper benchmark tool.
* Keep setup and data generation outside the measured section unless setup cost is what you are testing.
* Compare like with like: same command, same inputs, same configuration.
* Run multiple samples and prefer tool-reported aggregates over one lucky run.
* Report runtime separately from memory or allocations when available.

## Workflow

Before writing any benchmarks:

1. Identify the language and look for an existing benchmark setup: benchmark directories, existing benchmark files, benchmark libraries and runner commands.
2. Match the project's conventions: framework, file naming, directory structure and execution patterns. If benchmarks already exist, follow their patterns.
3. Determine the benchmark command. If no command is apparent, ask the user before proceeding.
4. Determine the baseline or comparison the benchmark needs to support.

Write one benchmark at a time and run it immediately to confirm it works. If results are too noisy to compare, improve the benchmark or report the uncertainty.

### Optimization work

When the benchmark is meant to validate a speedup:

1. Benchmark the current implementation.
2. Record the baseline metrics.
3. Make one change.
4. Rerun the same benchmark.
5. Keep only changes that improve performance without breaking correctness.
