# Day 52: Revert Deployment to Previous Version in Kubernetes

## Task
Roll back `nginx-deployment` to the previous revision after a bad release.

---

## What is a Rollback?
Every time you update a Deployment, Kubernetes saves the previous state as a **revision**. If something breaks, you can instantly go back.

```
Revision 1: nginx:1.18  (original)
Revision 2: nginx:1.19  (bad update)
                ↓ rollback
Active: nginx:1.18  (revision 1 restored)
```

**Rollback commands:**
```bash
kubectl rollout undo deployment/name               # go back one revision
kubectl rollout undo deployment/name --to-revision=1  # go to a specific revision
kubectl rollout history deployment/name            # see all saved revisions
```

**How many revisions are saved?**
Controlled by `revisionHistoryLimit` in the Deployment spec (default: 10). You can tune this — set it lower to save memory, higher if you need more rollback options.

**Why Kubernetes rollbacks are safe:**
The rollback is itself a rolling update — it swaps pods gradually just like a forward update. The app stays up the whole time.

**Verify the rollback worked:**
```bash
kubectl rollout history deployment/nginx-deployment
# REVISION 3 will appear — pointing back to nginx:1.18
kubectl get pods -o jsonpath="{.items[*].spec.containers[*].image}"
```

---

## Solution
```bash
kubectl rollout undo deployment/nginx-deployment
kubectl rollout status deployment/nginx-deployment
kubectl rollout history deployment/nginx-deployment
```

---
*Day 52 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
