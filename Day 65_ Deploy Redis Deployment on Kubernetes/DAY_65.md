# Day 65: Deploy Redis Deployment on Kubernetes

## Task
Deploy Redis on Kubernetes with a ConfigMap-backed config, two volume mounts (data + config), CPU request, and port 6379 exposed.

---

## What is a ConfigMap?
A ConfigMap stores non-sensitive configuration data as key-value pairs. Pods can consume it as environment variables or as mounted files — which is what this task does.

```yaml
data:
  redis-config: |       # key name
    maxmemory 2mb       # value — mounted as a file inside the container
```

When mounted as a volume, each key in the ConfigMap becomes a **file** in the mount path. So `redis-config` key → `/redis-master/redis-config` file inside the container.

## Two volumes in this deployment

| Volume | Type | Mount path | Purpose |
|--------|------|-----------|---------|
| `data` | `emptyDir` | `/redis-master-data` | Redis data storage (ephemeral) |
| `redis-config` | `configMap` | `/redis-master` | Injects `redis-config` file from ConfigMap |

## CPU request: `"1"`
```yaml
resources:
  requests:
    cpu: "1"    # 1 full CPU core reserved for scheduling
```
No limit is set — the container can burst above 1 CPU if the node has spare capacity. The request only affects where Kubernetes schedules the pod.

## Order of apply matters
The ConfigMap must exist before the Deployment — Kubernetes validates that referenced ConfigMaps exist when the pod is created. If the ConfigMap is missing, the pod stays in `Pending`.

```bash
kubectl apply -f redis-configmap.yml    # first
kubectl apply -f redis-deployment.yml   # second
```

## Files
| File | Resource |
|------|---------|
| `redis-configmap.yml` | ConfigMap `my-redis-config` |
| `redis-deployment.yml` | Deployment `redis-deployment` |

---

## Solution

```bash
kubectl apply -f redis-configmap.yml
kubectl apply -f redis-deployment.yml

kubectl get deployment redis-deployment
kubectl get pods -l app=redis

# Verify config is mounted correctly
kubectl exec -it $(kubectl get pod -l app=redis -o jsonpath='{.items[0].metadata.name}') \
  -- cat /redis-master/redis-config
# Output: maxmemory 2mb
```

---
*Day 65 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes #Redis*
