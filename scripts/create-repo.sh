#!/bin/bash
# Create a new repository with GitHub Automator pre-configured
# Usage: ./scripts/create-repo.sh <repo-name> [--private]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INIT_SCRIPT="$SCRIPT_DIR/init-repo.sh"

# Default target directory
DEFAULT_TARGET_DIR="/Users/lemmaitt/workspace/obsidian_vault/docs/03_project/00_thedomainai"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

usage() {
    echo "Usage: $0 <repo-name> [options]"
    echo ""
    echo "Options:"
    echo "  --private    Create a private repository (default: public)"
    echo "  --dir DIR    Target directory (default: $DEFAULT_TARGET_DIR)"
    echo ""
    echo "Examples:"
    echo "  $0 my-new-project"
    echo "  $0 my-private-project --private"
    echo "  $0 my-project --dir ~/projects"
    exit 1
}

# Parse arguments
REPO_NAME=""
VISIBILITY="public"
TARGET_DIR="$DEFAULT_TARGET_DIR"

while [[ $# -gt 0 ]]; do
    case $1 in
        --private)
            VISIBILITY="private"
            shift
            ;;
        --dir)
            TARGET_DIR="$2"
            shift 2
            ;;
        -h|--help)
            usage
            ;;
        *)
            if [ -z "$REPO_NAME" ]; then
                REPO_NAME="$1"
            fi
            shift
            ;;
    esac
done

if [ -z "$REPO_NAME" ]; then
    echo "Error: Repository name is required"
    usage
fi

REPO_PATH="$TARGET_DIR/$REPO_NAME"

echo -e "${GREEN}Creating repository: $REPO_NAME${NC}"
echo "  Visibility: $VISIBILITY"
echo "  Location: $REPO_PATH"
echo ""

# Check if directory already exists
if [ -d "$REPO_PATH" ]; then
    echo "Error: Directory already exists: $REPO_PATH"
    exit 1
fi

# Create GitHub repository
echo "📦 Creating GitHub repository..."
gh repo create "$REPO_NAME" --"$VISIBILITY" --clone --description "Created with GitHub Automator"
cd "$REPO_NAME"

# Move to target directory if needed
if [ "$(pwd)" != "$REPO_PATH" ]; then
    cd ..
    mv "$REPO_NAME" "$REPO_PATH"
    cd "$REPO_PATH"
fi

# Initialize with GitHub Automator
echo ""
echo "🔧 Applying GitHub Automator templates..."
"$INIT_SCRIPT" "$REPO_PATH"

# Create initial commit
echo ""
echo "📤 Creating initial commit..."
git add -A
git commit -m "chore: initialize repository with GitHub Automator

- Add Issue templates (feature, bug, task)
- Add PR template
- Add CLAUDE.md with full-auto mode
- Add Claude settings

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>"

# Push to remote
git push -u origin main

echo ""
echo -e "${GREEN}✅ Repository created successfully!${NC}"
echo ""
echo "  Repository: https://github.com/$(gh repo view --json owner,name -q '.owner.login + \"/\" + .name')"
echo "  Local path: $REPO_PATH"
echo ""
echo "Next steps:"
echo "  cd $REPO_PATH"
echo "  claude"
echo "  > \"Add a feature to...\""
