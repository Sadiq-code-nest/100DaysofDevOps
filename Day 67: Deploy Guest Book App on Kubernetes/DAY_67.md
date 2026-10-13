# Day 67: Deploy Guest Book App on Kubernetes

## Task
Deploy a full three-tier Guestbook application — Redis master, Redis slaves, PHP frontend — with 7 separate Kubernetes resources across 3 deployments and 4 services.

---

## Architecture

```
User → NodePort 30009 → frontend service
                              ↓
                    frontend deployment (3 pods, PHP)
                              ↓
                    redis-slave service / redis-follower service
                              ↓
                    redis-slave deployment (2 pods)
                              ↓
                    redis-master service
                              ↓
                    redis-master deployment (1 pod)
```

The frontend reads from Redis slaves (via DNS), writes go to Redis master. This is a classic master-replica read scaling pattern.

---

## Key Concepts

### Master-Replica Redis pattern
One master handles all writes. Two replicas sync from the master and handle reads. This spreads read load and provides redundancy.

### Two services for slave pods (`redis-slave` + `redis-follower`)
Both services select `app: redis-slave` — they point to the same pods. This is intentional: the frontend uses `redis-follower` for reads by convention in the Guestbook app. Having separate service names lets you route read/write traffic differently without changing the underlying pods.

### `GET_HOSTS_FROM: dns`
Both the slave and frontend containers use this env var. When set to `dns`, the app resolves backend hostnames using Kubernetes DNS (service names like `redis-master`) instead of hardcoded IPs. This is the correct approach in Kubernetes — service IPs can change, DNS names don't.

### Image digest pinning (`@sha256:...`)
The frontend uses a specific image digest instead of a tag:
```
gcr.io/google-samples/gb-frontend@sha256:a908df...
```
A tag like `:latest` can change over time. A digest is immutable — you always get exactly that image version. Useful for reproducible deployments.

---

## Files

| File | Resource |
|------|---------|
| `redis-master-deployment.yml` | Redis master (1 replica) |
| `redis-master-service.yml` | ClusterIP service for master |
| `redis-slave-deployment.yml` | Redis slaves (2 replicas) |
| `redis-slave-service.yml` | ClusterIP service for slaves |
| `redis-follower-service.yml` | Second service for slaves (read path) |
| `frontend-deployment.yml` | PHP frontend (3 replicas) |
| `frontend-service.yml` | NodePort service on 30009 |

---

## Solution

```bash
kubectl apply -f redis-master-deployment.yml
kubectl apply -f redis-master-service.yml
kubectl apply -f redis-slave-deployment.yml
kubectl apply -f redis-slave-service.yml
kubectl apply -f redis-follower-service.yml
kubectl apply -f frontend-deployment.yml
kubectl apply -f frontend-service.yml

kubectl get deployments
kubectl get pods       # expect 6 pods Running
kubectl get svc        # expect 4 services
```

| Deployment | Expected |
|-----------|---------|
| `redis-master` | 1/1 |
| `redis-slave` | 2/2 |
| `frontend` | 3/3 |

---
*Day 67 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
