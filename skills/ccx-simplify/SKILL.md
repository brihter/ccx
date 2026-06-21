---
name: ccx-simplify
description: Simplify recently modified or explicitly scoped code without changing observable behavior. Use when the user asks to simplify, clean up, clarify, tidy, refactor for readability, reduce complexity, remove redundancy or improve maintainability without changing functionality.
---

Simplify the target code with the smallest justified change. Preserve all observable behavior and established contracts while making the implementation clearer, more consistent and easier to maintain.

Simplification is not redesign, optimization, modernization or bug fixing. When a proposed cleanup could change behavior or its equivalence cannot be established with reasonable confidence, leave it unchanged.

## Priorities

Apply these priorities in order:

1. Preserve supported inputs and outputs, side effects, errors, ordering, interfaces, persisted data and other relied-upon semantics (behavior preservation).
2. Make intent and control flow obvious to a reader familiar with the project (clarity).
3. Follow repository guidance and nearby conventions for naming, layout, abstractions, formatting and error handling (consistency).
4. Prefer the smallest diff that produces a meaningful improvement (minimality).
5. Stay within the requested or recently modified scope unless a nearby change is necessary for correctness or coherence (locality).
6. Prefer changes whose behavioral equivalence can be explained and checked (verifiability).

Do not trade a higher-priority property for a lower-priority one merely to reduce line count.

## Behavior-Preservation Boundary

Treat behavior broadly. Depending on the project, observable behavior may include:

* Return values, yielded values, output and mutations.
* File, network, database, process, environment and other external interactions.
* Error types, error codes, messages, exit statuses and the point at which failures occur.
* Logs, metrics, traces, warnings and audit events when callers, operators or tests may rely on them.
* Evaluation order, call order, number of evaluations, short-circuiting and observable side effects.
* Public APIs, exported symbols, ABI boundaries, command-line interfaces and configuration behavior.
* Serialized, persisted, cached, snapshot, schema and wire formats.
* Ordering and stability of collections or emitted data.
* Async, concurrency, locking, cancellation, retry, timeout, transaction and cleanup behavior.
* Validation, authorization and other security-relevant checks.
* Algorithmic complexity, resource use or timing when these are part of an established contract or operational requirement.

Passing tests is evidence of preservation, not proof. Review the resulting diff for semantic changes that tests may not cover.

## Preferred Simplifications

Prefer focused improvements such as:

* Replacing unnecessary nesting with direct control flow when evaluation and cleanup semantics remain unchanged.
* Giving local or private values names that express domain meaning.
* Narrowing variable scope, mutation and data flow.
* Removing genuine duplication when the duplicated paths have the same semantics.
* Consolidating repeated conditions or calculations only when their evaluation count and timing are not observable.
* Extracting a helper when it names a coherent concept, isolates meaningful complexity or removes substantial repetition.
* Removing unnecessary intermediates without making expressions denser or less debuggable.
* Deleting code proven to be unreachable or unused.
* Removing comments that merely restate the implementation.
* Retaining comments that explain constraints, rationale, invariants, compatibility requirements or non-obvious tradeoffs.
* Making adjacent code more uniform when the change is small and the local convention is clear.

## Avoid

Do not:

* Compress clear code into clever expressions, nested conditionals, dense pipelines or one-liners.
* Introduce an abstraction solely to reduce line count or avoid a small amount of harmless repetition.
* Combine unrelated responsibilities.
* Perform speculative generalization for hypothetical future use.
* Fix suspected bugs or change edge-case behavior as part of simplification unless the user explicitly requests it.
* Change dependencies, language versions, build settings, compiler options, feature flags or lockfiles without an explicit need.
* Rename or remove externally visible symbols, configuration keys, serialized fields, routes, commands or filenames.
* Accept changed snapshots or golden files merely to make behavior-changing tests pass.
* Reformat unrelated code or include opportunistic cleanup outside the established scope.
* Hand-edit generated or vendored files unless repository guidance explicitly requires it.
* Overwrite, revert or otherwise disturb unrelated user changes.

Be especially cautious with code that may be referenced through reflection, dynamic lookup, macros, annotations, decorators, dependency injection, plugin registration, templates, configuration, naming conventions, build tooling or side-effectful imports. Code or imports that appear unused may still be required.

Comments may also be semantically significant when they contain documentation directives, formatter controls, lint suppressions, type-checker instructions, code-generation markers, pragmas, licenses or tooling metadata.

## Workflow

### 1. Establish guidance and scope

1. Read applicable repository instructions and nearby documentation.
2. Identify the language, runtime, framework, build system and local conventions from the target area.
3. Use the user’s explicit paths, files or symbols as the primary scope.
4. Otherwise, use the smallest reliable change set available from the current task context or version-control diff.
5. Inspect the working tree before editing and distinguish target changes from unrelated user work.
6. Do not broaden the task into a repository-wide cleanup.

### 2. Understand existing behavior

Inspect enough surrounding context to explain what the code currently does:

* Relevant tests and fixtures.
* Callers and callees.
* Public or externally consumed interfaces.
* Error and cleanup paths.
* Data formats and ordering requirements.
* Concurrency, async, transaction and resource-lifecycle boundaries.
* Documentation, issue context or commit context when available.

Treat existing tests as behavioral evidence, but do not assume they define the complete contract.

When behavior remains ambiguous, prefer leaving the uncertain portion unchanged. Ask the user only when a decision from them is genuinely required to proceed safely.

### 3. Determine verification

Find project-standard verification commands from repository documentation, CI configuration, build metadata, scripts or nearby developer guidance.

For non-trivial work, establish a baseline when practical so pre-existing failures can be distinguished from regressions.

When no complete verification command is available:

* Run the strongest relevant checks that can be identified safely.
* Do not invent project commands or add tooling merely for verification.
* Record any verification gap in the completion summary rather than claiming full validation.

### 4. Simplify incrementally

1. Identify candidate changes and start with the clearest, lowest-risk improvement.
2. For each candidate, confirm that:
   * It makes the code meaningfully clearer or easier to maintain.
   * Its behavioral equivalence can be explained.
   * Its scope is proportionate to its benefit.
   * It follows project conventions.
3. Make one cohesive cleanup at a time.
4. Inspect the diff after each cohesive group of edits.
5. Keep formatting changes limited to the narrowest scope supported by project tooling.
6. Do not alter tests to bless changed behavior. Add or adjust tests only when needed to capture behavior that already exists.

### 5. Verify and review

Use the project’s standard tools where available. Depending on the project, verification may include:

1. Formatting or format checks.
2. Static analysis, linting or type checks.
3. Focused tests for the changed area.
4. Relevant integration tests, builds or broader test suites.

After automated checks, review the final diff for:

* Accidental interface or data-format changes.
* Changed evaluation, error or cleanup order.
* Lost side effects or repeated operations.
* Changed null, empty, falsy, coercion, numeric, locale, encoding or ordering semantics.
* Concurrency, cancellation, transaction or resource-lifecycle changes.
* Unrelated formatting or edits.
* Generated artifacts or dependency files changed unintentionally.

If verification fails, determine whether the failure was pre-existing. Fix or revert only the simplification responsible for a regression. Do not hide failures, weaken checks or modify expected output to force success.

## Completion

Report:

* The important simplifications made.
* Why they preserve behavior, when that is not obvious.
* The verification commands or checks performed and their results.
* Any pre-existing failures or verification limitations.
* Any areas deliberately left unchanged because equivalence was uncertain.

If no worthwhile simplification is found, leave the code unchanged and explain why.
