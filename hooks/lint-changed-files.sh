#!/bin/bash

# Read JSON input from stdin
json_input=$(cat)

# Extract file path from the JSON
file_path=$(echo "$json_input" | jq -r '.tool_input.file_path // empty')

# Exit if no file path
if [ -z "$file_path" ]; then
    exit 0
fi

# Always format based on file extension
case "$file_path" in
*.ex | *.exs | *.heex)
    # Always run Elixir formatter
    echo "Formatting $file_path with mix format..."
    mix format "$file_path"
    ;;
*.js | *.jsx | *.ts | *.tsx)
    # Always run prettier for JavaScript/TypeScript files
    echo "Formatting $file_path with prettier..."
    npx prettier --write "$file_path"
    ;;
*.css | *.scss)
    # Always run prettier for CSS files
    echo "Formatting $file_path with prettier..."
    npx prettier --write "$file_path"
    ;;
*.json)
    # Always run prettier for JSON files
    echo "Formatting $file_path with prettier..."
    npx prettier --write "$file_path"
    ;;
*.md)
    # Always run prettier for Markdown files
    echo "Formatting $file_path with prettier..."
    npx prettier --write "$file_path"
    ;;
esac

exit 0
