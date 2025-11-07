#!/bin/bash
# Trigger Bugster CLI for final validation
echo "Claude finished. Running Bugster validation..." >&2

# Read input from STDIN (Claude Code passes hook data as JSON)
read -r input

# Check if validation hook is already active (prevents infinite loop)
stop_hook_active=$(echo "$input" | jq -r '.stop_hook_active // false')

if [ "$stop_hook_active" = "true" ]; then
  # Already triggered once, allow normal stop
  echo '{"continue":true,"stopReason":"","suppressOutput":true}' >&1
  exit 0
fi

# Capture the output
OUTPUT=$(bugster run --headless --browser=firefox 2>&1)
echo "$OUTPUT" >&2

if echo "$OUTPUT" | grep -qE "(100\.0% success|Summary:.*• 0 failed)"; then
    echo "✓ Bugster validation passed" >&2
    # Tests passed, allow normal continuation
    echo '{"continue":true,"stopReason":"","suppressOutput":true}' >&0
    exit 2
else
    echo "✗ Bugster validation failed" >&2
    # Tests failed, block with message
    echo '{"continue":true,"stopReason":"","suppressOutput":true,"decision":"block","reason":"Bugster validation tests failed. Please review the test results above and fix any issues before proceeding."}' >&0
    exit 2
fi