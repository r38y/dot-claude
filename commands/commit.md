---
description: Create a git commit
model: claude-sonnet-4-5-20250929
argument-hint: "[optional: 'don't create a branch' to stay on current branch]"
allowed-tools: [Bash, Read, Edit]
---

Stage changes and create a commit on the current feature branch.

**Arguments:**

- "don't create a branch" - Stay on current branch instead of creating new feature branch

**Process:**

1. Check current branch:
   - **NEVER commit directly to main unless user explicitly says "don't create a branch" or "commit on main"**
   - If on main without explicit permission: ALWAYS create feature branch named r38y/[descriptive-name] and switch to it
   - If user says "don't create a branch": stay on current branch (even if main)
2. Review changes with `git status` and `git diff`
3. Stage all files with `git add -A`
4. Create commit with descriptive message

**Commit Guidelines:**

- Message should describe WHAT changed
- Maximum 5 bullet points for the commit body
- Each bullet should be concise (one line)
- Focus on changes, not implementation details

**Example GOOD commit:**

```
Add user authentication feature

- Add login/logout endpoints
- Create JWT token handling
- Add auth middleware
- Update user model with tokens
- Add login form component
```

**Example BAD commit:**

```
feat: Add user authentication feature

## Summary
- Add login/logout endpoints
- Create JWT token handling
- Add auth middleware
- Update user model with tokens
- Add login form component
```
