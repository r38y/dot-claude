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

If no changes to commit, just push existing commits to remote.
The commit message focuses on the changes made, not implementation details.