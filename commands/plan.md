Generate a comprehensive implementation plan for a development task

Purpose: Create detailed, actionable plans showing exactly what will be changed, then automatically set up a feature branch and start implementation

Required argument:

- Task description (what you want to plan)

Actions to perform:

1. Parse the task description to understand requirements
2. Use TodoWrite to create a structured task list
3. Use tidewave and context7 MCPs to gather relevant patterns and best practices
4. Generate a detailed plan that includes:
   - **Files to modify**: List each file path with specific changes, including:
     - Exact functions/methods to modify
     - New imports needed
     - Changes to existing logic
   - **Files to create**: New files with their purpose and structure
   - **Code changes**: Key functions/classes to add or modify with:
     - Function signatures
     - Input/output types
     - Core logic description
   - **Tests to write/modify**:
     - New test files to create with full paths
     - Specific test functions to add (with descriptive names)
     - Test scenarios to cover (happy path, edge cases, error cases)
     - Existing tests that need updates and why
     - Test data/fixtures required
     - Expected assertions
   - **Configuration**: Any config files that need updates with specific values
5. Present the plan with clear sections:

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
   [List each test file with specific test cases, including:
    - Test function names and what they verify
    - Edge cases and error scenarios to cover
    - Test data/fixtures required
    - Expected assertions and outcomes]

   ## Implementation Steps
   1. First step with specific actions
   2. Second step with details
   3. Continue until complete

   ## Expected Outcome
   What the system will be able to do after implementation
   ```

6. Automatically proceed to implementation:
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
- `/plan refactor database connection pooling`

Notes:

- Focus on WHAT will change, not just high-level concepts
- Be specific about file paths and function names
- Include enough detail that another developer (or future Claude) could implement it
- Ensure test specifications are complete enough to verify the implementation
- THINK HARD by default
- The system will automatically create a feature branch, save the plan to ai_docs/, commit it, and start implementation