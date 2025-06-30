Create a git commit with proper formatting

Purpose: Stage changes and create a well-formatted commit following user preferences

Prerequisites:

- You must be on a feature branch (not main)
- Separate commits for Claude config changes vs other code changes

Actions to perform:

1. Follow shared/todo-management.md patterns for task tracking
2. Follow shared/branch-management.md to verify on feature branch
3. Follow shared/quality-checks.md for pre-commit validation
4. Follow shared/git-operations.md "Reviewing Changes" section
5. Stage all files with `git add -A`
6. Create commit following shared/commit-format.md with:
   - Title that describes WHAT changed (not HOW you changed it)
   - Body with details if needed
   - Claude attribution footer
7. Use HEREDOC format from shared/git-operations.md

Commit message format:

```
Title describing the change

Optional body with more details

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

Important: Keep Claude config changes (CLAUDE.md, .claude/, command files) in separate commits
