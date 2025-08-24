---
name: pr
description: Create or update a pull request
parameters:
  - name: issue_url
    required: false
---

Create a pull request for the current branch.

Optional: Provide a GitHub issue URL to link (adds "Closes #123")

Prerequisites:

- All changes should be committed

Steps:

1. Check current branch - if on main: a. Create feature branch named r38y/[descriptive-name] b. Switch to the new branch
2. Check for existing PR to preserve issue references
3. IMPORTANT: For maximum efficiency run independent quality checks (tests, lint, typecheck) simultaneously in a subagent to improve performance
4. Squash commits into one clean commit
5. Push to origin
6. Create PR with descriptive title and body
7. If issue URL provided, add "Closes #[number]"
8. Monitor PR checks with `gh pr checks --watch`

PR Guidelines:

- Use maximum 5 bullet points in the summary
- Each bullet should be one line
- Focus on WHAT changed, not HOW
- Never include test plans
- Be concise and high-level
- NEVER include AI code assistant (Claude, OpenCode, OpenAI, etc) attribution or signatures - EXCLUDE ALL ATTRIBUTION

Example PR body:

```
- Add user authentication with JWT tokens
- Implement login/logout endpoints
- Add auth middleware for protected routes
- Create login UI components
- Update user model for token storage

Closes #123
```
