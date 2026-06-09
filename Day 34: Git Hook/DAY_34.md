# Day 34: Git Hook

## Task
Merge `feature` into `master` in `/usr/src/kodekloudrepos/games`. Create a `post-update` hook that automatically creates a release tag `release-YYYY-MM-DD` whenever master is pushed. Test it and push.

---

## What are Git Hooks?
Git hooks are scripts that run automatically at specific points in the Git workflow. They live in `.git/hooks/` and must be executable.

**Common hooks:**
| Hook | When it runs | Common use |
|------|-------------|-----------|
| `pre-commit` | Before commit is created | Run linter, tests |
| `commit-msg` | After commit message is written | Enforce message format |
| `post-merge` | After a merge | Run build or notify |
| `post-update` | After refs are updated on remote | Create tags, trigger CI |

**post-update vs post-receive:**
- `post-receive` → runs on the receiving (remote) side after push
- `post-update` → similar, also server-side, receives ref names as arguments

**Hook file requirements:**
- Must be in `.git/hooks/`
- Must be executable: `chmod +x`
- Named exactly — no `.sh` extension

**Date formatting:**
```bash
date +%F        # outputs: 2024-06-15 (YYYY-MM-DD)
date +%Y-%m-%d  # same result
```

---

## Solution
```bash
cd /usr/src/kodekloudrepos/games
git checkout master && git merge feature

cat > .git/hooks/post-update << 'EOF'
#!/bin/bash
while read oldrev newrev ref; do
    branch=$(echo $ref | sed 's|refs/heads/||')
    if [ "$branch" == "master" ]; then
        git tag -f release-$(date +%F)
    fi
done
EOF

chmod +x .git/hooks/post-update
git push origin master
git tag     # confirm release tag exists
git push origin --tags
```

---
*Day 34 of 100 | #100DaysOfDevOps #KodeKloud #Git*
