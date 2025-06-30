Implement a plan from a GitHub issue

Purpose: Read a GitHub issue containing an implementation plan, create a feature branch, implement the plan, and create a pull request

Required argument:

- GitHub issue URL (e.g., https://github.com/owner/repo/issues/123)

Actions to perform:

1. Parse the GitHub issue URL to extract owner, repo, and issue number
2. Use `gh issue view` to read the issue content:
   ```
   gh issue view [issue-number] --json title,body
   ```
3. Parse the issue body to understand the implementation plan:
   - Extract the plan sections (Overview, Files to Change, Files to Create, Tests, etc.)
   - Use TodoWrite to create tasks based on the implementation steps
4. Create a feature branch:
   - Generate branch name from issue title (r38y/issue-[number]-[descriptive-name])
   - Create and checkout the branch:
     ```
     git checkout -b r38y/issue-[number]-[descriptive-name]
     ```
5. Implement the plan:
   - Work through each task in the todo list
   - Follow the detailed specifications from the issue
   - Create/modify files as specified
   - Write tests as outlined
   - Mark todos as completed as you progress
6. Verify implementation:
   - Run tests if test commands are available
   - Run linting/type checking if available
   - Ensure all todos are completed
7. Commit and push:
   - Stage all changes
   - Create a commit with message referencing the issue:
     ```
     git commit -m "Implement plan from issue #[number]: [brief description]
     
     Closes #[number]"
     ```
   - Push the branch to origin
8. Create pull request:
   - Strip "Plan: " prefix from issue title if present
   - Use gh to create PR that references the issue:
     ```
     gh pr create --title "Impl: [issue title without 'Plan: ' prefix]" \
                  --body "Implements the plan from #[number]
     
     ## Summary
     [Brief summary of implementation]
     
     Closes #[number]"
     ```
   - Return the PR URL to the user

Example usage:

- `/issue-to-impl https://github.com/r38y/my-project/issues/42`
- `/issue-to-impl https://github.com/org/repo/issues/123`

Notes:

- The issue should contain a well-structured implementation plan
- The branch name will include the issue number for easy tracking
- The PR will automatically link to and close the issue when merged
- All implementation follows the specifications in the issue exactly