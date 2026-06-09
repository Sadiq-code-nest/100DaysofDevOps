# Day 30: Git hard reset

## Task
In `/usr/src/kodekloudrepos/demo`, reset commit history so only two commits remain: `initial commit` and `add data.txt file`. Push the result.

---

## What is git reset --hard?
`git reset` moves the branch pointer backward to a previous commit. With `--hard`, it also wipes all changes after that point — both staged and unstaged.

```
Before:  initial → add data.txt → test1 → test2 (HEAD)
                        ↑
                  reset --hard here
After:   initial → add data.txt (HEAD)   ← test1, test2 gone
```

**Three reset modes:**
| Mode | Commits | Staged files | Working files |
|------|---------|-------------|--------------|
| `--soft` | Removed | Kept staged | Kept |
| `--mixed` (default) | Removed | Unstaged | Kept |
| `--hard` | Removed | Gone | Gone |

**Why force push after reset?**
Your local history is now behind the remote (remote still has the extra commits). A normal push is rejected. `--force` overwrites the remote with your local state.

Only do `--force` on branches you own or with team agreement — it rewrites shared history.

---

## Solution
```bash
cd /usr/src/kodekloudrepos/demo
git log --oneline                    # find hash of "add data.txt file"
git reset --hard <commit-hash>
git push origin master --force
git log --oneline                    # confirm only 2 commits remain
```

---
*Day 30 of 100 | #100DaysOfDevOps #KodeKloud #Git*
