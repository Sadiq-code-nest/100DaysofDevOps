# Day 58: Deploy Grafana on Kubernetes Cluster

## Task
Deploy Grafana using `grafana/grafana` image as a deployment named `grafana-deployment-datacenter`. Expose it via NodePort service on port `32000`. Grafana login page must be accessible.

---

## What is Grafana?
Grafana is an open-source **observability and analytics platform**. It connects to data sources (Prometheus, Loki, InfluxDB, CloudWatch, etc.) and displays metrics and logs as dashboards.

```
Prometheus (collects metrics)
        ↓
    Grafana (visualizes them)
        ↓
   You (see beautiful graphs)
```

In the DevOps world, the standard monitoring stack is **Prometheus + Grafana**. Prometheus scrapes and stores metrics; Grafana queries and displays them.

**Grafana defaults:**
- Port: `3000`
- Default login: `admin` / `admin` (prompts to change on first login)

## One YAML file, two resources
Using `---` as a separator, you can define multiple Kubernetes resources in a single file:

```yaml
# Resource 1: Deployment
apiVersion: apps/v1
kind: Deployment
...
---
# Resource 2: Service
apiVersion: v1
kind: Service
...
```

`kubectl apply -f grafana.yml` creates both at once. Clean and manageable.

## NodePort 32000
After deploying, access Grafana at:
```
http://<node-ip>:32000
```
In KodeKloud labs, there's usually a button on the top bar, or you can get the node IP with:
```bash
kubectl get nodes -o wide
```

---

## Solution

```bash
kubectl apply -f grafana.yml
kubectl get deployment grafana-deployment-datacenter
kubectl get svc grafana-service
# Access: http://<node-ip>:32000
```

---
*Day 58 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes #Grafana*
