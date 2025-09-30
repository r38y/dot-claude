#!/bin/bash

# Read input from stdin
INPUT=$(cat)

# Log to stderr in pretty format
echo "Hook received:" >&2
echo "$INPUT" | jq . >&2 2>/dev/null || echo "$INPUT" >&2

# Play the notification sound
afplay "$HOME/.claude/hooks/notif.mp3"