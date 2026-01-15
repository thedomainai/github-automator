# Git Workflow Rules

## Branch Strategy

### Main Branch (`main`)
- Always deployable
- Protected - no direct commits
- All changes via Pull Requests

### Feature Branches
- Created from `main`
- Naming: `<type>/#<issue>-<short-description>`
- Deleted after merge

## Commit Guidelines

### Message Format
```
<type>(<scope>): <description> (#<issue>)

[body]

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
```

### Types
| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation |
| `refactor` | Code refactoring |
| `test` | Tests |
| `chore` | Maintenance |
| `style` | Formatting |

### Scope
- Module or component name
- Optional but recommended
- Examples: `auth`, `api`, `ui`, `db`

### Rules
1. **Language**: Always English
2. **Tense**: Imperative mood ("add" not "added")
3. **Length**: Max 72 characters for subject
4. **Issue**: Always reference issue number
5. **Co-author**: Include Claude attribution

## Pull Request Guidelines

### Title
- Match commit message format
- Same type and scope

### Body
- Summary of changes
- `Closes #<issue>` for auto-close
- List of changes
- Test plan

### Review Process
1. Self-review before requesting
2. Address all comments
3. Squash commits on merge

## Issue Guidelines

### Title Format
```
[Type] Clear description
```

### Labels
- `type:feature`, `type:bug`, `type:task`
- `status:triage`, `status:in-progress`, `status:done`
- `priority:high`, `priority:medium`, `priority:low`

### Content
- Clear acceptance criteria
- Technical notes if relevant
- Related issues linked
