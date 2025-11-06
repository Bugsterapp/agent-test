---
description: Run Bugster tests using MCP
---

You are helping to run Bugster tests for this project.

# Your Task

When the user invokes this command, run the Bugster tests using the MCP tool.

## Steps

1. **Check if a specific test was requested**

   - If the user specified a test file, use the `spec` parameter
   - Otherwise, run all tests in the `.bugster/tests/` directory

2. **Run the tests**

   - Use the `mcp__bugster__run_tests` tool
   - Set `workingDirectory` to the current project root
   - Use `headless: false` for visible browser testing (default)

3. **Report results**
   - Show the test results to the user
   - If tests PASS: Summarize successful tests
   - If tests FAIL: Show error details to help debug

## Example Usage

User: `/run-tests`
→ Run all tests in `.bugster/tests/`

User: `/run-tests .bugster/tests/todo.yaml`
→ Run specific test file

## Important Notes

- Always use the `mcp__bugster__run_tests` MCP tool
- Default to running all tests if no specific test is mentioned
- Keep the user informed of test progress and results
