---
name: quality
description: Run quality checks for the current project
---

Execute project-specific linting, type checking, and tests.

Steps:

1. Identify project type and available commands
2. Check for quality commands in package.json, Makefile, etc.
3. Run checks in order: lint → typecheck → tests
4. Fix any issues found
5. Re-run ALL checks after fixes
6. Repeat until all pass
7. If changes were made, commit with "Fix quality check issues"

Always check project CLAUDE.md for custom quality commands. Do NOT run quality checks during the commit itself.
