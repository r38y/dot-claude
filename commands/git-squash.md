Squash commits on current branch with optional splitting instructions

Usage: /git-squash [optional: additional squashing instructions]

Purpose: Organize and squash commits on the current branch based on instructions

Optional argument:

- Additional instructions for how to split/organize commits (e.g., "keep auth changes separate", "split frontend and backend changes")
- If no instructions provided, squashes all commits into one

Prerequisites:

- Must be on a feature branch (not main)
- Should have at least one commit to squash

Actions to perform:

1. Follow shared/todo-management.md patterns for task tracking
2. Follow shared/branch-management.md to verify on feature branch
3. Fetch latest main: `git fetch origin main`
4. Review all commits and changes using shared/git-operations.md:
   - `git log main..HEAD --oneline`
   - `git diff main...HEAD` to see all changes
   - Apply any additional squashing instructions provided by the user
5. Reset to main while keeping changes: `git reset --soft $(git merge-base HEAD main)`
6. Follow shared/commit-organization.md to organize commits:
   - If additional splitting instructions provided:
     - Follow user's instructions to organize commits
     - Create multiple commits as specified
   - Otherwise, create one commit for all non-Claude changes
7. For each commit being created:
   - Use descriptive commit messages that summarize the changes
   - Follow shared/commit-format.md for message structure
   - Use HEREDOC format from shared/git-operations.md

Commit message format:

```
Title describing all changes combined

Optional body summarizing key changes

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

Important notes:

- Without optional arguments, this squashes ALL commits on the branch into one
- With splitting instructions, organizes commits as specified with descriptive commit messages
- No force push is performed automatically (user can push when ready)
