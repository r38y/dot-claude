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
- @moduledoc blocks from internal modules (not tests or test helpers)
- @doc blocks from internal modules (not tests or test helpers)

**What gets preserved:**

- Test comments explaining non-obvious data setup
- Test comments clarifying purpose of specific test data values
- Comments required for functionality (magic comments, compiler directives)
- @moduledoc and @doc blocks in test modules and test helper modules
- All comments in router modules

**Process:**

1. Check current branch with `git branch --show-current`
2. Determine scope:
   - Default: All changes compared to main branch (`git diff --name-only main...HEAD`)
   - If optional instructions provided, use those to determine scope:
     - "unstaged files" → `git diff --name-only`
     - "only the notifications context" → files matching that pattern/directory
     - Other specific areas → interpret and apply appropriate file pattern
3. Get files based on determined scope
4. For each file: analyze comments and remove unnecessary ones
5. Apply changes and report summary
