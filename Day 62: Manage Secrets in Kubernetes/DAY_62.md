# Day 62: Manage Secrets in Kubernetes

## Task
Create a generic secret named `official` from `/opt/official.txt`. Deploy pod `secret-xfusion` with container `secret-container-xfusion` that mounts the secret at `/opt/games`.

---

## What is a Kubernetes Secret?
A Secret stores sensitive data — passwords, tokens, API keys, certificates — separately from your application code and pod specs. Unlike ConfigMaps, Secrets are base64-encoded and handled with more care by Kubernetes (not logged, not exposed in `kubectl get pod` output).

**Secret types:**

| Type | Use case |
|------|---------|
| `generic` | Arbitrary key-value pairs or files |
| `docker-registry` | Image pull credentials |
| `tls` | TLS certificates and keys |

## Creating secrets

```bash
# From a file (key = filename, value = file contents)
kubectl create secret generic official --from-file=/opt/official.txt

# From literal values
kubectl create secret generic mydb --from-literal=password=supersecret

# From multiple files
kubectl create secret generic certs --from-file=tls.crt --from-file=tls.key
```

## Consuming secrets — two ways

**As a volume (this task):** Secret is mounted as files inside the container.
```yaml
volumes:
- name: secret-volume
  secret:
    secretName: official     # each key becomes a file
volumeMounts:
- name: secret-volume
  mountPath: /opt/games      # /opt/games/official.txt will exist
```

**As environment variables:**
```yaml
env:
- name: DB_PASSWORD
  valueFrom:
    secretKeyRef:
      name: mydb
      key: password
```

Volume mount is generally safer — env vars can leak into logs or child processes.

## Why base64?
Secrets store data as base64 — not encryption, just encoding. It's not secret by default at rest (unless you enable etcd encryption). The real security comes from RBAC — restricting who can `get` secrets.

---

## Files
- `secret-pod.yml` — pod manifest with secret volume mount
- `solution.sh` — create secret, deploy pod, verify

## Solution
```bash
kubectl create secret generic official --from-file=/opt/official.txt
kubectl apply -f secret-pod.yml
kubectl exec secret-xfusion -- cat /opt/games/official.txt
```

---
*Day 62 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
