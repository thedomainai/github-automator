---
description: Finish current task by committing, pushing, and creating a PR
allowed-tools: Bash, Read, Glob, Grep, TodoWrite
---

# Finish Task Command

You are finishing the current development task. Follow these steps precisely:

## Step 1: Check Current State

Run these commands to understand the current state:

```bash
git status
git branch --show-current
git log --oneline -5
```

Extract the issue number from the branch name (e.g., `feat/#123-description` → `#123`).

## Step 2: Review Changes

Check what has changed:

```bash
git diff --stat
git diff
```

## Step 3: Stage and Commit

If there are uncommitted changes:

```bash
git add -A
git commit -m "<type>(<scope>): <description> (#<issue>)

<body explaining what was implemented>

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>"
```

**IMPORTANT**:
- Commit message MUST be in native English
- Follow Conventional Commits format
- Reference the issue number

## Step 4: Push to Remote

```bash
git push -u origin <current-branch>
```

## Step 5: Create Pull Request

```bash
gh pr create \
  --title "<type>: <description>" \
  --body "## Summary
<Brief description of changes>

## Related Issue
Closes #<issue-number>

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
- Include `Closes #<issue-number>` to auto-close the issue
- List all significant changes

## Step 6: Mark Todos Complete

Update the todo list to mark all items as completed.

## Step 7: Report to User

Tell the user:
1. Commit hash and message
2. PR number and link
3. Issue that will be closed
4. Next steps (review, merge)

Now proceed with these steps.
