---
name: issue-impl
description: Implement a plan from a GitHub issue
model: claude-sonnet-4-5-20250929
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
7. IMPORTANT: For maximum efficiency run independent quality checks (tests, lint, typecheck) simultaneously in a subagent to improve performance
8. Fix any issues until all pass within the subagent
9. Create final commit with message MUST include "Closes #[number]" - DO NOT FORGET THIS
10. Push branch and create PR
11. Update issue labels to "pr submitted"

Commit & PR Guidelines:

- Use maximum 5 bullet points
- Keep each point to one line
- Focus on WHAT was implemented
- Match the issue's requirements
- MANDATORY: Include "Closes #[number]" to auto-close the issue - NEVER FORGET THIS
- NEVER include AI code assistant (Claude, OpenCode, OpenAI, etc) attribution or signatures - EXCLUDE ALL ATTRIBUTION

Example commit message:

```
Implement dark mode toggle

- Add theme context provider
- Create toggle component in settings
- Update styles for dark theme
- Store preference in localStorage
- Apply theme on app initialization

Closes #42
```
