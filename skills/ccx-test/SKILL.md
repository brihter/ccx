---
name: ccx-test
description: Write tests following Test Desiderata. Triggered when the user asks to write, add or create tests or mentions test coverage, specs, TDD, "make sure this works," "verify this behavior," or "add regression tests." Also use when the user asks to refactor code and wants tests to protect against regressions or when reviewing code and test gaps are apparent.
---

Write tests for the specified code. Strictly follow Kent Beck's Test Desiderata below.

## Test Desiderata

Optimize for these properties, weigh tradeoffs carefully:

* Isolated - tests should return the same results regardless of the order in which they are run.
* Composable - I should be able to test different dimensions of variability separately and combine the results.
* Deterministic - if nothing changes, the test result shouldn't change.
* Fast - tests should run quickly.
* Writable - tests should be cheap to write relative to the cost of the code being tested.
* Readable - tests should be comprehensible for reader, invoking the motivation for writing this particular test.
* Behavioral - tests should be sensitive to changes in the behavior of the code under test. If the behavior changes, the test result should change.
* Structure-insensitive - tests should not change their result if the structure of the code changes.
* Automated - tests should run without human intervention.
* Specific - if a test fails, the cause of the failure should be obvious.
* Predictive - if the tests all pass, then the code under test should be suitable for production.
* Inspiring - passing the tests should inspire confidence

## Practical Heuristics

These aren't rules, they're defaults that produce good tests.

Override them when the situation calls for it:

* Test behavior at boundaries and error paths, not just the happy path. The interesting bugs live at edges: empty inputs, off-by-ones, invalid states, permission failures.
* One logical assertion per test. A test that checks five things fails for five reasons. When it breaks, you want to know which one.
* Name tests to describe the expected behavior, not the implementation. `rejects_expired_token` tells you what broke, `test_validate_3` does not.
* Prefer testing through the public interface. Reaching into private methods couples tests to structure, violating structure-insensitivity.

## Workflow

### Existing code

This is the common case. The code already works (or is believed to), the goal is to lock in behavior.

1. Read the code and identify the distinct behaviors worth testing.
2. Write tests one at a time, running each immediately to confirm it passes.
3. If a test unexpectedly fails, investigate - it may reveal a real bug or a misunderstanding of the behavior.

### New code

Test-first (red-green-refactor) when writing new code or when the user explicitly asks for TDD.

1. Understand the target behavior.
2. Write a failing test for one behavior.
3. Verify it fails for the right reason.
4. Implement the minimal code needed to pass.
5. Verify it passes.
6. Repeat.
