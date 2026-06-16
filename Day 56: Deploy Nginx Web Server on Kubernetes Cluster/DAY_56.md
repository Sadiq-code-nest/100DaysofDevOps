# Day 56: Deploy Nginx Web Server on Kubernetes Cluster

## Task
Create a `nginx-deployment` with 3 replicas using `nginx:latest`. Container name: `nginx-container`. Expose it via a `NodePort` service named `nginx-service` on nodePort `30011`.

---

## Deployment + Service — the standard Kubernetes web app pattern

A Deployment manages your pods. A Service exposes them. Together they form the foundation of almost every app running in Kubernetes.

```
Internet
   ↓
NodePort Service (port 30011 on every node)
   ↓
Deployment (3 nginx pods, load balanced)
```

## Service Types

| Type | Accessible from | Use case |
|------|----------------|---------|
| `ClusterIP` | Inside cluster only | Internal microservices |
| `NodePort` | Outside cluster via node IP + port | Dev/testing, simple exposure |
| `LoadBalancer` | External IP via cloud LB | Production on cloud |

**NodePort port mapping:**
```
nodePort: 30011   ← external port (range 30000-32767)
port: 80          ← service's cluster port
targetPort: 80    ← container's port
```

Traffic flow: `<node-ip>:30011` → service → one of the 3 pods on port 80

## Selector — how Service finds Pods
The service uses `selector` to find pods. It must match the `labels` on the pod template in the Deployment:

```yaml
# Deployment template labels:
labels:
  app: nginx

# Service selector:
selector:
  app: nginx   ← must match
```

If the labels don't match, the service routes to nothing.

## replicas: 3
Three identical pods run simultaneously. The service load-balances across all three. If one pod crashes, the Deployment creates a replacement — maintaining 3 replicas always.

---

## Solution

```bash
kubectl apply -f nginx-deployment.yml
kubectl get deployment nginx-deployment
kubectl get pods
kubectl get svc nginx-service
```

---
*Day 56 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
