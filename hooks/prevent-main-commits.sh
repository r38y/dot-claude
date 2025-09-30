#!/bin/bash
INPUT=$(cat)

# Check if trying to run git commit
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""')
if echo "$COMMAND" | grep -q "git commit"; then
  BRANCH=$(git -C "$PWD" symbolic-ref --short HEAD 2>/dev/null)
  if [ "$BRANCH" = "main" ]; then
    echo '{"decision": "block", "reason": "Cannot commit directly to main branch. Create a feature branch first using r38y/ prefix."}'
    exit 0
  fi
fi

exit 0