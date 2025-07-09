#!/bin/bash

# Read JSON input from stdin
json_input=$(cat)

# Extract file path from the JSON
file_path=$(echo "$json_input" | jq -r '.tool_input.file_path // empty')

# Exit if no file path
if [ -z "$file_path" ]; then
    exit 0
fi

# Only format markdown files
case "$file_path" in
*.md)
    # Always run prettier for Markdown files
    echo "Formatting $file_path with prettier..."
    npx prettier --write "$file_path"
    ;;
esac

exit 0
