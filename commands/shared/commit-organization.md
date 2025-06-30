# Commit Organization

## Multi-Commit Strategies

### Basic Organization

1. Create temporary branch: `git checkout -b temp-organize`
2. Soft reset to base: `git reset --soft $(git merge-base HEAD main)`
3. Stage and commit all changes:
   ```bash
   git add -A
   git commit -m "Feature implementation"
   ```

### Custom Separation (User-Specified)

When user provides splitting instructions (e.g., "separate auth from UI"):

1. Create temporary branch
2. Soft reset to base
3. Group files according to user instructions
4. Create commits in logical order:
   - Infrastructure/config changes first
   - Core functionality
   - UI/frontend changes
   - Tests/documentation last

### Commit Organization Patterns

#### By Feature Area

```bash
# Backend changes
git add api/ models/ services/
git commit -m "Add backend API endpoints"

# Frontend changes
git add src/components/ src/styles/
git commit -m "Update UI components"

# Tests
git add tests/ spec/
git commit -m "Add test coverage"
```

#### By File Type

```bash
# Database/migrations
git add migrations/ schema/
git commit -m "Update database schema"

# Configuration
git add config/ .env.example
git commit -m "Update configuration settings"
```

## Best Practices

1. **Order Matters**: Commit in dependency order
   - Config/setup files first
   - Core implementation
   - UI/presentation layer
   - Tests and docs last

2. **Atomic Commits**: Each commit should:
   - Be self-contained
   - Pass tests independently
   - Have clear purpose

3. **Force Push Safely**:

   ```bash
   # Save original branch name
   original_branch=$(git rev-parse --abbrev-ref HEAD)

   # After organizing on temp branch
   git push origin HEAD:$original_branch --force-with-lease

   # Return to original branch
   git checkout $original_branch
   git reset --hard origin/$original_branch
   
   # Clean up temporary branch
   git branch -D temp-organize
   ```
