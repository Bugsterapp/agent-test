# Browser Testing Examples

This document provides detailed examples of common browser testing tasks using the Bugster CLI tool.

## Example 1: Generate and Run Complete Test Suite

**User request**: "Generate tests for my entire application and run them"

**Workflow**:

1. **Generate** test specifications for all pages:

   ```bash
   bugster generate
   ```

2. **Run** all generated tests:

   ```bash
   bugster run
   ```

3. Review test results, screenshots, and videos in the output directory.

**Expected result**: Comprehensive test suite covering all identified user flows and edge cases.

---

## Example 2: Quick Ad-hoc Test Without Generating Specs

**User request**: "I need to quickly verify that users can login and see their dashboard"

**Workflow**:

1. **Run** instant test with natural language prompt:
   ```bash
   bugster run --prompt "Navigate to the login page, fill in credentials with valid user data, submit the form, and verify the dashboard loads successfully"
   ```

**Expected result**: Immediate test execution with pass/fail status, screenshots, and detailed logs without needing to generate test specifications first.

---

## Example 3: Generate Focused Tests for Critical Pages

**User request**: "Generate comprehensive tests for the checkout and payment pages focusing on error handling"

**Workflow**:

1. **Generate** tests for specific pages with custom prompt:

   ```bash
   bugster generate --page "pages/checkout.tsx,pages/payment.tsx" --count 15 --prompt "Focus on edge cases, error handling, payment validation, and security"
   ```

2. **Run** the generated tests:
   ```bash
   bugster run
   ```

**Expected result**: 15 test scenarios per page focusing on error handling and edge cases.

---

## Example 4: Run Tests in CI/CD Pipeline

**User request**: "Execute all tests in headless mode for continuous integration"

**Workflow**:

1. **Run** tests with CI/CD optimized settings:
   ```bash
   bugster run --headless --parallel 8
   ```

**Expected result**: Fast, headless test execution with parallel processing suitable for automated CI/CD pipelines.

---

## Example 5: Debug Specific Test Failure

**User request**: "One of my checkout tests is failing, I need to debug it"

**Workflow**:

1. **Run** specific test with browser visible:

   ```bash
   bugster run --path .bugster/tests/checkout-test.json --limit 1
   ```

2. **Review** the browser actions in real-time to identify the issue.

3. **Regenerate** tests after fixing the issue:

   ```bash
   bugster generate --page "pages/checkout.tsx" --count 10
   ```

4. **Verify** the fix:
   ```bash
   bugster run --path .bugster/tests/checkout-test.json
   ```

**Expected result**: Visual debugging of test execution to identify and resolve issues.

---

## Example 6: Generate High-Volume Test Scenarios

**User request**: "Create extensive test coverage for our product catalog page"

**Workflow**:

1. **Generate** maximum test scenarios:

   ```bash
   bugster generate --page "pages/products.tsx" --count 30 --prompt "Include filters, sorting, search functionality, pagination, product details, add to cart, and wishlist features"
   ```

2. **Run** with controlled parallelism:
   ```bash
   bugster run --parallel 5
   ```

**Expected result**: 30 comprehensive test scenarios covering all product catalog functionality.

---

## Example 7: Test User Registration Flow

**User request**: "Verify the complete user registration process works correctly"

**Workflow**:

1. **Run** instant test for registration:

   ```bash
   bugster run --prompt "Test user registration by filling out the signup form with valid data including email, password, confirm password, and acceptance of terms, then verify email confirmation message appears"
   ```

2. **Alternative**: Generate dedicated registration tests:

   ```bash
   bugster generate --page "pages/signup.tsx" --count 10 --prompt "Test both successful registration and validation errors for invalid inputs"
   ```

3. **Run** the generated tests:
   ```bash
   bugster run
   ```

**Expected result**: Comprehensive validation of registration flow including both success and error cases.

---

## Example 8: Cross-Browser Testing

**User request**: "Run my tests across different browsers to ensure compatibility"

**Workflow**:

1. **Run** tests with Chromium:

   ```bash
   bugster run --browser chromium --headless
   ```

2. **Run** tests with Firefox:

   ```bash
   bugster run --browser firefox --headless
   ```

3. **Run** tests with WebKit:
   ```bash
   bugster run --browser webkit --headless
   ```

**Expected result**: Test results across multiple browser engines to verify cross-browser compatibility.

---

## Example 9: Test E-commerce Shopping Flow

**User request**: "Generate and run tests for the complete shopping experience from browsing to checkout"

**Workflow**:

