# Day 23: Fork a Git Repository

## Task
Login to Gitea as `jon` and fork the repository `sarah/story-blog` under the `jon` user.

---

## What is Forking?
A **fork** is a personal copy of someone else's repository. You get your own version to modify freely, without affecting the original. This is the foundation of open-source contribution workflows.

```
sarah/story-blog  (original)
       ↓ fork
jon/story-blog    (your copy — fully independent)
```

**Fork vs Clone:**
| | Fork | Clone |
|--|------|-------|
| Where | Server-side (GitHub/Gitea) | Local machine |
| Purpose | Your own remote copy | Work locally |
| Linked to original | Yes (can PR back) | Just a download |

In real open-source work: fork first on GitHub, then clone your fork locally, make changes, push to your fork, then open a Pull Request to the original.

---

## Solution
This is a UI-only task:

1. Open Gitea UI
2. Login as `jon` / `Jon_pass123`
3. Navigate to `sarah/story-blog`
4. Click **Fork** → owner: `jon`
5. Confirm: `jon/story-blog` now exists

> Take a screenshot for proof — KodeKloud reviewers may ask for it.

---
*Day 23 of 100 | #100DaysOfDevOps #KodeKloud #Git*
