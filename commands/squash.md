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
2. Fetch latest main: `git fetch origin main`
3. Review all commits: `git log main..HEAD --oneline`
4. Reset to main: `git reset --soft main`
5. Run `/commit` to create squashed commit(s) based on $ARGUMENTS
6. Force push: `git push --force-with-lease`
7. Check if PR exists: `gh pr view --json url,body`
8. If PR exists:
   - Analyze changes: `git log main..HEAD` and `git diff main...HEAD`
   - Generate new title and body following PR guidelines (max 5 bullets, one-line each, focus on WHAT changed)
   - Preserve any existing "Closes #[number]" references from old body
   - Update PR: `gh pr edit --title "..." --body "..."`

**PR Guidelines:**

- Maximum 5 bullet points in the summary
- Each bullet should be one line
- Focus on WHAT changed, not HOW
- Never include test plans
- Be concise and high-level

**Example GOOD PR body:**

```
- Add user authentication with JWT tokens
- Implement login/logout endpoints
- Add auth middleware for protected routes
- Create login UI components
- Update user model for token storage

Closes #123
```

**Example BAD PR body:**

```
## Summary

- First added some column
- Then reverted adding some column
- Resulting in no net change with that column

Some AI credit line
```
