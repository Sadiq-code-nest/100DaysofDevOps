# Day 33: Resolve Git Merge Conflicts

## Task
SSH as `max`. Fix push issues on `story-blog` repo. Ensure `story-index.txt` has all 4 story titles and fix the typo `Mooose` → `Mouse`.

---

## What is a Merge Conflict?
A conflict happens when two people edit the **same part of the same file** differently. Git can't decide which version to keep — so it marks the file and asks you to decide.

**Conflict markers in a file:**
```
<<<<<<< HEAD
The Lion and the Mooose   ← your local version
=======
The Lion and the Mouse    ← incoming version from remote
>>>>>>> origin/master
```

You need to manually edit the file to the correct final state, remove the markers, then commit.

**Typical conflict resolution flow:**
```bash
git pull --rebase origin master   # get remote changes, replay yours on top
# Git stops where conflict exists
vi conflicted-file                # fix the file manually
git add conflicted-file           # mark as resolved
git rebase --continue             # continue the rebase
git push origin master
```

**Why `--rebase` instead of regular pull?**
`git pull` = fetch + merge (creates a merge commit)
`git pull --rebase` = fetch + rebase (keeps history linear, preferred in most teams)

---

## Solution
```bash
ssh max@ststor01
cd /home/max/story-blog
git pull --rebase origin master
vi story-index.txt     # fix all 4 titles, fix "Mooose" → "Mouse"
git add story-index.txt
git rebase --continue
git push origin master
```

---
*Day 33 of 100 | #100DaysOfDevOps #KodeKloud #Git*
