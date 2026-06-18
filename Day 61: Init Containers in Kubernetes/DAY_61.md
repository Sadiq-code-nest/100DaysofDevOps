# Day 61: Init Containers in Kubernetes

## Task
Create deployment `ic-deploy-xfusion` with an init container that writes a message to a shared volume, and a main container that continuously reads and prints it.

---

## What is an Init Container?
An init container runs **before** the main container starts — and must complete successfully first. If it fails, Kubernetes retries it until it succeeds (or the pod fails).

```
Pod starts
   ↓
init container runs → writes to /ic/media → exits 0
   ↓
main container starts → reads /ic/media every 5s
```

**Init vs regular containers:**

| | Init Container | Main Container |
|--|---------------|----------------|
| Runs | Before main starts | After all inits complete |
| Must complete | Yes, exit 0 | Runs continuously |
| Can run in parallel | No (sequential) | Yes |
| Use case | Setup, wait, pre-config | The actual application |

**Common init container use cases:**
- Wait for a database to be ready before starting the app
- Download config files or certificates
- Set up permissions on a shared volume
- Run database migrations

## How they share data
Both containers mount the same `emptyDir` volume at `/ic`. The init container writes a file there; the main container reads it. The volume persists for the pod's lifetime — not across pod restarts.

## Lifecycle order matters
Kubernetes guarantees: all init containers complete (in order) → then all main containers start. You can have multiple init containers — they run sequentially, one after another.

---

## Files
- `deployment.yml` — full deployment manifest
- `solution.sh` — apply and verify commands

## Solution
```bash
kubectl apply -f deployment.yml
kubectl get pods
kubectl logs <pod-name>
# Output: Init Done - Welcome to xFusionCorp Industries
```

---
*Day 61 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
