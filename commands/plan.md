---
name: plan
description: Generate a comprehensive implementation plan
parameters:
  - name: task_description
    required: true
  - name: create_issue
    required: false
---

Create a detailed plan for implementing a feature.

Required: Task description

Optional: --issue flag to create a GitHub issue

The plan includes:
- Overview of what will be accomplished
- Files to modify with specific changes
- Files to create with purpose
- Tests to write with scenarios
- Implementation steps
- Expected outcome

If --issue flag is provided:
1. Generate the plan
2. Show it to user
3. Ask "Would you like me to create a GitHub issue with this plan?"
4. Only create issue if user confirms
5. Stop after creating issue (don't implement)

If no --issue flag:
1. Generate and show the plan
2. Create feature branch
3. Save plan to ai_docs/
4. Start implementation

Plans focus on WHAT will change, with enough detail for implementation.