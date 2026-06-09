# Day 24: Git Create Branches

## Task
In `/usr/src/kodekloudrepos/news`, create a new branch `xfusioncorp_news` from `master`. Do not modify any code.

---

## What is a Branch?
A branch is an independent line of development — a pointer to a specific commit. Creating a branch lets you work on new features without touching the main/stable code.

```
master:  A → B → C
                  ↘
xfusioncorp_news:  D → E  (new work, doesn't affect master)
```

**Key commands:**
```bash
git branch                    # list branches (* = current)
git checkout -b new-branch    # create + switch in one step
git checkout existing-branch  # switch to existing branch
git branch new-branch         # create only, don't switch
```

`git checkout -b` = `git branch` + `git checkout` combined. In newer Git you can also use `git switch -c new-branch`.

---

## Solution
```bash
ssh natasha@ststor01
cd /usr/src/kodekloudrepos/news
git checkout master
git checkout -b xfusioncorp_news
git branch   # confirm new branch exists
```

---
*Day 24 of 100 | #100DaysOfDevOps #KodeKloud #Git*
