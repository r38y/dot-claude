---
description: Run CodeRabbit review and fix any issues
model: claude-sonnet-4-5-20250929
allowed-tools: [Bash, Read, Edit, Task, Grep, Glob]
---

Run CodeRabbit review in prompt-only mode and fix any issues found.

**Process:**

1. Run `coderabbit --prompt-only` in the background with no timeout
2. Monitor output as it becomes available
3. Review all issues found by CodeRabbit
4. Fix each issue identified
5. Verify fixes are complete

**Important:**

- The command runs in the background to handle long execution times
- All issues identified by CodeRabbit should be addressed
- Do not commit changes unless explicitly requested
