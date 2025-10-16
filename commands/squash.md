---
description: Squash commits on current branch
model: claude-haiku-4-5-20251001
argument-hint: '[optional instructions for organizing commits]'
allowed-tools: [Bash, Read, Edit]
---

Squash commits on the current feature branch into organized commits.

**Prerequisites:**

- Must be on a feature branch (not main)
- Should have commits to squash

**Arguments:**

- Optional instructions for organizing commits (e.g., "keep auth changes separate")

**Process:**

1. Verify on feature branch using `git branch --show-current`
2. Review all commits: `git log main..HEAD --oneline`
3. Reset to main: `git reset --soft $(git merge-base HEAD main)`
4. Organize and commit changes based on $ARGUMENTS
5. Force push: `git push --force-with-lease`

**Commit Guidelines:**

- Maximum 5 bullet points in commit messages
- Each bullet should be one line
- Focus on WHAT changed, not HOW
- If no instructions provided, creates one commit with all changes

**Example squashed commit:**

```
Refactor authentication system

- Replace session auth with JWT tokens
- Add refresh token rotation
- Update middleware for token validation
- Migrate existing user sessions
- Add token expiry handling
```
