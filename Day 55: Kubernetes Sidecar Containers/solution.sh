
# DAY 55 - Kubernetes Sidecar Containers
# Run from jump host

cat > webserver.yml << 'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: webserver
spec:
  initContainers:
    - name: sidecar-container
      image: ubuntu:latest
      restartPolicy: Always
      command: ["sh", "-c", "while true; do cat /var/log/nginx/access.log /var/log/nginx/error.log; sleep 30; done"]
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
EOF

kubectl apply -f webserver.yml
kubectl get pod webserver