1. **Generate** tests for shopping flow pages:

   ```bash
   bugster generate --page "pages/products.tsx,pages/product-detail.tsx,pages/cart.tsx,pages/checkout.tsx" --count 12 --prompt "Test complete user journey: browsing products, viewing details, adding to cart, updating quantities, and completing checkout"
   ```

2. **Run** tests with limited concurrency to simulate real user behavior:
   ```bash
   bugster run --parallel 3
   ```

**Expected result**: End-to-end validation of the complete shopping flow across multiple pages.

---

## Example 10: Quick Smoke Test Before Deployment

**User request**: "Run a quick validation of critical functionality before deploying"

**Workflow**:

1. **Run** limited number of most critical tests:
   ```bash
   bugster run --limit 10 --headless --parallel 5
   ```

**Expected result**: Fast execution of top 10 tests to validate critical functionality before deployment.

---

## Example 11: Iterative Test Development

**User request**: "I've updated my authentication flow, need to update and rerun tests"

**Workflow**:

1. **Regenerate** tests for updated pages:

   ```bash
   bugster generate --page "pages/login.tsx,pages/reset-password.tsx" --count 8
   ```

2. **Run** the updated tests:

   ```bash
   bugster run --limit 16
   ```

3. If tests pass, **run** complete suite:
   ```bash
   bugster run --headless
   ```

**Expected result**: Updated test coverage that reflects recent code changes with validation of new functionality.

---

## Example 12: Test Form Validation Extensively

**User request**: "Verify all form validation on the contact form works properly"

**Workflow**:

1. **Generate** validation-focused tests:

   ```bash
   bugster generate --page "pages/contact.tsx" --count 15 --prompt "Focus extensively on form validation: required fields, email format, phone format, character limits, special characters, SQL injection attempts, XSS attempts, and successful submission"
   ```

2. **Run** validation tests:
   ```bash
   bugster run
   ```

**Expected result**: Comprehensive form validation testing including security considerations.

---

## Example 13: Test Responsive Design Behavior

**User request**: "Verify the mobile navigation menu works correctly"

**Workflow**:

1. **Run** instant test for mobile navigation:
   ```bash
   bugster run --prompt "Test mobile navigation by opening the hamburger menu, clicking through menu items, and verifying each section loads correctly on mobile viewport"
   ```

**Expected result**: Validation of responsive navigation behavior on mobile devices.

---

## Example 14: Performance Testing Scenario

**User request**: "Test if the search functionality handles rapid consecutive searches"

**Workflow**:

1. **Run** instant performance test:
   ```bash
   bugster run --prompt "Test search performance by executing multiple rapid searches in sequence: search for 'laptop', then immediately search for 'phone', then 'tablet', verify all results load correctly without errors or race conditions"
   ```

**Expected result**: Validation that the application handles rapid user interactions gracefully.

---

## Example 15: Multi-Step Checkout Validation

**User request**: "Generate tests covering every step of our 4-step checkout process"

**Workflow**:

1. **Generate** comprehensive checkout tests:

   ```bash
   bugster generate --page "pages/checkout.tsx" --count 20 --prompt "Test all 4 checkout steps: shipping information, payment details, order review, and confirmation. Include validation errors, back navigation between steps, and data persistence"
   ```

2. **Run** with visible browser to review:

   ```bash
   bugster run --limit 5
   ```

3. **Run** full suite in headless mode:
   ```bash
   bugster run --headless --parallel 4
   ```

**Expected result**: Thorough validation of complex multi-step checkout flow including edge cases.

---

## Tips for Success

- **Be specific with prompts**: "Test login with valid credentials and verify dashboard displays user profile data" is better than "test login". This is **extremely important** for accurate AI-powered test generation.

- **Use natural language descriptions**: Write prompts as if instructing a human tester about what to verify

- **Generate before running**: For comprehensive coverage, always use `bugster generate` first to create test specifications

- **Use instant tests for quick validation**: The `--prompt` option with `bugster run` is perfect for ad-hoc testing without generating specs

- **Leverage parallel execution**: Use `--parallel` to speed up test runs, especially in CI/CD pipelines

- **Test iteratively**: After code changes, regenerate tests for affected pages and run them before the full suite

- **Combine specific and broad testing**: Use `--page` for focused testing and full `generate` for comprehensive coverage

- **Review test outputs**: Always check screenshots, videos, and logs to understand test results

- **Use headless in CI/CD**: Always include `--headless` flag for automated pipeline execution

- **Start with fewer tests**: Use `--limit` to run a subset while debugging, then scale up to full suite
