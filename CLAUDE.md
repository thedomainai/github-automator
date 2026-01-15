# GitHub Automator - Claude Code Project Memory

## Project Overview

This repository provides an automated GitHub Issue-driven development workflow with Claude Code.
All GitHub content (Issues, commits, PRs) must be written in **native English**.

## Development Workflow

### Issue-Driven Development

1. **Start Task**: Use `/start-task` to create an Issue and feature branch
2. **Development**: Implement the feature with Claude Code assistance
3. **Commit**: Use `/quick-commit` for intermediate commits
4. **Finish Task**: Use `/finish-task` to push and create a PR

### Branch Naming Convention

```
<type>/#<issue-number>-<short-description>
```

Examples:
- `feat/#1-user-authentication`
- `fix/#23-login-redirect-bug`
- `docs/#45-api-documentation`

Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`

## Git Rules

### Commit Message Format (Conventional Commits)

```
<type>(<scope>): <description> (#<issue>)

[optional body]

[optional footer]
Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
```

**Types:**
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation changes
- `refactor`: Code refactoring without functionality changes
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**
```
feat(auth): implement JWT token validation (#12)
fix(api): resolve null pointer in user endpoint (#34)
docs(readme): add installation instructions (#56)
```

### Important Rules

- **All commit messages MUST be in English**
- **Always reference the Issue number** in commits: `(#123)`
- **Never commit directly to main** - always use feature branches
- **PR titles** should match the Issue title
- **PR body** must include `Closes #<issue-number>`

## Slash Commands

| Command | Description |
|---------|-------------|
| `/start-task` | Create Issue + branch, start development |
| `/finish-task` | Commit, push, and create PR |
| `/quick-commit` | Quick commit with auto-generated message |

## File Structure

```
.github/
├── ISSUE_TEMPLATE/     # Issue templates
└── PULL_REQUEST_TEMPLATE.md
.claude/
├── commands/           # Slash commands
├── rules/              # Additional rules
└── settings.json       # Hooks configuration
```

## Code Style

- Follow existing patterns in the codebase
- Write clear, self-documenting code
- Add comments only when logic is not self-evident
