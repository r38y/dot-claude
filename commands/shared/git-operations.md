# Git Operations

## Reviewing Changes

### Standard Review Commands

Always run these commands in parallel using multiple Bash tool calls:

- `git status` - View all untracked files
- `git diff --cached` - See staged changes
- `git diff` - See unstaged changes
- `git log --oneline -10` - View recent commit history for style reference

### Comprehensive Diff Commands

For full change review (including untracked files):

- `git diff --cached` - Staged changes
- `git diff` - Unstaged changes
- `git ls-files --others --exclude-standard` - List untracked files

### Branch Information

- `git branch --show-current` - Get current branch name
- `git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'` - Get default branch name

## Common Git Patterns

### Checking Clean Working Directory

```bash
git status --porcelain
```

If output is empty, working directory is clean.

### Verifying Feature Branch

```bash
current_branch=$(git branch --show-current)
default_branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
if [ "$current_branch" = "$default_branch" ] || [ "$current_branch" = "main" ] || [ "$current_branch" = "master" ]; then
    echo "Error: Must be on a feature branch"
    exit 1
fi
```

### Adding Files with Patterns

- Add all modified files: `git add -u`
- Add specific file types: `git add "*.js" "*.ts"`
- Add all files in directory: `git add src/`

### Commit with HEREDOC

```bash
git commit -m "$(cat <<'EOF'
Commit message here

Additional details if needed
EOF
)"
```
