Generate a comprehensive implementation plan and save it as a GitHub issue

Purpose: Create detailed, actionable plans showing exactly what will be changed, saved as a GitHub issue for future implementation

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
5. Format the plan with clear sections:

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

6. Show the complete plan to the user for review
7. Ask if the user wants to create a GitHub issue with this plan
8. If user confirms, create GitHub issue:
   - Use `gh issue create` command with the plan as the body
   - Title should be "Plan: [Task Description]"
   - Add label "plan" if it exists
   - Return the issue URL to the user
9. If user cancels, they still have the plan shown and can request changes

Example usage:

- `/plan-to-issue add user authentication with JWT tokens`
- `/plan-to-issue refactor database connection pooling`

Notes:

- Focus on WHAT will change, not just high-level concepts
- Be specific about file paths and function names
- Include enough detail that another developer (or future Claude) could implement it
- Ensure test specifications are complete enough to verify the implementation
- THINK HARD by default
- The issue URL will be returned for future reference