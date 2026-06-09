# Day 21: Set Up Git Repository on Storage Server

## Task
Install `git` on the Storage Server and create a **bare repository** at `/opt/beta.git`.

---

## What is a Bare Repository?
A regular repo has a working directory (files you edit). A bare repo has **no working directory** — it's just the `.git` internals. It's used as a **central shared repo** that developers push to and pull from.

```
Regular repo:  project/.git/ + actual files
Bare repo:     beta.git/     (only git internals — no working files)
```

When you run `git init --bare`, Git creates the repo directly as the database — this is exactly how GitHub/GitLab stores repos on their servers.

```bash
git init --bare /opt/beta.git
# vs
git init /opt/beta    # regular repo
```

---

## Solution
```bash
ssh natasha@ststor01
sudo yum install -y git
sudo git init --bare /opt/beta.git
ls /opt/beta.git   # should show: HEAD branches config hooks objects refs
```

---
*Day 21 of 100 | #100DaysOfDevOps #KodeKloud #Git*
