---
description: Quick commit with auto-generated Conventional Commits message
allowed-tools: Bash, Read, Glob, Grep
---

# Quick Commit Command

Create a quick commit with an automatically generated message. Follow these steps:

## Step 1: Load Task State

Read the current task state:

```bash
cat .claude/current-task.json 2>/dev/null
```

If the file exists, extract:
- `issue_number` - for commit message reference
- `type` - for commit type prefix
- `branch` - to verify you're on the correct branch

If no state file exists, fall back to extracting from branch name.

## Step 2: Check Current State

```bash
git status
git branch --show-current
git diff --stat
```

Verify you're on the correct branch (should match state file).

## Step 3: Analyze Changes

Review what files have changed and understand the nature of changes:

```bash
git diff
```

## Step 4: Determine Commit Type

Based on the changes (or use type from state file):
- `feat` - New feature or functionality
- `fix` - Bug fix
- `docs` - Documentation changes
- `refactor` - Code restructuring
- `test` - Test additions/changes
- `chore` - Maintenance tasks
- `style` - Formatting, no code change

## Step 5: Generate Commit Message

Create a commit message following Conventional Commits:

```
<type>(<scope>): <short description in imperative mood> (#<issue_number>)
```

**Rules for the message:**
- MUST be in native English
- Use imperative mood ("add" not "added")
- Keep under 72 characters
- Be specific but concise
- Reference the issue number from state file

**Good examples:**
- `feat(auth): add password reset endpoint (#12)`
- `fix(api): handle null response in user service (#34)`
- `refactor(utils): simplify date formatting logic (#56)`

**Bad examples:**
- `fixed bug` (no type, no scope, no issue)
- `feat: added new feature` (past tense, vague)

## Step 6: Execute Commit

```bash
git add -A
git commit -m "<generated message>

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>"
```

## Step 7: Confirm to User

Report:
1. Files committed
2. Commit message used
3. Commit hash
4. Issue reference (#<number>)

Now proceed with these steps.
