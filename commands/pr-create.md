Create a pull request for the current branch

Usage: /pr-create [optional: additional squashing instructions or GitHub issue URL]

Purpose: Prepare branch and create a GitHub pull request with proper formatting

Optional argument:

- Additional instructions for how to split/organize commits (e.g., "keep auth changes separate", "split frontend and backend changes")
- GitHub issue URL (e.g., "https://github.com/owner/repo/issues/123") - will add "Closes #123" to PR body

Prerequisites:

- Must be on a feature branch (not main)
- Branch name should have r38y/ prefix
- All changes should be committed

Actions to perform:

1. Follow shared/todo-management.md patterns for task tracking
2. Follow shared/branch-management.md to verify on feature branch
3. Delete any existing plan for this feature from ai_docs directory:
   - Get current branch name: `current_branch=$(git rev-parse --abbrev-ref HEAD)`
   - Remove r38y/ prefix if present: `feature_name=${current_branch#r38y/}`
   - Delete plan if exists: `rm -f ai_docs/${feature_name}.md`
4. Follow shared/quality-checks.md for pre-PR validation
5. Run `git fetch origin main` to get latest main branch
6. Review all commits since diverging from main using shared/git-operations.md:
   - `git log main..HEAD --oneline`
   - `git diff main...HEAD`
   - Apply any additional squashing instructions provided by the user
   - If splitting instructions are provided, organize commits accordingly
7. Follow shared/commit-organization.md for organizing commits:
   - Create a temporary branch: `git checkout -b temp-pr-create`
   - Reset to main: `git reset --soft $(git merge-base HEAD main)`
   - If additional splitting instructions provided:
     - Follow the user's instructions to organize commits
     - Create multiple commits as specified
     - Otherwise, create one commit for all non-Claude changes
8. For each commit being created:
   - Use descriptive commit messages that summarize the changes
9. Force push to original branch: `git push origin HEAD:$(git rev-parse --abbrev-ref HEAD@{1}) --force-with-lease`
10. Switch back to original branch: `git checkout -` and `git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)`
11. Clean up temporary branch: `git branch -D temp-pr-create`
12. If a GitHub issue URL was provided:
    - Extract issue number from URL (e.g., from "https://github.com/owner/repo/issues/123" extract "123")
    - Add "Closes #123" line to PR body
13. Create PR following shared/pr-management.md patterns with HEREDOC for body

Pull request format:

```
gh pr create --title "Clear description of changes" --body "$(cat <<'EOF'
One sentence summary of what changed compared to main

- First key change
- Second key change
- Third key change
- Additional changes as needed

[If GitHub issue URL provided: Closes #123]

🤖 Generated with [Claude Code](https://claude.ai/code)
EOF
)"
```

Important notes:

- NEVER include a test plan section
- Focus on WHAT changed, not HOW you implemented it
- Return the PR URL after creation
- After creating the PR, run `gh pr checks --watch` to monitor PR checks and notify when they're done
- If additional squashing instructions are provided, follow them to organize commits accordingly
- The optional argument allows flexible commit organization (e.g., "keep database migrations separate" or "split by feature area")
- If a GitHub issue URL is provided, extract the issue number and add "Closes #<number>" to the PR body
