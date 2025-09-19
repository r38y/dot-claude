---
description: Fix copy with gettext, accessibility, and proper formatting
model: claude-sonnet-4-20250522
argument-hint: "[optional: 'entire codebase' or specific instructions like 'add gettext only']"
allowed-tools: [Read, Edit, Bash, Grep, Glob]
---

Review and improve user-facing copy with internationalization, accessibility, and proper formatting standards.

**Guidelines:**

- **Short sentences**: Keep under 15 words when possible
- **Simple words**: Use "pick" not "designate", "help" not "assistance", "get" not "receive"
- **Active voice**: "You'll get an email" not "An email will be sent to you"
- **Direct language**: "Thank you for helping!" not "Thank you for being part of the safety network"
- **Minimal copy**: Remove redundant explanations and unnecessary details
- **Clear CTAs**: "Learn more" not "More information"

**Internationalization (Gettext):**

1. **Simple strings**: `gettext("Save changes")`
2. **With variables**: `gettext("Welcome back, %{name}", name: user.name)`
3. **Pluralization**: `ngettext("One error", "%{count} errors", count)`
4. **Domain-specific**: `dgettext("errors", "Invalid input")`

**Accessibility (ARIA):**

1. **Icon-only buttons**: `aria-label={gettext("Delete item")}`
2. **Navigation**: `<nav aria-label={gettext("Main navigation")}>`
3. **Loading states**: `aria-live="polite" aria-busy={@loading}`
4. **Modals**: `aria-modal="true" aria-labelledby="modal-title"`

**Text Formatting:**

1. **Button text**: Use sentence case ("Save changes" not "Save Changes")
2. **Page titles and headings**: Use title case ("User Profile Settings")
3. **Punctuation**: End every sentence with proper punctuation

**Scope:**

- **Default**: Only files changed between current branch and main (`git diff main...HEAD`)
- **With "entire codebase"**: Review all files in the project

**Arguments:**

- "entire codebase" - Review all project files instead of just changed files
- "add gettext only" - Focus only on internationalization wrapping
- "accessibility improvements" - Focus only on ARIA attributes
- "only change the copy style" - Apply only 6th grade reading level improvements
- "everything to do with emails" - Focus only on email-related copy

**Process:**

1. If no arguments or not "entire codebase", get changed files: `git diff --name-only main...HEAD`
2. If "entire codebase" in $ARGUMENTS, scan all project files for user-facing copy
3. Apply requested improvements based on $ARGUMENTS or all guidelines if no specific instructions
4. Present the updated copy following all applicable guidelines
