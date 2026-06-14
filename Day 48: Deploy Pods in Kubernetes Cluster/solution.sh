
# DAY 48 - Deploy Pods in Kubernetes Cluster
# Run from jump host — kubectl is already configured

cat > pod-nginx.yml << 'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx
  labels:
    app: nginx_app
spec:
  containers:
    - name: nginx-container
      image: nginx:latest
EOF

kubectl apply -f pod-nginx.yml

# verify
kubectl get pods
kubectl describe pod pod-nginx
