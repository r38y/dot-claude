---
name: commit
description: Create a git commit
---

Stage changes and create a commit on the current feature branch.

Prerequisites:
- None

Steps:
1. Check current branch - if on main:
   a. Create feature branch named r38y/[descriptive-name]
   b. Switch to the new branch
2. Review changes with `git status` and `git diff`
3. Stage all files with `git add -A`
4. Create commit with descriptive message
5. Message should describe WHAT changed

The commit message focuses on the changes made, not implementation details.