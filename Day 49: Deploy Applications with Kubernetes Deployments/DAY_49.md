# Day 49: Deploy Applications with Kubernetes Deployments

## Task
Create a Kubernetes **Deployment** named `httpd` using image `httpd:latest`.

---

## What is a Deployment?
A Deployment is how you run applications in Kubernetes for real. Unlike a bare Pod, a Deployment:
- Maintains a desired number of pod replicas
- Restarts pods automatically if they crash
- Handles rolling updates with zero downtime
- Lets you roll back to a previous version

```
Deployment (httpd)
└── ReplicaSet
    └── Pod → Container (httpd:latest)
    └── Pod → Container (httpd:latest)   ← if replicas > 1
```

**Two ways to create a Deployment:**

Imperative (quick, one-liner):
```bash
kubectl create deployment httpd --image=httpd:latest
```

Declarative (YAML, recommended for production):
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpd
spec:
  replicas: 1
  selector:
    matchLabels:
      app: httpd
  template:
    metadata:
      labels:
        app: httpd
    spec:
      containers:
        - name: httpd
          image: httpd:latest
```

**Deployment vs Pod — when to use which:**
| | Pod | Deployment |
|--|-----|-----------|
| Self-healing | No | Yes |
| Scaling | No | Yes |
| Rolling updates | No | Yes |
| Use in production | Never | Always |

**Useful commands:**
```bash
kubectl get deployments
kubectl scale deployment httpd --replicas=3   # scale up
kubectl set image deployment/httpd httpd=httpd:2.4  # update image
kubectl rollout history deployment httpd      # see history
kubectl rollout undo deployment httpd         # roll back
```

---

## Solution

```bash
kubectl create deployment httpd --image=httpd:latest
kubectl get deployment httpd
kubectl get pods
```

---
*Day 49 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
