Generate a comprehensive implementation plan for a development task

Purpose: Create detailed, actionable plans showing exactly what will be changed

Required argument:

- Task description (what you want to plan)

Optional phrases:

- Include "save it to file" to save the plan to ./docs/[task_name].md

Actions to perform:

1. Parse the task description to understand requirements
2. Use TodoWrite to create a structured task list
3. Use tidewave and context7 MCPs to gather relevant patterns and best practices
4. Generate a detailed plan that includes:
   - **Files to modify**: List each file path with specific changes
   - **Files to create**: New files with their purpose
   - **Code changes**: Key functions/classes to add or modify
   - **Tests**: Specific test files and test cases to add
   - **Configuration**: Any config files that need updates
5. If "save it to file" is detected:
   - Convert task description to underscore_case filename
   - Create ./docs/ directory if it doesn't exist
   - Save the plan as markdown to ./docs/[filename].md
6. Present the plan with clear sections:

   ```
   # Plan: [Task Description]

   ## Overview
   Brief summary of what will be accomplished

   ## Files to Change
   - `path/to/file1.js`: Add function X, modify class Y
   - `path/to/file2.py`: Update method Z to handle new feature

   ## Files to Create
   - `path/to/newfile.js`: New component for feature X

   ## Tests to Add/Update
   - `tests/test_feature.py`: Add test_new_functionality()
   - `tests/integration/test_flow.js`: Update existing tests for changes

   ## Implementation Steps
   1. First step with specific actions
   2. Second step with details
   3. Continue until complete

   ## Expected Outcome
   What the system will be able to do after implementation
   ```

7. When exiting plan mode (via exit_plan_mode tool):
   - Check current branch using git branch
   - If on main/master branch:
     - Create a new feature branch with name r38y/[descriptive-name]
     - The descriptive name should be based on the plan content
   - If already on a feature branch:
     - Rename the current branch to something more appropriate based on the plan
     - Use format r38y/[descriptive-name] if not already prefixed
   - Save the plan to ai_docs/ directory:
     - Create ai_docs/ directory if it doesn't exist
     - Save plan as markdown with filename based on branch name
   - Commit the plan file with message "Add plan for [feature description]"
   - Start implementing the plan

Example usage:

- `/plan add user authentication with JWT tokens`
- `/plan refactor database connection pooling and save it to file`

Notes:

- Focus on WHAT will change, not just high-level concepts
- Be specific about file paths and function names
- Include enough detail that another developer could implement it
- THINK HARD by default
- When exiting plan mode, the system will automatically manage branching and documentation