# Day 29: Manage Git Pull Requests

## Task
Max has pushed his story to `story/fox-and-grapes` branch. Create a Pull Request to merge it into `master`, assign `tom` as reviewer, then approve and merge as `tom`.

---

## What is a Pull Request?
A Pull Request (PR) is a request to merge your branch into another branch — with a built-in review process. It's how teams ensure code is checked before it reaches the main branch.

```
story/fox-and-grapes  →  [PR created]  →  review  →  merge  →  master
```

**Why PRs matter:**
- Code is reviewed before merging — catches bugs early
- Discussion happens on the PR — context is preserved
- Master stays clean and stable — only reviewed code lands

**PR Workflow:**
```
Developer pushes branch
        ↓
Creates PR (source → destination)
        ↓
Assigns reviewer
        ↓
Reviewer approves (or requests changes)
        ↓
Merge into master
```

This is the standard workflow in every real software team.

---

## Solution (Gitea UI)

**As max:**
1. Gitea → Pull Requests → New PR
2. Source: `story/fox-and-grapes` | Destination: `master`
3. Title: `Added fox-and-grapes story`
4. Create PR → Reviewers → Add: `tom`

**As tom:**
1. Logout max, login tom / `Tom_pass123`
2. Open the PR → Review → Approve → Merge

> Take screenshots — KodeKloud may require them as proof.

---
*Day 29 of 100 | #100DaysOfDevOps #KodeKloud #Git*
