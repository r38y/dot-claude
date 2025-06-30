---
name: feat-clean
description: Clean up a feature branch and its worktree
parameters:
  - name: search_term
    description: Full or partial name of the branch or worktree to clean up
    required: true
---

Clean up a feature branch and its associated worktree in `./trees/`.

The command will:

1. Verify you're in the root project directory (parent of `trees/`) and on the default branch
2. Search for matching worktrees in `./trees/` directory
3. If multiple matches are found, prompt you to choose which one to delete
4. Check if the branch has been merged into the default branch
5. If not merged, prompt for confirmation before deleting
6. Remove the worktree directory
7. Delete the associated git branch
8. Run `git worktree prune` to clean up git's worktree references

Safety checks:

- Must be run from the root project directory (not from within a worktree)
- Must be on the default branch (main/master)
- Will warn if branch hasn't been merged
- Will confirm before deletion

Usage: `/feat-clean my-feature` or `/feat-clean r38y/my-feature-branch`
