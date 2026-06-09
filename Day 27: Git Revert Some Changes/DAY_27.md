# Day 27: Git Revert Some Changes

## Task
In `/usr/src/kodekloudrepos/ecommerce`, revert the latest commit (HEAD) to the previous one. Use `revert ecommerce` as the commit message (all lowercase).

---

## git revert vs git reset

This is one of the most important Git concepts to get right:

| Command | What it does | Safe for shared repos? |
|---------|-------------|----------------------|
| `git revert HEAD` | Creates a new commit that undoes HEAD | Yes — history preserved |
| `git reset --hard` | Deletes commits, rewrites history | No — dangerous on shared branches |

**Revert is the professional way** to undo pushed commits. It doesn't remove the bad commit — it adds a new commit that does the opposite. History stays intact, teammates aren't affected.

```
Before:  A → B → C (HEAD, bad commit)
After:   A → B → C → D (D reverts C's changes)
```

**How it works:**
```bash
git revert HEAD         # opens editor for commit message
# change first line to your message, save and quit
git revert HEAD --no-edit   # skips editor, uses default message
```

---

## Solution
```bash
cd /usr/src/kodekloudrepos/ecommerce
git checkout master
git log --oneline          # see current commits
git revert HEAD            # editor opens — set message: revert ecommerce
git log --oneline          # confirm new revert commit
git push origin master
```

---
*Day 27 of 100 | #100DaysOfDevOps #KodeKloud #Git*
