---
description: Quick commit with auto-generated Conventional Commits message
allowed-tools: Bash, Read, Glob, Grep
---

# Quick Commit Command

Create a quick commit with an automatically generated message. Follow these steps:

## Step 1: Check Current State

```bash
git status
git branch --show-current
git diff --stat
```

Extract the issue number from the branch name (e.g., `feat/#123-description` → `#123`).

## Step 2: Analyze Changes

Review what files have changed and understand the nature of changes:

```bash
git diff
```

## Step 3: Determine Commit Type

Based on the changes, determine:
- `feat` - New feature or functionality
- `fix` - Bug fix
- `docs` - Documentation changes
- `refactor` - Code restructuring
- `test` - Test additions/changes
- `chore` - Maintenance tasks
- `style` - Formatting, no code change

## Step 4: Generate Commit Message

Create a commit message following Conventional Commits:

```
<type>(<scope>): <short description in imperative mood> (#<issue>)
```

**Rules for the message:**
- MUST be in native English
- Use imperative mood ("add" not "added")
- Keep under 72 characters
- Be specific but concise
- Reference the issue number

**Good examples:**
- `feat(auth): add password reset endpoint (#12)`
- `fix(api): handle null response in user service (#34)`
- `refactor(utils): simplify date formatting logic (#56)`

**Bad examples:**
- `fixed bug` (no type, no scope, no issue)
- `feat: added new feature` (past tense, vague)

## Step 5: Execute Commit

```bash
git add -A
git commit -m "<generated message>

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>"
```

## Step 6: Confirm to User

Report:
1. Files committed
2. Commit message used
3. Commit hash

Now proceed with these steps.
