---
description: Remove code comments from files, preserving test clarification comments
model: claude-sonnet-4-5-20250929
allowed-tools: [Bash, Read, Edit, Grep, Glob]
---

Compare current branch to main and remove unnecessary code comments while preserving test clarification comments that explain non-obvious data setup.

**What gets removed:**

- Implementation comments explaining how code works
- TODO/FIXME comments
- Commented-out code
- Header comments and copyright notices
- Inline comments that restate what code does
- Documentation comments for internal functions

**What gets preserved:**

- Test comments explaining non-obvious data setup
- Test comments clarifying purpose of specific test data values
- Comments required for functionality (magic comments, compiler directives)

**Process:**

1. Check current branch with `git branch --show-current`
2. Prompt user to choose scope:
   - Option 1: Comments in unstaged changes (`git diff --name-only`)
   - Option 2: All changes compared to main branch (`git diff --name-only main...HEAD`) - only if not on main branch
   - Option 3: Specific area of the code (prompt for directory/file pattern)
3. Get files based on selected scope
4. For each file: analyze comments and remove unnecessary ones
5. Apply changes and report summary
