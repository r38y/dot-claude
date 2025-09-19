---
description: Update copy to 6th grade reading level
model: claude-3-5-haiku-latest
argument-hint: "[optional: 'entire codebase' to review all files]"
allowed-tools: [Read, Edit, Bash, Grep, Glob]
---

Review and simplify user-facing copy to 6th grade reading level.

**Scope:**

- **Default**: Only files changed between current branch and main (`git diff main...HEAD`)
- **With "entire codebase"**: Review all files in the project

**Guidelines:**

- **Short sentences**: Keep under 15 words when possible
- **Simple words**: Use "pick" not "designate", "help" not "assistance", "get" not "receive"
- **Active voice**: "You'll get an email" not "An email will be sent to you"
- **Direct language**: "Thank you for helping!" not "Thank you for being part of the safety network"
- **Minimal copy**: Remove redundant explanations and unnecessary details
- **Clear CTAs**: "Learn more" not "More information"

**Process:**

1. If no arguments or not "entire codebase", get changed files: `git diff --name-only main...HEAD`
2. If "entire codebase" in $ARGUMENTS, scan all project files for user-facing copy
3. Review copy in identified files
4. Apply guidelines to simplify text to 6th grade reading level
5. Present updated copy that follows all guidelines
