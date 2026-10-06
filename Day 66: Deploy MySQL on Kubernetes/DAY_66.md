# Day 66: Deploy MySQL on Kubernetes

## Task
Deploy a full MySQL stack on Kubernetes: PV (250Mi) → PVC → 3 Secrets → Deployment with env vars from secrets → NodePort service on port `30007`.

---

## Architecture

```
mysql-pv (hostPath 250Mi)
    ↓ bound by
mysql-pv-claim (requests 250Mi)
    ↓ mounted in
mysql-deployment → /var/lib/mysql
    ↑ credentials from
mysql-root-pass / mysql-user-pass / mysql-db-url (Secrets)
    ↓ exposed via
mysql service (NodePort 30007)
```

---

## Key Concepts

### Static PV binding with `volumeName`
When `storageClassName: ""` and `volumeName: mysql-pv` are both set in the PVC, Kubernetes skips dynamic provisioning and binds directly to that specific PV. Without `volumeName`, it might bind to any available PV of the right size.

### Secrets with `stringData` vs `data`
```yaml
stringData:
  password: YUIidhb667    # plain text — Kubernetes base64-encodes it automatically
```
vs
```yaml
data:
  password: WVVJaWRoYjY2Nw==   # you must base64-encode it yourself
```
`stringData` is easier to read and write — use it when creating secrets from YAML.

### Consuming secrets as environment variables
```yaml
env:
- name: MYSQL_ROOT_PASSWORD
  valueFrom:
    secretKeyRef:
      name: mysql-root-pass   # secret name
      key: password           # key inside that secret
```
The container sees `MYSQL_ROOT_PASSWORD=YUIidhb667` — the raw value, not base64. Kubernetes decodes it automatically.

### Apply order matters
```
PV → PVC → Secrets → Deployment → Service
```
The Deployment references both the PVC (for volume) and the Secrets (for env vars). All three must exist before the pod can start successfully.

---

## Files

| File | Resource |
|------|---------|
| `mysql-pv.yml` | PersistentVolume `mysql-pv` (250Mi, hostPath) |
| `mysql-pvc.yml` | PersistentVolumeClaim `mysql-pv-claim` (250Mi) |
| `mysql-secrets.yml` | 3 Secrets: root-pass, user-pass, db-url |
| `mysql-deployment.yml` | Deployment with PVC mount + secret env vars |
| `mysql-service.yml` | NodePort Service on port 30007 |

---

## Solution

```bash
kubectl apply -f mysql-pv.yml
kubectl apply -f mysql-pvc.yml
kubectl apply -f mysql-secrets.yml
kubectl apply -f mysql-deployment.yml
kubectl apply -f mysql-service.yml

kubectl get pv,pvc,secrets,deploy,pods,svc
```

| Resource | Expected Status |
|----------|----------------|
| PV `mysql-pv` | Bound |
| PVC `mysql-pv-claim` | Bound |
| Deployment | 1/1 Ready |
| Pod | Running |
| Service | NodePort 30007 |

---
*Day 66 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes #MySQL*
