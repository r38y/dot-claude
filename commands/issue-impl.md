---
name: issue-impl
description: Implement a plan from a GitHub issue
parameters:
  - name: issue_url
    required: true
---

Read a GitHub issue and implement the plan it contains.

Required: GitHub issue URL

Steps:
1. Parse issue URL and read content with `gh issue view`
2. Extract implementation plan from issue body
3. Create feature branch named r38y/issue-[number]-[description]
4. Add "in progress" label to issue
5. Implement the plan following specifications
6. Make progress commits as you work (without quality checks)
7. Run quality checks (tests, lint, typecheck) and fix any issues until all pass
8. Create final commit with message including "Closes #[number]"
9. Push branch and create PR
10. Update issue labels to "pr submitted"

The PR must include "Closes #[number]" to auto-close the issue when merged.