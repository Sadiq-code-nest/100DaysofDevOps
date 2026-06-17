# Day 59: Troubleshoot Deployment Issues in Kubernetes

## Task
The `redis-deployment` is broken — pods are not running. Find the root cause and fix it.

---

## The Troubleshooting Mindset in Kubernetes

Always start with `describe` — it shows events that tell you exactly what failed and why.

```bash
kubectl get pods                   # see status at a glance
kubectl describe pod <pod-name>    # read the Events section at the bottom
kubectl logs <pod-name>            # if pod started but app crashed
```

**Common pod failure states:**

| Status | Meaning | Usual cause |
|--------|---------|------------|
| `ImagePullBackOff` | Can't pull the image | Wrong image name or tag |
| `ErrImagePull` | Initial image pull failure | Typo in image, no internet |
| `CrashLoopBackOff` | Container starts then crashes | App error, bad config |
| `Pending` | Pod scheduled but not started | No nodes with enough resources |
| `Error` | Container exited with non-zero code | App or config issue |

## Root Cause in This Task

Two bugs introduced by the team member:

**Bug 1 — Typo in ConfigMap name:**
```yaml
# Wrong:
name: redis-cofig   ← typo

# Correct:
name: redis-config
```
Kubernetes can't find a ConfigMap with the wrong name → pod can't start.

**Bug 2 — Wrong image tag:**
```yaml
# Wrong:
image: redis:alpin   ← typo

# Correct:
image: redis:alpine
```
Docker Hub has no image called `redis:alpin` → `ImagePullBackOff`.

## Two ways to fix image without editing YAML

```bash
# Fast: one command
kubectl set image deployment/redis-deployment redis-container=redis:alpine

# Full control: opens editor
kubectl edit deployment redis-deployment
```

`kubectl edit` opens the live resource in your default editor — changes save immediately on exit. Useful when you need to fix multiple things at once.

---

## Solution
```bash
kubectl get pods
kubectl describe pod <pod-name>     # find the two bugs
kubectl edit deployment redis-deployment
# fix: redis-cofig → redis-config
# fix: redis:alpin → redis:alpine
kubectl rollout restart deployment redis-deployment
kubectl get pods                    # confirm Running
```

---
*Day 59 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
