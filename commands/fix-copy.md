---
name: fix-copy
description: Fix copy with gettext, accessibility, and proper formatting
---

Review and improve user-facing copy with internationalization, accessibility, and proper formatting standards.

Guidelines:

- **Short sentences**: Keep under 15 words when possible
- **Simple words**: Use "pick" not "designate", "help" not "assistance", "get" not "receive"
- **Active voice**: "You'll get an email" not "An email will be sent to you"
- **Direct language**: "Thank you for helping!" not "Thank you for being part of the safety network"
- **Minimal copy**: Remove redundant explanations and unnecessary details
- **Clear CTAs**: "Learn more" not "More information"

### Internationalization (Gettext)

**Wrap all text one sentence or shorter with gettext**:

1. **Simple strings**: `gettext("Save changes")`
2. **With variables**: `gettext("Welcome back, %{name}", name: user.name)`
3. **Pluralization**: `ngettext("One error", "%{count} errors", count)`
4. **Domain-specific**: `dgettext("errors", "Invalid input")`

### Accessibility (ARIA)

**Always include ARIA attributes**:

1. **Icon-only buttons**: `aria-label={gettext("Delete item")}`
2. **Navigation**: `<nav aria-label={gettext("Main navigation")}>`
3. **Loading states**: `aria-live="polite" aria-busy={@loading}`
4. **Modals**: `aria-modal="true" aria-labelledby="modal-title"`

### Text Formatting

1. **Button text**: Use sentence case ("Save changes" not "Save Changes")
2. **Page titles and headings**: Use title case ("User Profile Settings")
3. **Punctuation**: End every sentence with proper punctuation ("Event created successfully." not "Event created successfully")

## Usage

**Without arguments**: Analyzes all unstaged changes and changes compared to main branch (if on a branch)

**With arguments**: Follows specific instructions for what to change:

- `/fix-copy everything to do with emails` - Focus only on email-related copy
- `/fix-copy only change the copy style` - Apply only 6th grade reading level improvements
- `/fix-copy add gettext only` - Focus only on internationalization wrapping
- `/fix-copy accessibility improvements` - Focus only on ARIA attributes

## Steps

### No arguments provided:

1. Check git status for unstaged changes
2. If on a branch, compare changes to main branch using `git diff main...HEAD`
3. Apply all guidelines to identified changes

### With specific arguments:

1. Parse the user's instructions to determine scope
2. Apply only the requested improvements:
   - **Copy style only**: Steps 6-8 (simplify words, active voice, remove redundancy)
   - **Gettext only**: Step 2 (wrap text with gettext functions)
   - **Accessibility only**: Step 3 (add ARIA attributes)
   - **Specific topic**: Focus on copy related to the mentioned topic

### All cases:

1. Review the copy you previously wrote
2. Identify text that needs gettext wrapping
3. Add proper ARIA attributes for accessibility
4. Fix sentence case for buttons and title case for headings
5. Ensure all sentences end with proper punctuation
6. Replace complicated words with simple alternatives
7. Convert passive voice to active voice
8. Remove unnecessary explanations
9. Present the updated copy following all guidelines
