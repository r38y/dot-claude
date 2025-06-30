# Shared Quality Check Instructions

## When to Run Quality Checks

- Only when explicitly using /quality command
- Before creating final PR commits
- Never on intermediate/progress commits
- Never during commit creation itself

## Quality Check Order

1. Formatting/linting checks first
2. Type checking (if applicable)
3. Unit tests
4. Integration tests (if separate)

## Handling Failures

- Fix issues and re-run ALL checks
- Repeat until all checks pass
- Only then create a commit
- Do NOT run checks again during the commit
