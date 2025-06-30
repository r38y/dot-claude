Merge an existing pull request after final preparations

Purpose: Prepare PR for merging and merge it into main branch

Prerequisites:

- Must have an open PR for the current branch
- All PR reviews should be addressed
- CI checks should be passing or ready to pass

Actions to perform:

1. Use TodoWrite to create and track progress through these steps
2. Pull latest main: `git pull origin main`
3. Rebase or merge main into current branch if needed
4. Review all commits:
   - `git log main..HEAD --oneline`
5. Reorganize commits:
   - Create a temporary branch: `git checkout -b temp-pr-merge`
   - Reset to main: `git reset --soft $(git merge-base HEAD main)`
   - Stage and commit all changes
6. Force push to original branch: `git push origin HEAD:$(git rev-parse --abbrev-ref HEAD@{1}) --force-with-lease`
7. Switch back to original branch: `git checkout -` and `git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)`
8. Clean up temporary branch: `git branch -D temp-pr-merge`
9. Update PR title and description using `gh pr edit`:
   - Title should describe the changes
   - Description should follow the template below
10. Wait for all GitHub checks to complete: `gh pr checks --watch`
11. Merge the PR: `gh pr merge --merge --delete-branch`

PR description update format:

```
gh pr edit --body "$(cat <<'EOF'
One sentence summary of what changed compared to main

- First key change
- Second key change
- Third key change
- Additional changes as needed

## Additional Notes
- Any relevant implementation details
- Known limitations or future improvements

🤖 Generated with [Claude Code](https://claude.ai/code)
EOF
)"
```

Important notes:

- Use --merge flag (not squash) since we already squashed
- Delete branch after merging
- Ensure PR description matches final commit
