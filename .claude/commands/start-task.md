---
description: Start a new task by creating a GitHub Issue and feature branch
allowed-tools: Bash, Read, Glob, Grep, TodoWrite
---

# Start Task Command

You are starting a new development task. Follow these steps precisely:

## Step 1: Understand the Task

The user's task description: **$ARGUMENTS**

If no description is provided, ask the user what they want to implement.

## Step 2: Determine Issue Type

Based on the task description, determine the type:
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation
- `refactor` - Code refactoring
- `test` - Testing
- `chore` - Maintenance

## Step 3: Create GitHub Issue

Create a GitHub Issue with the following format:

```bash
gh issue create \
  --title "[Type] Clear, concise title in English" \
  --body "## Summary
Brief description of what needs to be done.

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Technical Notes
Any relevant technical details.

---
Created via Claude Code /start-task" \
  --label "type:<type>,status:in-progress"
```

**IMPORTANT**:
- Title and body MUST be in native English
- Use professional, clear language
- Be specific about requirements

## Step 4: Create Feature Branch

After creating the issue, note the issue number and create a branch:

```bash
git checkout -b <type>/#<issue-number>-<short-description>
```

Example: `git checkout -b feat/#1-user-authentication`

## Step 5: Initialize Todo List

Use TodoWrite to create a task list based on the Issue's acceptance criteria.

## Step 6: Confirm to User

Tell the user:
1. Issue number and link
2. Branch name
3. Todo list items
4. Ready to start development

Now proceed with these steps.
