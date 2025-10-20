---
description: Create a git commit and push to remote
model: claude-sonnet-4-5-20250929
argument-hint: '[optional: arguments to pass to /commit command]'
allowed-tools: [Bash, SlashCommand]
---

Create a commit using the /commit command and push to remote.

**Arguments:**

- Optional arguments to pass to /commit (e.g., "don't create a branch")

**Process:**

1. Check if there are changes with `git status`
2. If there are changes: Run `/commit $ARGUMENTS` to create a commit
3. Push to remote: `git push` or `git push -u origin HEAD` if branch not tracking remote
