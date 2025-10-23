---
description: Create or update a pull request
model: claude-sonnet-4-5-20250929
argument-hint: '[optional GitHub issue URL to link]'
allowed-tools: [Bash, Task, SlashCommand]
---

Create a pull request for the current branch.

**Arguments:**

- Optional GitHub issue URL to link (adds "Closes #123")

**Prerequisites:**

- All changes should be committed

**Process:**

1. Check current branch using `git branch --show-current` - if on main:
   - `git checkout -b r38y/[descriptive-name]`
2. Check for existing PR: `gh pr view --json body 2>/dev/null` to preserve issue references (suppress error if no PR exists)
3. Run quality checks (tests, lint, typecheck, format) simultaneously using Task agent for efficiency
4. Check commit count with `git log main..HEAD --oneline | wc -l`:
   - If more than 1 commit: run `/squash` to squash and push
   - If 1 commit: push with `git push -u origin HEAD` or `git push` if already tracking
5. Create PR: `gh pr create --title "..." --body "..."`
6. If issue URL provided, add "Closes #[number]" to body

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
