# Day 53: Resolve VolumeMounts Issue in Kubernetes

## Task
The pod `nginx-phpfpm` (nginx + PHP-FPM) is broken. Investigate, fix the volume mount issue, then copy `/home/thor/index.php` from the jump host into the nginx-container's document root.

---

## The Problem: Mismatched Volume Mount Paths

Nginx and PHP-FPM need to serve files from the **same directory**. If they mount a shared volume at different paths, nginx serves from one place while PHP-FPM looks in another — the app breaks.

```
Wrong:
  nginx-container  → /usr/share/nginx/html  ← default nginx path
  php-fpm-container → /var/www/html          ← php-fpm default

  nginx forwards .php to php-fpm, but php-fpm can't find the file

Correct:
  nginx-container  → /var/www/html   ← both mount here
  php-fpm-container → /var/www/html  ← same volume, same path
```

## emptyDir volume
`emptyDir` is a shared volume that lives inside the pod — it's empty on start, and both containers can read/write to it. When the pod is deleted, the data is gone (ephemeral). It's the standard way to share files between containers in the same pod.

## ConfigMap as a volume + subPath
```yaml
- mountPath: /etc/nginx/nginx.conf
  name: nginx-config-volume
  subPath: nginx.conf    # mount only the nginx.conf key, not the whole ConfigMap
```
Without `subPath`, mounting a ConfigMap into a directory replaces the entire directory with ConfigMap contents. `subPath` mounts just one key as a single file, leaving the rest of the directory intact.

## kubectl cp — copy files into a pod
```bash
kubectl cp /local/file pod-name:/container/path -c container-name
#                                                  ↑ specify container when pod has multiple
```

## Debugging multi-container pods
```bash
kubectl logs pod-name -c container-name     # logs for specific container
kubectl exec pod-name -c container-name -- command   # exec into specific container
kubectl describe pod pod-name               # events + mount details
```

---

## Solution
```bash
kubectl describe pod nginx-phpfpm           # find the mount path mismatch
kubectl get configmap nginx-config -o yaml  # check document root in nginx config
kubectl delete pod nginx-phpfpm
# recreate pod with matching /var/www/html mounts on both containers
kubectl apply -f nginx-phpfpm.yml
kubectl cp /home/thor/index.php nginx-phpfpm:/var/www/html/index.php -c nginx-container
kubectl exec nginx-phpfpm -c php-fpm-container -- ls /var/www/html/
```

---
*Day 53 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
