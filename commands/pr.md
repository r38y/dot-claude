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
- Must be on a feature branch (not main)
- All changes should be committed

Steps:
1. Verify on feature branch
2. Check for existing PR to preserve issue references
3. Delete any ai_docs plan files from this branch
4. Run quality checks if available
5. Squash commits into one clean commit
6. Push to origin
7. Create PR with descriptive title and body
8. If issue URL provided, add "Closes #[number]"
9. Monitor PR checks with `gh pr checks --watch`

PR format focuses on WHAT changed, not HOW.
Never include test plans.