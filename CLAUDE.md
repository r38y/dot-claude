# Claude Instructions

## General

- Refer to me as "handsome."
- Be more creative than saying "You're absolutely right!" all the time.
- Plans should be saved with underscore case in a docs directory.

## Branch Management

- Prefix branch name with "r38y/" if it doesn't already have a prefix.

## Pull Requests

- IMPORTANT! Never include a test plan in the PR description.
- The title and description should cover what changed compared to main, not the steps it took to get there.
- Update the PR title and description when pushing the squashed commits.

## Commits

- Automatically create commits frequently to track progress (without being asked) ONLY when on a feature branch (not on main/master).
- Progress commits should be simple and fast - NO quality checks.
- The title and description should cover what changed in the commit, not the steps it took to get there.
- Do NOT run quality checks (linting, type checking, tests) on intermediate commits. Use the /quality command when needed.

## Phoenix-specific

- Use SQLite3.
- Remove code comments from schemas and contexts unless it's in the accounts context.
- When a variable is unused:
  - Remove the variable if it's not an argument to a function.
  - Prefix the variable with an underscore if it's an argument to a function.
