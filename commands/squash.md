---
description: Squash commits on current branch
model: claude-sonnet-4-5-20250929
argument-hint: '[optional instructions for organizing commits]'
allowed-tools: [Bash, SlashCommand]
---

Squash commits on the current feature branch into organized commits.

**Prerequisites:**

- Must be on a feature branch (not main)
- Should have commits to squash

**Arguments:**

- Optional instructions for organizing commits (e.g., "keep auth changes separate")

**Process:**

1. Verify on feature branch using `git branch --show-current`
2. Fetch latest main: `git fetch origin main:main`
3. Review all commits: `git log main..HEAD --oneline`
4. Reset to main: `git reset --soft main`
5. Run `/commit` to create squashed commit(s) based on $ARGUMENTS
6. Force push: `git push --force-with-lease`
