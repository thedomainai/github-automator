#!/bin/bash
# Install GitHub Automator commands globally
# Usage: ./scripts/install-global.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
CLAUDE_DIR="$HOME/.claude"

echo "Installing GitHub Automator commands globally..."

# Create directories
mkdir -p "$CLAUDE_DIR/commands"
mkdir -p "$CLAUDE_DIR/rules"

# Copy commands
cp "$REPO_DIR/.claude/commands/"*.md "$CLAUDE_DIR/commands/"
echo "✓ Copied slash commands to $CLAUDE_DIR/commands/"

# Copy rules
cp "$REPO_DIR/.claude/rules/"*.md "$CLAUDE_DIR/rules/"
echo "✓ Copied rules to $CLAUDE_DIR/rules/"

# Create or update global CLAUDE.md
if [ ! -f "$CLAUDE_DIR/CLAUDE.md" ]; then
    cat > "$CLAUDE_DIR/CLAUDE.md" << 'EOF'
# Global Claude Code Settings

## GitHub Workflow

When working in repositories:
- Use Issue-driven development workflow
- All commit messages in English (Conventional Commits)
- Reference Issue numbers in commits

## Available Commands

- `/start-task` - Start new task (create Issue + branch)
- `/quick-commit` - Quick commit with auto-generated message
- `/finish-task` - Finish task (push + create PR)
EOF
    echo "✓ Created $CLAUDE_DIR/CLAUDE.md"
else
    echo "⚠ $CLAUDE_DIR/CLAUDE.md already exists (not overwritten)"
fi

echo ""
echo "Installation complete!"
echo ""
echo "Commands available globally:"
echo "  /start-task    - Start new task"
echo "  /quick-commit  - Quick commit"
echo "  /finish-task   - Finish task"
