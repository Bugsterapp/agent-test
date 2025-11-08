# Browser Testing CLI Reference

This document provides detailed technical reference for the CLI browser testing tool.

## Architecture Overview

The browser testing system consists of:

- **Bugster CLI**: Command-line tool for AI-powered end-to-end testing
- **Test Specifications**: YAML/JSON files stored in `.bugster/tests/` directory
- **Browser Automation**: Runs tests in real browser environments (Chromium, Firefox, WebKit)
- **AI Test Generation**: Analyzes codebase to create comprehensive test scenarios

## CLI Command Reference

### generate

Generate AI-powered test specifications by analyzing your codebase.

**Usage**

```bash
bugster generate [options]
```

**Parameters**:

- `--count <number>` (optional): Number of test specs to generate per page (range: 1-30)
- `--page <paths>` (optional): Generate specs only for specific page files (comma-separated paths)
- `--prompt <text>` (optional): Custom prompt to guide AI test generation (must be used with `--page`)

**Returns**:

Test specifications saved to `.bugster/tests/` directory

**Examples**:

```bash
# Generate tests for entire codebase
bugster generate

# Generate 10 tests per page
bugster generate --count 10

# Generate tests for specific pages with custom focus
bugster generate --page "pages/checkout.tsx" --prompt "Focus on error handling and validation"
```

---

### run

Execute Bugster test specifications in real browser environments.

**Usage**

```bash
bugster run [options]
```

**Parameters**:

- `--path <file>` (string, optional): Path to specific test file to run. **Required when specifying a test file.**
- `--prompt <text>` (string, optional): Run an instant test from natural language description (max 1000 characters)
- `--headless` (boolean, optional): Run tests in headless mode without visible browser UI
- `--parallel <number>` (optional): Maximum number of concurrent tests to run (default: 3)
- `--limit <number>` (optional): Maximum number of tests to execute
- `--browser <name>` (optional): Browser engine to use (`chromium`, `firefox`, or `webkit`)

**Returns**:

Test results including pass/fail status, screenshots, video recordings, and detailed logs

**Examples**:

```bash
# Run all tests in .bugster/tests/
bugster run

# Run specific test file (requires --path flag)
bugster run --path .bugster/tests/login-test.yaml

# Run instant test from natural language
bugster run --prompt "Test user login with valid credentials and verify dashboard loads"

# Run tests in headless mode with parallel execution
bugster run --headless --parallel 8

# Run specific test with different browser
bugster run --path .bugster/tests/checkout-test.json --browser firefox

# Run limited number of tests
bugster run --limit 5
```

**Important Notes**:

- When specifying a test file path, you **must** use the `--path` flag
- Without arguments, `bugster run` executes all tests in `.bugster/tests/` directory
- Use `--prompt` for ad-hoc testing without generating specifications
- Screenshots and videos are saved in the test output directory
