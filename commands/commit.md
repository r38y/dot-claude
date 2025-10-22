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

1. Fetch latest main: `git fetch origin main`
2. Check current branch using `git branch --show-current`:
   - **NEVER commit directly to main unless user explicitly says "don't create a branch" or "commit on main"**
   - If on main without explicit permission: `git checkout -b r38y/[descriptive-name]`
   - If user says "don't create a branch": stay on current branch (even if main)
3. Review changes: `git status` and `git diff`
4. Stage all files: `git add -A`
5. Create commit: `git commit -m "title\n\n- bullet 1\n- bullet 2..."`

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
