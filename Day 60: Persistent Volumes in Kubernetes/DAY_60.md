# Day 60: Persistent Volumes in Kubernetes

## Task
Create a `PersistentVolume` (`pv-datacenter`, 5Gi, hostPath), a `PersistentVolumeClaim` (`pvc-datacenter`, 2Gi), a pod (`pod-datacenter`) mounting the PVC at Apache's document root, and a NodePort service (`web-datacenter`) on port `30008`.

---

## The Problem with emptyDir

`emptyDir` volumes are deleted when a pod dies. For databases, uploaded files, or any data that must survive restarts, you need **persistent storage** that outlives the pod.

## PV and PVC — how they work together

Kubernetes separates storage provisioning from storage consumption:

```
Admin creates PV          Developer creates PVC
(the actual storage)      (a request for storage)
       ↓                          ↓
  pv-datacenter    ←─── bound ─── pvc-datacenter
  (5Gi available)                 (requesting 2Gi)
                                       ↓
                               pod mounts PVC
```

**PersistentVolume (PV):** the actual storage resource — defined by an admin. Specifies how much, where it lives, and who can access it.

**PersistentVolumeClaim (PVC):** a request by a user for storage. Says "I need X amount with Y access mode." Kubernetes finds a matching PV and binds them.

**Access Modes:**

| Mode | Short | Meaning |
|------|-------|---------|
| `ReadWriteOnce` | RWO | One node can read and write |
| `ReadOnlyMany` | ROX | Many nodes can read |
| `ReadWriteMany` | RWX | Many nodes can read and write |

**StorageClass `manual`:** tells Kubernetes not to auto-provision storage — the PV was created manually by an admin.

## hostPath volume type

`hostPath` mounts a directory from the **node's filesystem** into the pod. Simple for single-node clusters and testing — not suitable for multi-node production (pod might land on a different node).

```yaml
hostPath:
  path: /mnt/devops   # directory on the node
```

## Pod label must match Service selector

The service finds pods using `selector`. The pod must have a matching label or the service routes to nothing:

```yaml
# Pod:
labels:
  app: httpd

# Service:
selector:
  app: httpd   # must match
```

---

## Solution

```bash
kubectl apply -f pv.yml      # create the PersistentVolume
kubectl apply -f pvc.yml     # claim 2Gi from it
kubectl apply -f pod.yml     # mount PVC at /usr/local/apache2/htdocs
kubectl apply -f service.yml # expose on NodePort 30008

kubectl get pv,pvc,pod,svc   # confirm all are bound/running
```

---
*Day 60 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
