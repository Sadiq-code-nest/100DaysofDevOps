# Day 54: Kubernetes Shared Volumes

## Task
Create pod `volume-share-nautilus` with two `debian:latest` containers sharing a volume. Container 1 mounts it at `/tmp/beta`, container 2 at `/tmp/apps`. Write a file from container 1 and verify it's visible in container 2.

---

## Sharing Volumes Between Containers in a Pod

All containers in a pod share the same network namespace — they can reach each other on `localhost`. But they don't share the filesystem by default. To share files, you mount a **shared volume** into both containers.

```
Pod: volume-share-nautilus
├── Container 1 → /tmp/beta  ←─┐
├── Container 2 → /tmp/apps  ←─┘  same volume, different mount paths
└── Volume: volume-share (emptyDir)
```

When container 1 writes a file to `/tmp/beta/`, container 2 immediately sees it at `/tmp/apps/` — same underlying storage, different paths.

## emptyDir — the simplest shared volume
```yaml
volumes:
  - name: volume-share
    emptyDir: {}
```
- Created empty when the pod starts
- Shared between all containers that mount it
- Deleted when the pod is deleted
- Lives in the node's memory/disk, not persistent

**Use cases for emptyDir:**
- Temporary scratch space
- Sharing data between a main container and a sidecar (log shipper, proxy)
- Cache that should reset on restart

## Why `sleep infinity`?
Containers exit when their main process exits. `debian` has no long-running process by default — it would start and immediately stop. `sleep infinity` keeps it alive so you can exec into it and test.

```yaml
command: ["sleep", "infinity"]
```

Alternatives: `["tail", "-f", "/dev/null"]` or `["sh", "-c", "while true; do sleep 3600; done"]`

## Exec into a specific container
```bash
kubectl exec pod-name -c container-name -- command
# -c is required when a pod has multiple containers
```

---

## Solution
```yaml
# volume-share-nautilus.yml
volumes:
  - name: volume-share
    emptyDir: {}
# Container 1: mountPath /tmp/beta
# Container 2: mountPath /tmp/apps
```

```bash
kubectl apply -f volume-share-nautilus.yml
kubectl exec volume-share-nautilus -c volume-container-nautilus-1 -- \
  bash -c "echo 'Welcome to xFusionCorp Industries' > /tmp/beta/beta.txt"
kubectl exec volume-share-nautilus -c volume-container-nautilus-2 -- \
  cat /tmp/apps/beta.txt
```

---
*Day 54 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
