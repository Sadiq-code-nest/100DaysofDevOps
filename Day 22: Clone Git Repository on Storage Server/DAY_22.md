# Day 22: Clone Git Repository on Storage Server

## Task
Clone the repository at `/opt/official.git` into `/usr/src/kodekloudrepos` as the `natasha` user. Do not change any permissions or existing directories.

---

## What is git clone?
`git clone` copies a repository — its files, history, branches — to a new location. The source can be a local path or a remote URL.

```bash
git clone /local/path/repo.git     # local bare repo
git clone https://github.com/...   # remote over HTTPS
git clone git@github.com/...       # remote over SSH
```

After cloning, the original is automatically set as `origin` remote — so `git pull` and `git push` know where to go.

**Why clone a local bare repo?**
In KodeKloud labs, the "remote" server is simulated with a bare repo on the same machine. Cloning it locally mimics real team workflows.

---

## Solution
```bash
sudo su - natasha
cd /usr/src/kodekloudrepos
git clone /opt/official.git
ls /usr/src/kodekloudrepos/official
```

---
*Day 22 of 100 | #100DaysOfDevOps #KodeKloud #Git*
