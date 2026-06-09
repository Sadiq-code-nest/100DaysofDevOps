# Day 31: Git Stash

## Task
In `/usr/src/kodekloudrepos/news`, find the stashed changes and restore `stash@{1}`. Commit and push to origin.

---

## What is Git Stash?
Stash is a temporary shelf for your uncommitted work. When you need to switch tasks mid-way — without committing incomplete code — you stash your changes and come back later.

```bash
git stash           # saves all uncommitted changes, cleans working dir
git stash list      # see all stashed entries
git stash apply     # restore latest stash (keeps stash in list)
git stash pop       # restore latest stash + remove from list
git stash apply stash@{1}   # restore a specific stash by index
git stash drop stash@{1}    # delete a specific stash
```

**Stash list looks like:**
```
stash@{0}: WIP on master: abc123 latest message
stash@{1}: WIP on master: def456 older message
stash@{2}: WIP on feature: ghi789 even older
```

`stash@{0}` is always the most recent. `stash@{1}` is one before that.

`apply` restores the changes but leaves the stash entry. `pop` restores and removes it. Use `apply` when you're not sure yet — you can always drop it after.

---

## Solution
```bash
cd /usr/src/kodekloudrepos/news
git stash list
git stash apply stash@{1}
git add .
git commit -m "Restored stash@{1} changes"
git push origin master
```

---
*Day 31 of 100 | #100DaysOfDevOps #KodeKloud #Git*
