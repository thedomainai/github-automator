---
description: Start a new task by creating a GitHub Issue and feature branch
allowed-tools: Bash, Read, Write, Glob, Grep, TodoWrite
---

# Start Task Command

You are starting a new development task. Follow these steps precisely:

## Step 1: Check for Existing Task

First, check if there's an existing task in progress:

```bash
cat .claude/current-task.json 2>/dev/null
```

If a task exists, warn the user and ask if they want to:
- Continue with the existing task
- Abandon it and start a new one

## Step 2: Understand the Task

The user's task description: **$ARGUMENTS**

If no description is provided, ask the user what they want to implement.

## Step 3: Determine Issue Type

Based on the task description, determine the type:
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation
- `refactor` - Code refactoring
- `test` - Testing
- `chore` - Maintenance

## Step 4: Create GitHub Issue

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
- Capture the returned issue number from the output

## Step 5: Create Feature Branch

After creating the issue, note the issue number and create a branch:

```bash
git checkout -b <type>/<issue-number>-<short-description>
```

**Branch naming format**: `<type>/<issue-number>-<short-description>`
- NO `#` symbol (causes shell issues)
- Use hyphens for spaces
- Keep description short (2-4 words)

Examples:
- `feat/1-user-authentication`
- `fix/23-login-redirect-bug`
- `docs/45-api-documentation`

## Step 6: Save Task State

Create `.claude/current-task.json` to persist the task state:

```bash
mkdir -p .claude
cat > .claude/current-task.json << EOF
{
  "issue_number": <number>,
  "issue_title": "<title>",
  "branch": "<branch-name>",
  "type": "<type>",
  "description": "<description>",
  "created_at": "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
}
EOF
```

This allows `/quick-commit` and `/finish-task` to automatically reference the issue.

## Step 7: Initialize Todo List

Use TodoWrite to create a task list based on the Issue's acceptance criteria.

## Step 8: Confirm to User

Tell the user:
1. Issue number and link
2. Branch name
3. State saved to `.claude/current-task.json`
4. Todo list items
5. Ready to start development

Now proceed with these steps.
