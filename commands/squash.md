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

If no instructions provided, creates one commit with all changes.
