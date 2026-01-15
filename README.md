# GitHub Automator

Automated GitHub Issue-driven development workflow with Claude Code.

## Overview

This repository provides a complete automation system for Issue-driven development:

- **Automatic Issue creation** with templates
- **Feature branch management** linked to Issues
- **Conventional Commits** enforcement
- **Automated PR creation** with Issue linking

## Quick Start

### Prerequisites

- [Claude Code](https://claude.ai/code) installed
- [GitHub CLI](https://cli.github.com/) (`gh`) authenticated
- Git configured

### Installation

#### Global Installation (Recommended)

Install commands globally so they work in all repositories:

```bash
./scripts/install-global.sh
```

This copies `/start-task`, `/quick-commit`, `/finish-task` to `~/.claude/commands/`.

#### Per-Repository Setup

Initialize an existing repository with GitHub Automator:

```bash
./scripts/init-repo.sh /path/to/your/repo
```

### Workflow

```
┌─────────────────────────────────────────────────────────┐
│  1. /start-task "Add user authentication"               │
│     └─→ Creates Issue #1 + branch feat/#1-user-auth    │
│                                                         │
│  2. [Development with Claude Code]                      │
│     └─→ /quick-commit for intermediate saves           │
│                                                         │
│  3. /finish-task                                        │
│     └─→ Push + Create PR (Closes #1)                   │
└─────────────────────────────────────────────────────────┘
```

## Commands

| Command | Description |
|---------|-------------|
| `/start-task <description>` | Create Issue and feature branch |
| `/quick-commit` | Commit changes with auto-generated message |
| `/finish-task` | Push and create Pull Request |

## Commit Format

All commits follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <description> (#<issue>)
```

**Types:** `feat`, `fix`, `docs`, `refactor`, `test`, `chore`

**Example:**
```
feat(auth): implement JWT validation (#12)
```

## Branch Naming

```
<type>/<issue>-<short-description>
```

**Note**: No `#` symbol (causes shell issues).

**Example:**
```
feat/1-user-authentication
```

## Project Structure

```
.
├── .github/
│   ├── ISSUE_TEMPLATE/     # Issue templates
│   └── PULL_REQUEST_TEMPLATE.md
├── .claude/
│   ├── commands/           # Slash commands
│   ├── rules/              # Workflow rules
│   └── settings.json       # Hooks configuration
├── scripts/
│   ├── install-global.sh   # Global installation
│   └── init-repo.sh        # Per-repo initialization
├── CLAUDE.md               # Project memory for Claude Code
└── README.md
```

## Customization

### Adding Issue Templates

Add new templates in `.github/ISSUE_TEMPLATE/`.

### Modifying Commands

Edit files in `.claude/commands/` to customize behavior.

### Adjusting Rules

Update `CLAUDE.md` or files in `.claude/rules/`.

## License

MIT
