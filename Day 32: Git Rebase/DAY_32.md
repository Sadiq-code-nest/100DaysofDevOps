# Day 32: Git Rebase

## Task
Rebase the `feature` branch on top of `master` in `/usr/src/kodekloudrepos/official`. No merge commits. Push the updated feature branch.

---

## Rebase vs Merge — the core difference

Both bring changes from one branch to another, but the history looks very different:

**Merge:**
```
master:   A → B → C
feature:  A → B → D → E
                        ↓ merge
master:   A → B → C → M (merge commit)
                ↗
          D → E
```

**Rebase:**
```
master:   A → B → C
feature:  A → B → D → E
                    ↓ rebase onto master
feature:  A → B → C → D' → E'  (linear, no merge commit)
```

Rebase replays your commits on top of the latest master — as if you branched off from C, not B. The result is a **clean, linear history** with no merge commits.

**When to use which:**
- `merge` → preserve full history, show when branches diverged
- `rebase` → clean linear history before merging a PR (most teams prefer this)

**Golden rule:** Never rebase shared/public branches that others are working on. Only rebase your own local/feature branches.

---

## Solution
```bash
cd /usr/src/kodekloudrepos/official
git checkout feature
git fetch origin
git rebase origin/master
# if conflicts: fix → git add → git rebase --continue
git push origin feature --force
```

---
*Day 32 of 100 | #100DaysOfDevOps #KodeKloud #Git*
