# Day 28: Git Cherry Pick

## Task
In `/usr/src/kodekloudrepos/blog`, pick only the commit with message `Update info.txt` from the `feature` branch and apply it to `master` — without merging the entire feature branch.

---

## What is Cherry Pick?
Cherry picking lets you take **one specific commit** from any branch and apply it to your current branch. You're picking just that one "cherry" — not the whole tree.

```
feature:  A → B → C (Update info.txt) → D → E
                   ↓ cherry-pick
master:   A → B → C' (only this commit copied)
```

**When to use it:**
- A hotfix was made on a feature branch and needs to go to production now
- One specific improvement is ready but the rest of the feature isn't
- You want to backport a fix to an older release branch

```bash
git cherry-pick <commit-hash>          # apply one commit
git cherry-pick abc123 def456          # apply multiple commits
git cherry-pick abc123..def456         # apply a range
```

---

## Solution
```bash
cd /usr/src/kodekloudrepos/blog
git checkout feature
git log --oneline          # find hash of "Update info.txt"
git checkout master
git cherry-pick <hash>
git push origin master
git log --oneline          # confirm commit appears on master
```

---
*Day 28 of 100 | #100DaysOfDevOps #KodeKloud #Git*
