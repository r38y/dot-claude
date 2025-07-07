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
3. Check for existing PR and preserve issue relationships:
   - Run `gh pr list --head $(git rev-parse --abbrev-ref HEAD) --json number,body`
   - If PR exists, extract any "Closes #" references from the body
4. Delete any markdown files added to the ai_docs directory in this branch
5. Follow @shared/quality-checks.md for pre-squash validation
6. Fetch latest main: `git fetch origin main`
7. Review all commits to be squashed:
   - `git log main..HEAD --oneline`
   - `git diff main...HEAD` to see all changes
   - Apply any additional squashing instructions provided by the user
8. Reorganize commits:
   - Create a temporary branch: `git checkout -b temp-squash`
   - Reset to main: `git reset --soft $(git merge-base HEAD main)`
   - Stage and commit all changes
9. Force push to original branch: `git push origin HEAD:$(git rev-parse --abbrev-ref HEAD@{1}) --force-with-lease`
10. Switch back to original branch: `git checkout -` and `git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)`
11. Clean up temporary branch: `git branch -D temp-squash`
12. Update the PR title and description:
    - Use `gh pr edit` to update the existing PR
    - ALWAYS preserve any "Closes #" references from the original PR body
    - Include the preserved issue reference in the updated description

Commit format:

```
Title describing all changes

Optional details about the changes
```

Important notes:

- Use force-with-lease for safer force pushing
- After pushing the reorganized commits, run `gh pr checks --watch` to monitor PR checks
- If additional squashing instructions are provided, follow them to organize commits accordingly
- ALWAYS preserve "Closes #" references when updating PR descriptions
- This ensures issues are properly closed when the PR is merged
- Use `gh pr edit` with appropriate title and body that includes any existing issue references
