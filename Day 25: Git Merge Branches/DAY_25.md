# Day 25: Git Merge Branches

## Task
In `/usr/src/kodekloudrepos/demo`, create branch `devops` from `master`, add `/tmp/index.html`, commit, push both branches, then merge `devops` back into `master`.

---

## What is git merge?
Merging brings the changes from one branch into another. After merging `devops` into `master`, master has everything from both.

```
master:  A → B
devops:  A → B → C (index.html added)
                  ↓ git merge devops
master:  A → B → C  (now has index.html too)
```

**Merge types:**
| Type | When | What happens |
|------|------|-------------|
| Fast-forward | No new commits on master since branch | Master pointer just moves forward |
| 3-way merge | Both branches have new commits | Git creates a merge commit |

**Typical workflow:**
```bash
git checkout -b feature     # work on feature
git add . && git commit     # commit your work
git checkout master         # go back
git merge feature           # bring feature into master
git push origin master      # push
```

---

## Solution
```bash
cd /usr/src/kodekloudrepos/demo
git checkout -b devops
cp /tmp/index.html .
git add index.html
git commit -m "Added index.html in devops branch"
git push origin devops
git checkout master
git merge devops
git push origin master
```

---
*Day 25 of 100 | #100DaysOfDevOps #KodeKloud #Git*
