---
name: plan
description: Generate a comprehensive implementation plan
model: claude-opus-4-1-20250805
parameters:
  - name: task_description
    required: true
---

⚠️ PLANNING ONLY - NO IMPLEMENTATION! ⚠️

When user says "/plan add dark mode", you MUST: ✅ Create a detailed plan ✅ Show the plan to the user ✅ Ask if they want to create an issue or implement

❌ DO NOT start coding ❌ DO NOT modify files ❌ DO NOT use grep/search tools

IMPORTANT: DO NOT START IMPLEMENTING! This command is for PLANNING ONLY.

Create a detailed plan for implementing a feature. Ultrathink about it.

Required: Task description

STOP AND PLAN FIRST:

1. You MUST create a complete plan before any implementation
2. You MUST show the plan to the user
3. You MUST wait for user's choice before proceeding
4. DO NOT modify any files until user approves

The plan must be detailed enough for Claude Code or another AI agent to execute without additional planning.

Required sections:

## Overview

- Clear description of the feature/fix
- User-facing impact and benefits
- Technical approach (1-2 sentences)

## Files to Modify

For each file:

- Full file path
- Current purpose/responsibility
- Specific changes needed (what functions/classes to add/modify)
- Dependencies or imports to add

## Files to Create

For each new file:

- Full file path
- Purpose and responsibility
- Complete list of functions/classes/components to implement
- Key interfaces and data structures
- Integration points with existing code

## Tests

For each test file:

- Full file path
- Test scenarios with expected behavior
- Edge cases to cover
- Test data requirements

## Implementation Order

Numbered steps showing:

1. Which files to create/modify first
2. Dependencies between changes
3. Where to run tests during implementation
4. Specific commands to run (npm install, migrations, etc)

## Validation Steps

- Commands to run for testing
- Expected output or behavior
- How to verify the feature works correctly

Workflow (FOLLOW EXACTLY):

1. Generate the plan (DO NOT SKIP THIS)
2. Show the complete plan to user (DO NOT SKIP THIS)
3. Ask "Would you like to: 1) Create a GitHub issue with this plan, or 2) Start implementing?" (DO NOT SKIP THIS)
4. If user provides feedback instead of choosing:
   - Update the plan based on feedback
   - Show the updated plan again
   - Ask again about creating issue or implementing
   - Repeat until user chooses an option or declines
5. If user chooses GitHub issue:
   - Create issue with the plan
   - Stop (don't implement)
   - No feature branch is created
6. If user chooses to implement:
   - Create feature branch
   - Start implementation
   - Make progress commits as you work (without quality checks)
   - IMPORTANT: Run quality checks (tests, lint, typecheck) in a subagent to improve performance
   - Fix any issues until all pass within the subagent
   - Create PR after all quality checks pass

Plans focus on WHAT will change, with enough detail for implementation.

CRITICAL: If you start implementing without showing a plan first, you have failed to follow this command.
