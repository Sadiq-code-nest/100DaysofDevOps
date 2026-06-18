# Day 63: Deploy Iron Gallery App on Kubernetes

## Task
Deploy a full two-tier application stack (Iron Gallery + MariaDB) in a dedicated namespace `iron-namespace-datacenter`. Two deployments, two services, one namespace — all in a single YAML file.

---

## What is a Namespace?
A namespace is a virtual cluster inside your Kubernetes cluster. It isolates resources — deployments, services, pods — so different teams or apps don't collide.

```bash
kubectl get all -n iron-namespace-datacenter   # resources in this namespace only
kubectl get all                                # resources in default namespace
kubectl get all --all-namespaces               # everything everywhere
```

**When to use namespaces:**
- Separate environments (dev, staging, prod) on the same cluster
- Isolate different teams or applications
- Apply resource quotas per team

## Two-Tier Architecture in Kubernetes

```
User → NodePort 32678 → iron-gallery (nginx frontend)
                              ↓
                    ClusterIP 3306 → iron-db (MariaDB)
```

**Frontend service:** `NodePort` — accessible from outside the cluster via `<node-ip>:32678`

**Backend service:** `ClusterIP` — only accessible inside the cluster. The gallery app talks to the DB using the service name `iron-db-service-datacenter` as the hostname. Kubernetes DNS resolves service names within the same namespace automatically.

## Resource Limits on the Gallery Container
```yaml
resources:
  limits:
    memory: "100Mi"
    cpu: "50m"
```
The gallery app is lightweight so tight limits are set. No `requests` defined here — limits act as both the cap and the scheduling hint.

## One file, five resources
The `iron-full.yml` file uses `---` separators to define all five resources:
1. Namespace
2. Gallery Deployment
3. DB Deployment
4. DB Service (ClusterIP)
5. Gallery Service (NodePort)

`kubectl apply -f iron-full.yml` creates all five in one command. Order matters — Kubernetes creates them top to bottom, so the Namespace is declared first.

---

## Files
| File | Resource |
|------|---------|
| `namespace.yml` | Namespace `iron-namespace-datacenter` |
| `iron-gallery-deployment.yml` | Frontend deployment |
| `iron-gallery-service.yml` | Frontend NodePort service (32678) |
| `iron-db-deployment.yml` | MariaDB deployment |
| `iron-db-service.yml` | DB ClusterIP service (3306) |

## Solution
```bash
kubectl apply -f namespace.yml
kubectl apply -f iron-db-deployment.yml
kubectl apply -f iron-db-service.yml
kubectl apply -f iron-gallery-deployment.yml
kubectl apply -f iron-gallery-service.yml
kubectl get all -n iron-namespace-datacenter
# Access gallery at: http://<node-ip>:32678
```

---
*Day 63 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*

