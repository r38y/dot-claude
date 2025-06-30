Squash multiple commits on current branch into one

Usage: /pr-squash [optional: additional squashing instructions]

Purpose: Combine multiple commits into a single, well-formatted commit

Prerequisites:

- Must be on a feature branch (not main)
- Should have multiple commits to squash

Actions to perform:

1. Use TodoWrite to create and track progress through these steps
2. Verify current branch: `git branch --show-current`
   - If on main, create and switch to a new branch first
3. Delete any existing plan for this feature from ai_docs directory:
   - Get current branch name: `current_branch=$(git rev-parse --abbrev-ref HEAD)`
   - Remove r38y/ prefix if present: `feature_name=${current_branch#r38y/}`
   - Delete plan if exists: `rm -f ai_docs/${feature_name}.md`
4. Follow shared/quality-checks.md for pre-squash validation
5. Fetch latest main: `git fetch origin main`
6. Review all commits to be squashed:
   - `git log main..HEAD --oneline`
   - `git diff main...HEAD` to see all changes
   - Apply any additional squashing instructions provided by the user
7. Reorganize commits:
   - Create a temporary branch: `git checkout -b temp-squash`
   - Reset to main: `git reset --soft $(git merge-base HEAD main)`
   - Stage and commit all changes
8. Force push to original branch: `git push origin HEAD:$(git rev-parse --abbrev-ref HEAD@{1}) --force-with-lease`
9. Switch back to original branch: `git checkout -` and `git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)`
10. Clean up temporary branch: `git branch -D temp-squash`
11. Update the PR title and description based on the main changes

Commit format:

```
Title describing all changes

Optional details about the changes

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

Important notes:

- Use force-with-lease for safer force pushing
- After pushing the reorganized commits, run `gh pr checks --watch` to monitor PR checks
- If additional squashing instructions are provided, follow them to organize commits accordingly
