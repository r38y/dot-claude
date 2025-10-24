---
description: Run quality checks for the current project
model: claude-sonnet-4-5-20250929
argument-hint: "[optional: 'entire codebase' to check all files]"
allowed-tools: [Bash, Read, Task, Grep, Glob]
---

Execute project-specific linting, type checking, and tests.

**Scope:**

- **Default**: Only files changed between current branch and main (`git diff main...HEAD`)
- **With "entire codebase"**: Run quality checks on all project files

**Process:**

1. Identify project type and available commands
2. Check for quality commands in package.json, Makefile, CLAUDE.md, etc.
3. If no arguments or not "entire codebase", get changed files: `git diff --name-only main...HEAD`
4. If "entire codebase" in $ARGUMENTS, run checks on all applicable files
5. Run independent quality checks (tests, lint, typecheck) simultaneously using Task agent for maximum efficiency
6. Fix any issues found in the identified scope
7. Re-run ALL checks after fixes
8. Repeat until all pass
9. If changes were made, commit with "Fix quality check issues"

**Important:**

- Always check project CLAUDE.md for custom quality commands
- Do NOT run quality checks during the commit process itself
- Use parallel execution for better performance
- Focus on changed files by default for faster feedback
