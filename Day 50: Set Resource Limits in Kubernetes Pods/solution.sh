
# DAY 50 - Set Resource Limits in Kubernetes Pods
# Run from jump host

cat > httpd-pod.yml << 'EOF'
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
EOF

kubectl apply -f httpd-pod.yml

# verify
kubectl get pod httpd-pod
kubectl describe pod httpd-pod
