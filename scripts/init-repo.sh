#!/bin/bash
# Initialize a repository with GitHub Automator templates
# Usage: ./scripts/init-repo.sh [target-repo-path]
#        or run from within target repo: /path/to/init-repo.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

# Determine target directory
if [ -n "$1" ]; then
    TARGET_DIR="$1"
else
    TARGET_DIR="$(pwd)"
fi

# Verify target is a git repo
if [ ! -d "$TARGET_DIR/.git" ]; then
    echo "Error: $TARGET_DIR is not a git repository"
    exit 1
fi

echo "Initializing GitHub Automator in: $TARGET_DIR"

# Create directories
mkdir -p "$TARGET_DIR/.github/ISSUE_TEMPLATE"
mkdir -p "$TARGET_DIR/.claude/commands"
mkdir -p "$TARGET_DIR/.claude/rules"

# Copy GitHub templates
cp "$REPO_DIR/.github/ISSUE_TEMPLATE/"*.md "$TARGET_DIR/.github/ISSUE_TEMPLATE/"
cp "$REPO_DIR/.github/PULL_REQUEST_TEMPLATE.md" "$TARGET_DIR/.github/"
echo "✓ Copied GitHub Issue/PR templates"

# Copy Claude config (optional - for repo-specific)
cp "$REPO_DIR/.claude/settings.json" "$TARGET_DIR/.claude/"
echo "✓ Copied Claude settings"

# Copy or create CLAUDE.md
if [ ! -f "$TARGET_DIR/CLAUDE.md" ]; then
    cp "$REPO_DIR/CLAUDE.md" "$TARGET_DIR/"
    echo "✓ Created CLAUDE.md"
else
    echo "⚠ CLAUDE.md already exists (not overwritten)"
fi

# Create labels if gh is available and repo has remote
if command -v gh &> /dev/null; then
    cd "$TARGET_DIR"
    if git remote get-url origin &> /dev/null; then
        echo "Creating GitHub labels..."
        gh label create "type:feature" --color "0E8A16" --description "New feature" 2>/dev/null || true
        gh label create "type:bug" --color "D73A4A" --description "Bug fix" 2>/dev/null || true
        gh label create "type:task" --color "0075CA" --description "General task" 2>/dev/null || true
        gh label create "status:triage" --color "FBCA04" --description "Needs triage" 2>/dev/null || true
        gh label create "status:in-progress" --color "1D76DB" --description "Work in progress" 2>/dev/null || true
        gh label create "status:done" --color "0E8A16" --description "Completed" 2>/dev/null || true
        echo "✓ Created GitHub labels"
    fi
fi

echo ""
echo "Initialization complete!"
echo ""
echo "Next steps:"
echo "  1. Review and customize CLAUDE.md for your project"
echo "  2. Commit the changes: git add -A && git commit -m 'chore: add GitHub Automator templates'"
echo "  3. Push to remote: git push"
echo ""
echo "Usage:"
echo "  /start-task \"Your task description\""
echo "  /quick-commit"
echo "  /finish-task"
