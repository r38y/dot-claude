---
name: squash
description: Squash commits on current branch
parameters:
  - name: instructions
    required: false
---

Squash commits on the current feature branch into organized commits.

Optional: Provide instructions for organizing commits (e.g., "keep auth changes separate")

Prerequisites:

- Must be on a feature branch (not main)
- Should have commits to squash

Steps:

1. Verify on feature branch
2. Review all commits: `git log main..HEAD --oneline`
3. Reset to main: `git reset --soft $(git merge-base HEAD main)`
4. Organize and commit changes based on instructions
5. Force push: `git push --force-with-lease`

Commit Guidelines:

- Use maximum 5 bullet points in commit messages
- Each bullet should be one line
- Focus on WHAT changed, not HOW
- If no instructions provided, creates one commit with all changes
- NEVER include AI code assistant (Claude, OpenCode, OpenAI, etc) attribution or signatures - EXCLUDE ALL ATTRIBUTION

Example squashed commit:

```
Refactor authentication system

- Replace session auth with JWT tokens
- Add refresh token rotation
- Update middleware for token validation
- Migrate existing user sessions
- Add token expiry handling
```
