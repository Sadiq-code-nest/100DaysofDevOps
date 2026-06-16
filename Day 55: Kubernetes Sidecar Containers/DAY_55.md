# Day 55: Kubernetes Sidecar Containers

## Task
Create pod `webserver` with an `nginx:latest` main container and a `ubuntu:latest` sidecar that continuously reads nginx logs. Both share an `emptyDir` volume at `/var/log/nginx`.

---

## What is the Sidecar Pattern?
A sidecar is a second container in the same pod that supports the main container — without being part of the main app. The name comes from motorcycle sidecars.

```
Pod: webserver
├── nginx-container     ← serves web pages, writes logs to /var/log/nginx
└── sidecar-container   ← reads those logs and ships them somewhere
     (same volume, same network, same lifecycle)
```

**Why sidecars instead of doing it in the main container?**
Separation of concerns — nginx does one thing (serve pages). The sidecar does one thing (ship logs). Neither knows about the other's internals. Easy to swap either one without touching the other.

**Common sidecar use cases:**
- Log shipping (this task)
- Metrics collection (Prometheus exporter)
- Proxy / service mesh (Envoy, Istio)
- Config reloader

## Native Sidecar Pattern (Kubernetes 1.29+)
Before 1.29, sidecars were regular containers — they started after init containers finished, which caused ordering problems. From 1.29+, you can declare a sidecar as an `initContainer` with `restartPolicy: Always`:

```yaml
initContainers:
  - name: sidecar-container
    image: ubuntu:latest
    restartPolicy: Always    # ← makes it a native sidecar
```

This starts the sidecar **alongside** the main container (not before it), and restarts it if it crashes — just like a regular container but with better lifecycle control.

**The shared volume:**
Both containers mount the same `emptyDir` volume at the same path. Nginx writes logs there; the sidecar reads them — no direct connection needed.

---

## Solution

```yaml
initContainers:
  - name: sidecar-container
    image: ubuntu:latest
    restartPolicy: Always
    command: ["sh","-c","while true; do cat /var/log/nginx/access.log /var/log/nginx/error.log; sleep 30; done"]
    volumeMounts:
      - name: shared-logs
        mountPath: /var/log/nginx
containers:
  - name: nginx-container
    image: nginx:latest
    volumeMounts:
      - name: shared-logs
        mountPath: /var/log/nginx
volumes:
  - name: shared-logs
    emptyDir: {}
```

```bash
kubectl apply -f webserver.yml
kubectl get pod webserver
```

---
*Day 55 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
