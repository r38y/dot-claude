---
description: Create or update a pull request
model: claude-3-5-haiku-latest
argument-hint: '[optional GitHub issue URL to link]'
allowed-tools: [Bash, Task]
---

Create a pull request for the current branch.

**Arguments:**

- Optional GitHub issue URL to link (adds "Closes #123")

**Prerequisites:**

- All changes should be committed

**Process:**

1. Check current branch - if on main:
   - Create feature branch named r38y/[descriptive-name]
   - Switch to the new branch
2. Check for existing PR to preserve issue references
3. Run quality checks (tests, lint, typecheck, format) simultaneously using Task agent for efficiency
4. Squash commits into one clean commit
5. Push to origin
6. Create PR with descriptive title and body
7. If issue URL provided, add "Closes #[number]"

**PR Guidelines:**

- Maximum 5 bullet points in the summary
- Each bullet should be one line
- Focus on WHAT changed, not HOW
- Never include test plans
- Be concise and high-level

**Example PR body:**

```
- Add user authentication with JWT tokens
- Implement login/logout endpoints
- Add auth middleware for protected routes
- Create login UI components
- Update user model for token storage

Closes #123
```
