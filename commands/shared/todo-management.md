# Todo Management Patterns

## Standard Todo Creation

### Initial Task Planning

Use TodoWrite at the start of complex tasks to:

1. Break down the main objective into subtasks
2. Set appropriate priorities (high/medium/low)
3. Track progress systematically

### Common Todo Patterns

#### For Git Operations

```
1. Review current changes (git status, diff)
2. [Main task - e.g., "Create meaningful commit", "Squash commits"]
3. Verify changes were successful
4. Push to remote (if requested)
```

#### For Code Changes

```
1. Analyze current code structure
2. Implement changes
3. Run quality checks
4. Commit changes
```

#### For PR Creation

```
1. Review all changes since diverging from main
2. Ensure branch is up to date with remote
3. Create PR with appropriate description
4. Monitor PR checks
```

## Task Status Management

### Status Progression

- `pending` → `in_progress` → `completed`
- Only ONE task should be `in_progress` at a time
- Mark tasks `completed` immediately after finishing

### Task Updates

- Update task status before starting work
- Complete current task before moving to next
- Add new tasks discovered during implementation

## Best Practices

1. Create specific, actionable items
2. Use clear, descriptive task names
3. Set realistic priorities
4. Update in real-time as you work
5. Complete tasks sequentially, not in batches
