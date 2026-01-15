---
description: Finish current task by committing, pushing, and creating a PR
allowed-tools: Bash, Read, Write, Glob, Grep, TodoWrite
---

# Finish Task Command

You are finishing the current development task. Follow these steps precisely:

## Step 1: Load Task State

Read the current task state:

```bash
cat .claude/current-task.json 2>/dev/null
```

**If state file exists**, extract:
- `issue_number` - for PR linking
- `issue_title` - for PR title
- `branch` - to verify correct branch
- `type` - for commit/PR type

**If no state file exists**, warn the user and attempt to extract from branch name.

## Step 2: Check Current State

Run these commands to understand the current state:

```bash
git status
git branch --show-current
git log --oneline -5
```

Verify you're on the correct branch (should match state file).

## Step 3: Review Changes

Check what has changed:

```bash
git diff --stat
git diff
```

## Step 4: Stage and Commit

If there are uncommitted changes:

```bash
git add -A
git commit -m "<type>(<scope>): <description> (#<issue_number>)

<body explaining what was implemented>

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>"
```

**IMPORTANT**:
- Commit message MUST be in native English
- Follow Conventional Commits format
- Reference the issue number from state file

## Step 5: Push to Remote

```bash
git push -u origin <current-branch>
```

## Step 6: Create Pull Request

```bash
gh pr create \
  --title "<type>: <description>" \
  --body "## Summary
<Brief description of changes>

## Related Issue
Closes #<issue_number>

## Changes Made
- Change 1
- Change 2

## Test Plan
- [ ] Test 1
- [ ] Test 2

---
Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>"
```

**IMPORTANT**:
- PR title and body MUST be in native English
- Include `Closes #<issue_number>` to auto-close the issue
- List all significant changes

## Step 7: Clean Up Task State

After successful PR creation, remove the state file:

```bash
rm .claude/current-task.json
```

Optionally, add it to `.gitignore` if not already:

```bash
echo ".claude/current-task.json" >> .gitignore 2>/dev/null || true
```

## Step 8: Mark Todos Complete

Update the todo list to mark all items as completed.

## Step 9: Report to User

Tell the user:
1. Commit hash and message
2. PR number and link
3. Issue that will be closed (#<issue_number>)
4. Task state cleaned up
5. Next steps (review, merge)

Now proceed with these steps.
