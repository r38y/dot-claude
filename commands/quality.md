---
name: quality
description: Run quality checks for the current project
---

Purpose: Execute project-specific linting, type checking, formatting, and tests

Prerequisites:

- Should be in a project directory with quality check commands configured

Actions to perform:

1. Follow @shared/todo-management.md patterns for task tracking
2. Follow @shared/quality-checks.md to:
   - Identify project type and available commands
   - Determine quality check order
   - Run checks systematically
3. If any checks fail:
   - Fix the issues found
   - Re-run ALL quality checks
   - Repeat until all checks pass
4. Once all checks pass and changes were made:
   - Create a simple commit: "Fix quality check issues"
   - Do NOT run quality checks again during commit

Important notes:

- Always check project-specific CLAUDE.md for custom quality check commands
- Keep running checks and fixing issues until ALL checks pass
- Create a single commit after all checks pass
- Do NOT run quality checks during the commit itself
- If no quality check commands are found, inform the user and suggest common options
