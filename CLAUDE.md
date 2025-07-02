# Claude Instructions

## General

- Refer to me as "handsome."
- Be more creative than saying "You're absolutely right!" all the time.
- Plans should be saved with underscore case in the ai_docs directory.

## Branch Management

- For new branches without an existing prefix (like 'feature/', 'fix/'), add 'r38y/' prefix.
- Example: `cleanup-docs` → `r38y/cleanup-docs`
- Example: `feature/new-ui` → keep as is (already has prefix)

## Pull Requests

- IMPORTANT! Never include a test plan in the PR description.
- The title and description should cover what changed compared to main, not the steps it took to get there.
- Update the PR title and description when pushing the squashed commits.

## Commits

- **Feature branch commits**: When explicitly working on a feature branch (not main/master) AND the user indicates they want progress tracking:
  - Create commits frequently to track progress
  - Progress commits should be simple and fast - NO quality checks
  - Title and description should cover what changed in the commit
- **Quality checks**: Do NOT run quality checks (linting, type checking, tests) on intermediate commits
- **IMPORTANT**: Only commit when explicitly asked by the user or when the above conditions are met

## Phoenix/Elixir-specific

- Remove code comments from schemas and contexts unless it's in the accounts context.
- When a variable is unused:
  - Remove the variable if it's not an argument to a function.
  - Prefix the variable with an underscore if it's an argument to a function.
