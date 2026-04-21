#!/bin/bash

################################################################################
# init-repo.sh - Initialize Seedance 2.0 Skills Repository for GitHub
# Seedance 2.0 × Higgsfield | 15 Prompt Engineering Skills
#
# Function Description:
# This script initializes a new Git repository, adds all files, and creates an
# initial commit.
#
# Usage:
#   chmod +x init-repo.sh
#   ./init-repo.sh
#
# Note:
# After script completion, you need to manually add remote and push to GitHub
################################################################################

set -e

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Print colored messages
print_header() {
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
}

print_info() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Check if already in a Git repo
if [ -d .git ]; then
    print_error "Git repository already initialized in this directory"
    echo "Run 'rm -rf .git' to reset if needed"
    exit 1
fi

# Start initialization
print_header "Initializing Seedance 2.0 Skills Repository"
echo ""

# Initialize Git repository
print_info "Initializing Git repository..."
git init

# Configure Git user info if not set
if [ -z "$(git config user.name)" ]; then
    print_warning "Git user.name not set. Please configure:"
    echo "  git config user.name 'Your Name'"
    echo "  git config user.email 'your.email@example.com'"
    echo ""
    echo "Or use --global flag:"
    echo "  git config --global user.name 'Your Name'"
    echo "  git config --global user.email 'your.email@example.com'"
    echo ""
fi

# Add all files
print_info "Adding all files to staging area..."
git add -A

# Show files to be committed
echo ""
echo "Files to be committed:"
git diff --cached --name-status | sed 's/^/  /'
echo ""

# Create initial commit
print_info "Creating initial commit..."
git commit -m "chore: Initialize Seedance 2.0 Skills repository

- Add 15 prompt engineering skills for Seedance 2.0 on Higgsfield
- Include setup scripts and documentation
- Creative Styles: Cinematic, 3D CGI, Cartoon, Comic-to-Video, Fight Scenes
- Motion & Ads: Motion Design, E-commerce, Anime Action, Product 360, Music Video
- Commercial: Social Hook, Brand Story, Fashion, Food & Beverage, Real Estate

Co-Authored-By: Seedance Team <team@seedance.com>"

echo ""
print_header "Repository Initialized Successfully"
echo ""

# Show next steps
echo "Next Steps:"
echo ""
echo "1. Create a new repository on GitHub:"
echo "   https://github.com/new"
echo ""
echo "2. Add the remote repository:"
echo "   ${YELLOW}git remote add origin https://github.com/YOUR_USERNAME/seedance-2-skills.git${NC}"
echo ""
echo "3. Rename default branch (if needed):"
echo "   ${YELLOW}git branch -M main${NC}"
echo ""
echo "4. Push to GitHub:"
echo "   ${YELLOW}git push -u origin main${NC}"
echo ""
echo "5. Configure repository settings on GitHub:"
echo "   - Add repository description"
echo "   - Add topics: 'seedance', 'ai-video', 'prompt-engineering', 'higgsfield'"
echo "   - Enable GitHub Pages if desired"
echo ""

# Show current status
echo "Current Status:"
git log --oneline | head -1 | sed 's/^/  /'
echo ""
print_info "Setup script complete!"
