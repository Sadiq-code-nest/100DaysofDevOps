# Day 26: Git Manage Remotes

## Task
In `/usr/src/kodekloudrepos/games`, add a new remote `dev_games` pointing to `/opt/xfusioncorp_games.git`. Copy `/tmp/index.html`, commit, and push master to the new remote.

---

## What is a Git Remote?
A remote is a reference to another copy of the repository — usually on a server. You can have multiple remotes pointing to different locations.

```bash
git remote -v               # list all remotes
git remote add name url     # add a new remote
git remote remove name      # remove a remote
git remote rename old new   # rename a remote
```

**Why multiple remotes?**
- `origin` = main team server (GitHub/GitLab)
- `dev_games` = separate backup or staging server
- `upstream` = original repo when working on a fork

```bash
git push origin master      # push to main server
git push dev_games master   # push to secondary remote
```

You choose which remote to push to per command — very useful for mirroring or deploying to multiple environments.

---

## Solution
```bash
cd /usr/src/kodekloudrepos/games
git checkout master
git remote add dev_games /opt/xfusioncorp_games.git
cp /tmp/index.html .
git add index.html
git commit -m "Added index.html file"
git push dev_games master
git remote -v   # confirm both remotes
```

---
*Day 26 of 100 | #100DaysOfDevOps #KodeKloud #Git*
