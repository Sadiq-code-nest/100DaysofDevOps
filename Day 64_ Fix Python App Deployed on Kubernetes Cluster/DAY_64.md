# Day 64: Fix Python App Deployed on Kubernetes Cluster

## Task
The `python-deployment-xfusion` deployment is broken. Pods are failing. Find and fix the misconfiguration so the Flask app is accessible on nodePort `32345`.

---

## Two bugs, one fix each

### Bug 1 — Wrong image name

```
image: poroko/flask-app-demo    ← doesn't exist on Docker Hub
image: poroko/flask-demo-app    ← correct name
```

Result: `ImagePullBackOff` — Kubernetes can't pull the image because the name is wrong.

**Fix:**
```bash
kubectl edit deployment python-deployment-xfusion
# change the image line, save
```

Kubernetes immediately creates a new ReplicaSet with the corrected image. Old pods terminate, new pod starts pulling the right image.

### Bug 2 — Wrong targetPort in service

Flask runs on port `5000` by default. If the service points to any other port, traffic reaches the service but gets nowhere inside the container.

**Fix:**
```bash
kubectl edit svc python-service-xfusion
# ensure:
#   port: 5000
#   targetPort: 5000
#   nodePort: 32345
```

---

## Debugging flow for broken K8s apps

```
kubectl get pods                     # what's the status?
kubectl describe pod <name>          # WHY is it that status?
kubectl logs <name>                  # if running but misbehaving
kubectl get svc                      # is the service pointing correctly?
```

`describe` is the most important command here — the **Events** section at the bottom tells you exactly what went wrong and when.

## `kubectl edit` vs applying a fixed YAML

`kubectl edit` opens the live object in your editor — useful for quick one-line fixes without maintaining a separate file. Changes are applied the moment you save. For a misconfigured resource that already exists, it's the fastest path.

---

## Solution

```bash
kubectl get all | grep python
kubectl describe pod <pod-name>

kubectl edit deployment python-deployment-xfusion
# fix: poroko/flask-app-demo → poroko/flask-demo-app

kubectl edit svc python-service-xfusion
# fix: targetPort: 5000, nodePort: 32345

kubectl get pods   # confirm 1/1 Running
```

> No manifest files for this task — the resources already exist in the cluster.

---
*Day 64 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
