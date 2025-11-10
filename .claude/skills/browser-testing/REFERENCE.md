# Browser Testing CLI Reference

This document provides detailed technical reference for the CLI browser testing tool.

## Architecture Overview

The browser testing system consists of:

- **Bugster CLI**: Command-line tool for AI-powered end-to-end testing
- **Test Specifications**: YAML/JSON files stored in `.bugster/tests/` directory
- **Browser Automation**: Runs tests in real browser environments (Chromium, Firefox, WebKit)
- **AI Test Generation**: Analyzes codebase to create comprehensive test scenarios

## Prerequisites for All Commands

**CRITICAL: Before running ANY Bugster command (`generate` or `run`):**

1. Verify Bugster CLI is installed (check `setup.json` in `.claude/skills/browser-testing/`)
2. Verify API key is configured in `~/.bugsterrc` (check `setup.json`)
3. **Check if `.bugster` directory exists in the project root**
4. **If `.bugster` directory does NOT exist:**
   - Collect application URL from user
   - Ask if login page exists and collect credentials if needed
   - Run non-interactive `bugster init` with all required flags

Without the `.bugster` directory, `generate` and `run` commands will fail.

---

## CLI Command Reference

### init

Initialize Bugster in your project. **Must be run before any other Bugster commands.**

**Usage (Non-Interactive - Recommended for Claude Code)**

```bash
# With login credentials:
bugster init --api-key="<api_key>" --url="<url>" --user="<user>" --password="<password>"

# Without login credentials (no login page):
bugster init --api-key="<api_key>" --url="<url>" --no-credentials
```

**Parameters**:

- `--api-key <string>` (required): Bugster API key (from ~/.bugsterrc or user input)
- `--url <string>` (required): Application URL where the app is running (e.g., http://localhost:3000)
- `--user <string>` (optional): Username/email for login (if application has login page)
- `--password <string>` (optional): Password for login (if application has login page)

**When to use**:

- When `.bugster` directory does not exist in project root
- When setting up Bugster for the first time in a project
- When reconfiguring Bugster settings

**What it does**:

- Creates `.bugster/` directory structure
- Configures project with API key, URL, and optional login credentials
- Sets up project-specific test configurations
- Creates necessary files for test generation and execution

**Workflow for Non-Interactive Initialization**:

1. **Check if API key exists** in `~/.bugsterrc`
   - If missing, ask user to provide their API key
2. **Collect from user**:

   - Application URL (e.g., http://localhost:3000)
   - Does application have login page? (yes/no)
   - If yes: username and password

3. **Run non-interactive init**:

```bash
# Extract API key from ~/.bugsterrc and run with credentials:
bugster init --api-key="$(cat ~/.bugsterrc | grep apiKey | cut -d'"' -f4)" --url="http://localhost:3000" --user="test@example.com" --password="password123"

# Or without login:
bugster init --api-key="$(cat ~/.bugsterrc | grep apiKey | cut -d'"' -f4)" --url="http://localhost:3000" --no-credentials
```

**This non-interactive approach ensures fast execution without manual prompts, ideal for automated workflows.**

---

### generate

Generate AI-powered test specifications by analyzing your codebase.

**Prerequisites**: `.bugster` directory must exist (run non-interactive `bugster init` with all required flags if missing)

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

**Prerequisites**: `.bugster` directory must exist (run non-interactive `bugster init` with all required flags if missing)

**Usage**

```bash
bugster run [options]
```

**CRITICAL: Before running `bugster run`, ALWAYS ask the user which type of test execution they want:**

**Three Execution Modes:**

1. **Run all test files** (default):

   - Executes all tests in `.bugster/tests/` directory
   - Command: `bugster run [options]`

2. **Run specific test file**:

   - Executes tests from a specific file
   - Ask user: "Please provide the path to the test file (e.g., .bugster/tests/login-test.json):"
   - Command: `bugster run --path <user_provided_path> [options]`

3. **Run custom prompt test** (instant test):
   - Executes a test from natural language description without generating specs
   - Ask user: "Please describe the test you want to run:"
   - Command: `bugster run "<user_provided_prompt>" [options]`

**Parameters**:

- `<text>` (string, optional): Run an instant test from natural language description (max 1000 characters)
- `--path <file>` (string, optional): Path to specific test file to run
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

# Run all tests with options
bugster run --headless --parallel 8

# Run specific test file
bugster run --path .bugster/tests/login-test.json

# Run specific test with browser option
bugster run --path .bugster/tests/checkout-test.json --browser firefox

# Run custom prompt test
bugster run "Test user login with valid credentials and verify dashboard loads"

# Run custom prompt with options
bugster run "Test checkout flow with valid payment" --headless

# Run limited number of tests
bugster run --limit 5
```

**Important Notes**:

- ALWAYS ask the user which execution mode they want before running
- When specifying a test file path, use the `--path` flag
- Without arguments, `bugster run` executes all tests in `.bugster/tests/` directory
- Custom prompts are useful for ad-hoc testing without generating specifications
- Screenshots and videos are saved in the test output directory
