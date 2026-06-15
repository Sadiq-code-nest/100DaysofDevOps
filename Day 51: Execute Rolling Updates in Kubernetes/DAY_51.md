# Day 51: Execute Rolling Updates in Kubernetes

## Task
Update the `nginx-deployment` to use image `nginx:1.19`. Ensure all pods are running after the update.

---

## What is a Rolling Update?
A rolling update replaces old pods with new ones **gradually** — a few at a time — so the application stays available during the update. Zero downtime.

```
Before:  pod-v1  pod-v1  pod-v1
During:  pod-v2  pod-v1  pod-v1   ← one replaced
         pod-v2  pod-v2  pod-v1   ← two replaced
After:   pod-v2  pod-v2  pod-v2   ← all updated
```

**How it works under the hood:**
Kubernetes creates a new ReplicaSet with the updated image, scales it up while scaling down the old one — controlled by `maxSurge` and `maxUnavailable` settings in the deployment strategy.

**The command:**
```bash
kubectl set image deployment/<name> <container-name>=<new-image>
#                                    ↑ must match container name in spec
```

Get the container name if you don't know it:
```bash
kubectl get deployment nginx-deployment \
  -o jsonpath="{.spec.template.spec.containers[*].name}"
```

**Rollout commands:**
```bash
kubectl rollout status deployment/name    # watch progress
kubectl rollout history deployment/name  # see all versions
kubectl rollout undo deployment/name     # roll back
```

---

## Solution
```bash
kubectl get deployment nginx-deployment -o jsonpath="{.spec.template.spec.containers[*].name}"
kubectl set image deployment/nginx-deployment nginx=nginx:1.19
kubectl rollout status deployment/nginx-deployment
kubectl get pods
```

---
*Day 51 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
