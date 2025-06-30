# PR Management

## Creating Pull Requests

### Basic PR Creation

```bash
gh pr create --title "Clear description of changes" --body "$(cat <<'EOF'
One sentence summary of what changed compared to main

- First key change
- Second key change
- Third key change

🤖 Generated with [Claude Code](https://claude.ai/code)
EOF
)"
```

### PR Description Guidelines

1. **Title**: Clear, concise description of WHAT changed
2. **Summary**: One sentence overview comparing to main branch
3. **Changes**: Bullet points of significant modifications (no heading)
4. **No Test Plan**: Never include test plan sections

## PR Operations

### Monitor PR Checks

```bash
gh pr checks --watch
```

### Get PR Status

```bash
gh pr status
```

### View PR Details

```bash
gh pr view
```

### List PR Comments

```bash
gh api repos/{owner}/{repo}/pulls/{number}/comments
```

## Common Patterns

### Get Base Branch

```bash
base_branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@' 2>/dev/null || echo "main")
```

### Ensure Branch is Pushed

```bash
if ! git ls-remote --heads origin "$(git branch --show-current)" | grep -q .; then
    git push -u origin "$(git branch --show-current)"
fi
```

### Update PR After Changes

```bash
# After squashing/reorganizing commits
gh pr edit --title "Updated title" --body "$(cat <<'EOF'
Updated description...
EOF
)"
```

## PR Workflow Best Practices

1. Always fetch latest main before creating PR
2. Review all changes since diverging from base branch
3. Ensure commits are well-organized before PR creation
4. Monitor PR checks after creation
5. Return PR URL to user for easy access
