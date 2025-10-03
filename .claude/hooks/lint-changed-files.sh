#!/bin/bash

json_input=$(cat)

file_path=$(echo "$json_input" | jq -r '.tool_input.file_path // empty')

if [ -z "$file_path" ]; then
    exit 0
fi

case "$file_path" in
*.ex | *.exs | *.heex)
    echo "Formatting $file_path with mix format..."
    mix format "$file_path"
    ;;
*.js | *.jsx | *.ts | *.tsx)
    echo "Formatting $file_path with prettier..."
    npx prettier --write "$file_path"
    ;;
*.css | *.scss)
    echo "Formatting $file_path with prettier..."
    npx prettier --write "$file_path"
    ;;
*.json)
    echo "Formatting $file_path with prettier..."
    npx prettier --write "$file_path"
    ;;
*.md)
    echo "Formatting $file_path with prettier..."
    npx prettier --write "$file_path"
    ;;
esac

exit 0
