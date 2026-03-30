---
name: ccx-test
description: Write tests following Test Desiderata. Triggered when the user asks to write, add or create tests or mentions test coverage, specs, TDD, "make sure this works," "verify this behavior" or "add regression tests." Also use when the user asks to refactor code and wants tests to protect against regressions.
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

## Notes

* These aren't rules set in stone, they're defaults that produce good tests. Override them when the situation calls for it.
* Test behavior at boundaries and error paths, not just the happy path. The interesting bugs live at edges: empty inputs, off-by-ones, invalid states, permission failures.
* One logical assertion per test — meaning one reason to fail, not necessarily one assert statement.
* Name tests to describe the expected behavior, not the implementation. `rejects_expired_token` tells you what broke, `test_validate_3` does not.
* Prefer testing through the public interface. Reaching into private methods couples tests to structure, violating structure-insensitive.
* Mock at boundaries (network, disk, databases), not internals. Prefer dependency injection over monkey-patching when the language supports it.
* Mark each public function/method under test with a section comment or describe block, even if the file only tests one. Use whatever delimiter is idiomatic for the framework.
* Keep the test bodies terse, tight and compact (no internal blank lines in the test body), but don't obfuscate (no code golfing).

## Workflow

Before writing any tests:

1. Identify the language and look for an existing test setup: config files (e.g. jest.config, pytest.ini, Cargo.toml [dev-dependencies], go.mod, phpunit.xml), test directories and existing test files.
2. Match the project's conventions: test framework, file naming, directory structure, assertion style and import patterns. If tests already exist, follow their patterns.
3. Determine the test runner command. If no command is apparent, ask the user before proceeding.

### Existing code

This is the common case. The code already works (or is believed to), the goal is to lock in behavior.

* If a test file already exists for the code under test, extend it rather than creating a new one.
* Read the code and identify the distinct behaviors worth testing.
* Write tests one at a time, running each immediately to confirm it passes.
* If a test unexpectedly fails, investigate — it may reveal a real bug or a misunderstanding of the behavior.

### New code

Test-first (red-green-refactor) when writing new code or when the user explicitly asks for TDD.

1. Understand the target behavior.
2. Write a failing test for one behavior.
3. Verify it fails for the right reason.
4. Implement the minimal code needed to pass.
5. Verify it passes.
6. Repeat.

## Example

The structure below shows the expected shape of a test file. Adapt syntax to the project's language and framework.

```
// -- query -- //

test "returns empty list when state is empty" {
  items_state = {}
  assert query(items_state, {active: true}) == []
}

// -- count -- //

test "returns total when filters are missing" {
  items_state = make_items_state()
  assert count(items_state) == 2
}
```
