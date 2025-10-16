---
name: claude-reload
description: Reload all Claude configuration files and discover new commands
model: claude-haiku-4-5-20251001
---

Purpose: Refresh Claude's understanding of user preferences and project-specific instructions

Actions to perform:

1. Read the global CLAUDE.md file from ~/.claude/CLAUDE.md
2. Read the project-specific CLAUDE.md file from the current repository
3. Scan for new slash commands in:
   - ~/.claude/commands/ (global commands)
   - ./.claude/commands/ (project-specific commands)
4. Apply all instructions and preferences from these files
5. Confirm successful reload to the user

Note: This simulates starting a fresh Claude session with updated configurations
