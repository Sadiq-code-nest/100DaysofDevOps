# Day 48: Deploy Pods in Kubernetes Cluster

## Task
Create a Kubernetes **Pod** named `pod-nginx` running `nginx:latest` with label `app: nginx_app`.

---

## What is Kubernetes?
Kubernetes (K8s) is a container orchestration platform — it manages containers across multiple servers, handles scaling, self-healing, load balancing, and rolling updates automatically.

Think of it like this: Docker runs containers on one machine. Kubernetes runs containers across a whole cluster of machines, and decides where they run, restarts them if they crash, and routes traffic to them.

## What is a Pod?
A Pod is the **smallest deployable unit** in Kubernetes — it wraps one or more containers that share the same network and storage. Almost always: one pod = one container.

```
Cluster
└── Node (server)
    └── Pod
        └── Container (your app)
```

**Pod YAML structure:**
```yaml
apiVersion: v1          # API version
kind: Pod               # resource type
metadata:
  name: pod-nginx       # pod name
  labels:               # key-value tags for selection
    app: nginx_app
spec:
  containers:
    - name: nginx-container   # container name (inside the pod)
      image: nginx:latest     # Docker image to use
```

**Essential kubectl commands:**
```bash
kubectl apply -f file.yml      # create/update resource from file
kubectl get pods               # list pods
kubectl describe pod pod-name  # detailed info + events
kubectl logs pod-name          # container logs
kubectl delete pod pod-name    # delete pod
```

**Pod vs Deployment:**
A Pod alone has no self-healing — if it crashes, it's gone. In production you always use a **Deployment** (Day 49) which manages pods and restarts them automatically.

---

## Solution

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx
  labels:
    app: nginx_app
spec:
  containers:
    - name: nginx-container
      image: nginx:latest
```

```bash
kubectl apply -f pod-nginx.yml
kubectl get pods
```

---
*Day 48 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
