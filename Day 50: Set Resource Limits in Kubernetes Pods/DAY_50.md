# Day 50: Set Resource Limits in Kubernetes Pods

## Task
Create pod `httpd-pod` with container `httpd-container` using `httpd:latest`. Set resource **requests** (Memory: `15Mi`, CPU: `100m`) and **limits** (Memory: `20Mi`, CPU: `100m`).

---

## Why Resource Limits Matter
Without limits, a single misbehaving container can consume all CPU and memory on a node — starving every other app running there. Limits keep containers in their lane.

**Requests vs Limits — the difference:**

| | Requests | Limits |
|--|----------|--------|
| What it means | Minimum guaranteed resources | Maximum allowed resources |
| Used for | Scheduling — K8s picks a node that has this available | Enforcement — container is throttled/killed if it exceeds this |
| If not set | No guarantee | No cap (bad in production) |

Think of it like booking a hotel room (request) vs the fire code maximum occupancy (limit).

**CPU units:**
```
100m = 100 millicores = 0.1 CPU core
500m = half a core
1000m = 1  = one full core
```

**Memory units:**
```
Mi = Mebibytes (1Mi = 1,048,576 bytes)
Gi = Gibibytes
MB / GB = megabytes/gigabytes (slightly different from Mi/Gi)
```

**What happens when limits are exceeded:**
- **CPU limit hit** → container is throttled (slowed down, not killed)
- **Memory limit hit** → container is OOMKilled (killed immediately)

**Where they go in the YAML:**
```yaml
resources:
  requests:       # scheduling hint
    memory: 15Mi
    cpu: 100m
  limits:         # hard cap
    memory: 20Mi
    cpu: 100m
```

Best practice: always set both requests and limits. For limits, set memory tight and CPU a bit generous (throttling is better than being killed).

---

## Solution

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: httpd-pod
spec:
  containers:
    - name: httpd-container
      image: httpd:latest
      resources:
        requests:
          memory: 15Mi
          cpu: 100m
        limits:
          memory: 20Mi
          cpu: 100m
```

```bash
kubectl apply -f httpd-pod.yml
kubectl describe pod httpd-pod   # check Limits section
```

---
*Day 50 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
