---
name: push
description: Create a git commit and push to remote
---

Stage changes, create a commit (if needed), and push to remote on the current feature branch.

Prerequisites:

- Must be on a feature branch (not main)

Steps:

1. Verify on feature branch
2. Review changes with `git status`
3. If there are changes:
   - Stage all files with `git add -A`
   - Create commit with descriptive message
4. Push to remote with `git push`

Commit Guidelines:

- Use maximum 5 bullet points for the commit body
- Keep each point to one line
- Focus on WHAT changed, not implementation details
- If no changes to commit, just push existing commits

Example commit:

```
Add error handling to API endpoints

- Add try-catch blocks to all routes
- Create error response formatter
- Log errors with request context
- Return appropriate HTTP status codes
- Add client-friendly error messages
```
