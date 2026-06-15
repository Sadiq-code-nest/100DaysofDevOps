
# DAY 53 - Resolve VolumeMounts Issue in Kubernetes
# Run from jump host

# Investigate
kubectl get pods
kubectl describe pod nginx-phpfpm
kubectl get configmap nginx-config -o yaml
kubectl get pod nginx-phpfpm -o yaml

# Check logs
kubectl logs nginx-phpfpm -c nginx-container
kubectl logs nginx-phpfpm -c php-fpm-container

# Fix: delete old pod and recreate with correct volume mounts
kubectl delete pod nginx-phpfpm

cat > nginx-phpfpm.yml << 'EOF'
apiVersion: v1
kind: Pod
metadata:
  labels:
    app: php-app
  name: nginx-phpfpm
  namespace: default
spec:
  containers:
  - image: php:7.2-fpm-alpine
    name: php-fpm-container
    volumeMounts:
    - mountPath: /var/www/html
      name: shared-files
  - image: nginx:latest
    name: nginx-container
    volumeMounts:
    - mountPath: /var/www/html
      name: shared-files
    - mountPath: /etc/nginx/nginx.conf
      name: nginx-config-volume
      subPath: nginx.conf
  volumes:
  - emptyDir: {}
    name: shared-files
  - configMap:
      name: nginx-config
    name: nginx-config-volume
EOF

kubectl apply -f nginx-phpfpm.yml
kubectl get pods -w

# Copy index.php from jump host into nginx-container
kubectl cp /home/thor/index.php nginx-phpfpm:/var/www/html/index.php -c nginx-container

# Verify both containers see the file
kubectl exec nginx-phpfpm -c nginx-container -- ls /var/www/html/
kubectl exec nginx-phpfpm -c php-fpm-container -- ls /var/www/html/
