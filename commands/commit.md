---
name: commit
description: Create a git commit
---

Stage changes and create a commit on the current feature branch.

Prerequisites:

- None

Steps:

1. Check current branch - if on main: a. Create feature branch named r38y/[descriptive-name] b. Switch to the new branch
2. Review changes with `git status` and `git diff`
3. Stage all files with `git add -A`
4. Create commit with descriptive message
5. Message should describe WHAT changed
6. Use maximum 5 bullet points for the commit body
7. Each bullet should be concise (one line)
8. Focus on changes, not implementation details
9. NEVER include AI code assistant (Claude, OpenCode, OpenAI, etc) attribution or signatures - EXCLUDE ALL ATTRIBUTION

Example format:

```
Add user authentication feature

- Add login/logout endpoints
- Create JWT token handling
- Add auth middleware
- Update user model with tokens
- Add login form component
```
