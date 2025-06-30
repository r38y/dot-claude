# Branch Management

## Feature Branch Verification

### Check if on Feature Branch

```bash
current_branch=$(git branch --show-current)
default_branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@' 2>/dev/null || echo "main")

if [ "$current_branch" = "$default_branch" ] || [ "$current_branch" = "main" ] || [ "$current_branch" = "master" ]; then
    echo "Error: Must be on a feature branch (not main/master)"
    exit 1
fi
```

### Branch Prefix Handling

Ensure branch has r38y/ prefix if no other prefix exists:

```bash
current_branch=$(git branch --show-current)
if [[ ! "$current_branch" =~ ^[^/]+/ ]]; then
    new_branch="r38y/$current_branch"
    git branch -m "$new_branch"
fi
```

## Branch Operations

### Get Current Branch

```bash
git branch --show-current
```

### Get Default Branch

```bash
# With error handling
git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@' 2>/dev/null || echo "main"
```

### Check Remote Tracking

```bash
git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null
```

### Push with Upstream

```bash
git push -u origin "$(git branch --show-current)"
```

## Common Patterns

### Ensure Remote Tracking

```bash
if ! git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then
    git push -u origin "$(git branch --show-current)"
fi
```

### Get Base Branch for PR

```bash
base_branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@' 2>/dev/null || echo "main")
```

### Check if Branch Exists Remotely

```bash
git ls-remote --heads origin "$(git branch --show-current)" | grep -q . && echo "exists" || echo "not exists"
```
