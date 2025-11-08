---
name: Browser Testing

description: Automate end-to-end testing of web applications using Bugster CLI. Use when the user asks to generate tests, run test suites, or perform automated browser testing. Triggers include "generate tests", "run tests", "execute tests", "test automation", "E2E tests", "end-to-end testing", "automated testing", "create test specs". When executing commands, provide detailed and specific instructions.

allowed-tools: Bash
---

# Browser Testing

Automate end-to-end testing of web applications using Bugster CLI. This skill enables AI-powered test generation and execution through command-line tools for comprehensive testing workflows.

## Overview

This skill uses the Bugster CLI to generate and run AI-powered tests for web applications. The CLI analyzes your codebase, creates test specifications, and executes tests in real browser environments.

## Setup Verification

**IMPORTANT: Before using any Bugster commands, you MUST check setup.json in this directory.**

### First-Time Setup Check

1. **Read `setup.json`** (located in `.claude/skills/browser-testing/setup.json`)
2. **Check `setupComplete` field**:
   - If `true`: All prerequisites are met, proceed with Bugster commands
   - If `false`: Setup required - follow the steps below

### If Setup is Required (`setupComplete: false`)

Run these commands to install Bugster CLI:

```bash
# 1. Install Bugster CLI (REQUIRED)
curl -sSL https://bugster.dev/install.sh | bash

# 2. Verify installation (REQUIRED)
bugster --version

# 3. Initialize Bugster in your project (REQUIRED)
# Navigate to your project directory first
cd /path/to/your/project
bugster init
# Follow prompts to configure API key and project settings

# 4. If test succeeds, update setup.json
# Set "installed" field to true
# Set "setupComplete" to true
```

### Prerequisites Summary

- ✅ Bugster CLI installed and available in PATH
- ✅ Node.js 18+ installed on your system
- ✅ Project initialized with `bugster init`
- ✅ Bugster API key configured during init

**DO NOT attempt to use Bugster commands if `setupComplete: false` in setup.json. Guide the user through setup first.**

## Available Commands

### Generate Tests

```bash
bugster generate [options]
```

**When to use**: Analyzing codebase and automatically generating test specifications, creating test suites, generating test scenarios.

**Options**:

- `--count <number>`: Number of test specs to generate per page (range: 1-30)
- `--page <paths>`: Generate specs only for specific page files (comma-separated paths)
- `--prompt <text>`: Custom prompt to guide AI test generation (must be used with `--page`)

**Example usage**:

- `bugster generate`
- `bugster generate --count 10`
- `bugster generate --page "pages/product.tsx" --prompt "Focus on edge cases and error handling"`
- `bugster generate --page "pages/login.tsx,pages/signup.tsx" --count 5`

**Output**: Test specifications saved in `.bugster/tests/` directory with JSON format

### Run Tests

```bash
bugster run [path] [options]
```

**When to use**: Executing test specifications, validating functionality, running test suites, performing automated testing.

**Options**:

- `--headless`: Run tests in headless mode without visible browser UI (ideal for CI/CD)
- `--parallel <number>`: Maximum number of concurrent tests (default: 3)
- `--limit <number>`: Maximum number of tests to execute
- `--browser <name>`: Browser engine to use (`chromium`, `firefox`, or `webkit`)
- `--prompt <text>`: Run an instant test from natural language description (max 1000 characters)

**Example usage**:

- `bugster run`
- `bugster run --headless`
- `bugster run --parallel 8`
- `bugster run --limit 5`
- `bugster run --prompt "Test user login with valid credentials and verify dashboard loads"`
- `bugster run --path .bugster/tests/login-test.json --browser firefox`

**Important**: The `--prompt` option allows running instant tests without generating specifications first. This is useful for quick validation and ad-hoc testing.

**Output**: Test results including pass/fail status, screenshots, video recordings, and detailed logs

## Test Workflow

**Standard workflow**: The typical testing flow uses both commands sequentially:

1. Generate test specifications with `bugster generate`
2. Execute tests with `bugster run`

**Quick testing**: For rapid validation, use `bugster run --prompt` to execute tests directly without generating specifications.

**Iterative testing**: After code changes, regenerate tests with `bugster generate` and validate with `bugster run`.

## Best Practices

1. **Initialize first**: Always run `bugster init` in your project directory before generating or running tests
2. **Use natural language**: Leverage `--prompt` options with clear, specific instructions for AI-powered testing
3. **Optimize execution**: Use `--parallel` to speed up test runs, and `--limit` for quick validation
4. **Version control**: Commit the `.bugster/` directory to maintain consistent test configurations across your team
5. **Target specific pages**: Use `--page` with `generate` to focus on critical user flows
6. **Headless for CI/CD**: Always use `--headless` flag in continuous integration environments
7. **Review outputs**: Check test results, logs, and screenshots to identify and address issues promptly
8. **Iterate regularly**: Regenerate tests after significant code changes to keep test coverage current

## Common Patterns

### Generate and run complete test suite

```bash
bugster generate
bugster run
```

### Generate focused tests for critical pages

```bash
bugster generate --page "pages/checkout.tsx,pages/payment.tsx" --count 15 --prompt "Focus on payment processing and security"
```

### Run tests in CI/CD environment

```bash
bugster run --headless --parallel 5
```

### Quick ad-hoc validation

```bash
bugster run --prompt "Verify the contact form submits successfully and displays a confirmation message"
```

### Debug specific test with browser visible

```bash
bugster run --path .bugster/tests/checkout-test.json --limit 1
```

### Generate comprehensive test suite

```bash
bugster generate --count 20
bugster run --headless --parallel 10
```

## Troubleshooting

**Command not found**: Ensure Bugster CLI is installed and added to PATH. Run `curl -sSL https://bugster.dev/install.sh | bash` to install

**Project not initialized**: Run `bugster init` in your project directory to set up configuration files

**Authentication issues**: Verify your Bugster API key is configured correctly. Re-run `bugster init` to reconfigure

**Test failures**: Review detailed logs and screenshots in test output. Use `bugster run --limit 1` to debug individual tests

**No tests found**: Ensure you've run `bugster generate` first, or use `bugster run --prompt` for instant testing

**Browser issues**: Try different browsers with `--browser` option or ensure required browsers are installed

For detailed examples, see [EXAMPLES.md](EXAMPLES.md).
For API reference and technical details, see [REFERENCE.md](REFERENCE.md).

## Dependencies

To use this skill, ensure Bugster CLI is installed:

```bash
# Install Bugster CLI
curl -sSL https://bugster.dev/install.sh | bash

# Verify installation
bugster --version
```

**Requirements**:

- Node.js 18 or higher
- Supported browsers (Chromium, Firefox, or WebKit)
- Valid Bugster API key
