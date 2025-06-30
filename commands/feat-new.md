---
name: feat-new
description: Create a new feature branch with worktree
parameters:
  - name: branch_name
    description: Name of the branch to create
    required: true
---

Create a new feature branch with the specified name and set up a worktree in `./trees/`.

The command will:

1. Add "r38y/" prefix to branch name if it doesn't already have a prefix
2. Create `./trees` directory if it doesn't exist
3. Create a worktree in `./trees/branch_name` (with slashes replaced by hyphens) creating a new branch at the same time
4. Copy `.envrc` and `./.claude/settings.local.json` to the new worktree
5. Add worktree-specific settings to `.claude/settings.local.json` (branch name and worktree path)
6. For Rails applications (with Gemfile):
   - Run `bundle install` and `yarn install` in worktree
7. For Phoenix applications (with mix.exs):
   - Copy `./deps` and `./_build` to worktree
   - Run `mix setup` in worktree
8. Run `direnv allow` if direnv is available
9. Output a `cd` command to change to the new worktree directory

Usage: `/feat-new my-feature-branch`

The command will output a `cd` command that you can execute to switch to the new worktree.
