# GitHub Repository Setup Guide

## Table of Contents

- [Creating Repository](#creating-repository)
- [Local Git Setup](#local-git-setup)
- [Configuring Repository](#configuring-repository)
- [Repository Settings](#repository-settings)
- [Collaboration](#collaboration)
- [GitHub Pages (Optional)](#github-pages-optional)
- [Best Practices](#best-practices)

---

## Creating Repository

### Create New Repository on GitHub

1. Go to [github.com/new](https://github.com/new)
2. Fill in repository details:
   - **Repository name:** `seedance-2-skills`
   - **Description:** "15 Prompt Engineering Skills for Seedance 2.0 on Higgsfield — Generate cinematic, commercial, and industry-specific AI video content with precision prompts."
   - **Visibility:** Choose `Public` or `Private`
     - `Public` — Share with community, get contributions
     - `Private` — Keep within team, full access control

3. Do NOT initialize with README (we already have one)
4. Click "Create repository"

---

## Local Git Setup

### Initialize and Configure

Run the provided setup script:

```bash
chmod +x init-repo.sh
./init-repo.sh
```

Or configure manually:

```bash
# Initialize Git repository
git init

# Configure user (if not already set globally)
git config user.name "Your Name"
git config user.email "your.email@example.com"

# Add all files
git add -A

# Create initial commit
git commit -m "chore: Initialize Seedance 2.0 Skills repository

- Add 15 prompt engineering skills for Seedance 2.0 on Higgsfield
- Include setup scripts and documentation"
```

### Add Remote and Push

```bash
# Add remote repository
# Replace USERNAME with your GitHub username
git remote add origin https://github.com/USERNAME/seedance-2-skills.git

# Verify remote was added correctly
git remote -v

# Rename default branch to 'main' (if needed)
git branch -M main

# Push to GitHub for the first time
git push -u origin main
```

#### Generating SSH Key (Alternative to HTTPS)

If you prefer SSH authentication:

```bash
# Generate SSH key (if you don't have one)
ssh-keygen -t ed25519 -C "your.email@example.com"

# Copy public key to GitHub Settings > SSH and GPG keys
cat ~/.ssh/id_ed25519.pub

# Add remote with SSH URL instead
git remote add origin git@github.com:USERNAME/seedance-2-skills.git
```

---

## Configuring Repository

### Repository Settings on GitHub

#### 1. Basic Information

Go to Settings > General:

- **About section:**
  - Add description: "15 AI video prompt engineering skills for Seedance 2.0 on Higgsfield"
  - Add URL: `https://seedance.example.com` (if applicable)

#### 2. Topics

Add relevant topics (Settings > General > Topics):

```
seedance
higgsfield
ai-video
prompt-engineering
video-generation
creative-tools
ai-tools
video-production
```

#### 3. Default Branch

Settings > General > Default branch:
- Set to `main`

#### 4. License

Add appropriate license to repository:

```bash
# View existing license
cat LICENSE

# Or add during initial setup via GitHub web UI
```

Recommended: MIT or Creative Commons (CC BY-SA 4.0)

---

## Repository Settings

### Branch Protection Rules

Protect the `main` branch (Settings > Branches):

1. Click "Add rule"
2. Branch name pattern: `main`
3. Enable:
   - ✓ Require a pull request before merging
   - ✓ Require at least 2 approvals (if team > 2)
   - ✓ Require status checks to pass
   - ✓ Include administrators

This prevents accidental direct commits to main and ensures code review.

### Collaborator Access

Settings > Collaborators > Add people:

1. Search for GitHub username
2. Select role:
   - **Maintain** — Can merge PRs, manage settings
   - **Push** — Can commit directly
   - **Triage** — Can manage issues and PRs
   - **Pull** — Can only read and clone

| Role | Push | Merge | Settings | Admin |
|------|------|-------|----------|-------|
| Admin | ✓ | ✓ | ✓ | ✓ |
| Maintain | ✓ | ✓ | - | - |
| Push | ✓ | - | - | - |
| Triage | - | - | - | - |
| Pull | - | - | - | - |

### Required Reviewers

Settings > Rules > Require pull request reviews:
- Number of required reviews before merge: `1` or `2`
- Dismiss stale pull request approvals: `checked`
- Require code owners review: `checked` (if using CODEOWNERS file)

---

## Collaboration Workflow

### For Team Development

#### 1. Create Feature Branch

```bash
# Update main branch
git checkout main
git pull origin main

# Create feature branch
git checkout -b feature/skill-improvements

# Make changes
git add .
git commit -m "feat: Add enhanced prompts for cinematic skill

- Improved lighting descriptions
- Added lens effect options
- Enhanced depth of field parameters"
```

#### 2. Push and Create Pull Request

```bash
# Push to GitHub
git push -u origin feature/skill-improvements

# Then create PR on GitHub web interface
# 1. Go to your fork
# 2. Click "New Pull Request"
# 3. Compare feature branch with main
# 4. Add description and submit
```

#### 3. Code Review and Merge

After approval:

```bash
# Merge via GitHub web UI or command line
git checkout main
git pull origin main
git merge feature/skill-improvements
git push origin main

# Delete feature branch
git branch -d feature/skill-improvements
git push origin --delete feature/skill-improvements
```

#### 4. Pull Request Template

Create `.github/pull_request_template.md`:

```markdown
## Description
Brief description of changes

## Type
- [ ] Skill enhancement
- [ ] Bug fix
- [ ] Documentation
- [ ] New skill
- [ ] Refactoring

## Changes
- List of specific changes

## Testing
How was this tested?

## Checklist
- [ ] Tests pass
- [ ] Documentation updated
- [ ] No breaking changes
```

---

## GitHub Pages (Optional)

### Enable GitHub Pages

For hosting documentation or portfolio:

1. Settings > Pages
2. Source: `Deploy from a branch`
3. Branch: `main`
4. Folder: `/ (root)` or `/docs`
5. Save

GitHub Pages will be available at: `https://USERNAME.github.io/seedance-2-skills`

### Create Documentation Site

```bash
# Create docs folder
mkdir -p docs

# Add index.html or README.md
echo "# Seedance 2.0 Skills" > docs/index.html

# Commit and push
git add docs/
git commit -m "docs: Add GitHub Pages documentation"
git push origin main
```

---

## Best Practices

### Commit Message Guidelines

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <subject>

<body>

<footer>
```

Types:
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `style:` Code style (formatting)
- `refactor:` Code refactoring
- `test:` Tests
- `chore:` Build, CI, dependencies
- `perf:` Performance improvement

Examples:

```bash
git commit -m "feat(cinematic): Add anamorphic lens options"
git commit -m "fix(3d-cgi): Correct shader parameter documentation"
git commit -m "docs: Update installation instructions"

# Include issue reference
git commit -m "fix(cartoon): Improve cel-shading quality - fixes #42"
```

### Branch Naming

```
feature/skill-name        # New skill or enhancement
bugfix/issue-number       # Bug fix
hotfix/urgent-fix         # Urgent production fix
docs/documentation-topic  # Documentation
refactor/component-name   # Refactoring
```

### .gitignore Configuration

```bash
# Create or update .gitignore
cat > .gitignore << 'EOF'
# System files
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# Node/npm (if using)
node_modules/
npm-debug.log
package-lock.json

# Python (if using)
__pycache__/
*.py[cod]
.Python
venv/

# OS
.env.local
.env.*.local

# Logs
*.log

# Build artifacts
dist/
build/
EOF

git add .gitignore
git commit -m "chore: Add gitignore configuration"
git push origin main
```

### README Best Practices

Ensure your README includes:

- Clear project description
- Installation instructions
- Quick start guide
- Feature list
- Contributing guidelines
- License information

### Regular Maintenance

```bash
# Keep main branch clean
git checkout main
git pull origin main

# Delete old local branches
git branch -d old-branch-name

# Clean up remote branches
git remote prune origin

# Check for merge conflicts
git status
```

---

## Troubleshooting

### Cannot Push?

```bash
# Check remote configuration
git remote -v

# Update remote URL
git remote set-url origin https://github.com/USERNAME/seedance-2-skills.git

# Try pushing again
git push -u origin main
```

### Merge Conflicts?

```bash
# Abort merge if needed
git merge --abort

# Or resolve conflicts manually
# 1. Edit conflicting files
# 2. Mark as resolved
git add .
git commit -m "chore: Resolve merge conflicts"
```

### Forgot to Create .gitignore?

```bash
# Remove previously tracked files
git rm --cached -r .
git add -A
git commit -m "chore: Update gitignore"
```

---

## Additional Resources

- [GitHub Documentation](https://docs.github.com/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [GitHub Flow Guide](https://guides.github.com/introduction/flow/)
- [Markdown Syntax](https://www.markdownguide.org/)
- [Pro Git Book](https://git-scm.com/book/en/v2)

---

**Happy coding!**

For questions or issues, please create a GitHub Issue with detailed information.
