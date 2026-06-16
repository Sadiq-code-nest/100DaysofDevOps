
# DAY 58 - Deploy Grafana on Kubernetes Cluster
# Run from jump host

cat > grafana.yml << 'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: grafana-deployment-datacenter
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana
  template:
    metadata:
      labels:
        app: grafana
    spec:
      containers:
      - name: grafana
        image: grafana/grafana
        ports:
        - containerPort: 3000
---
apiVersion: v1
kind: Service
metadata:
  name: grafana-service
spec:
  type: NodePort
  selector:
    app: grafana
  ports:
  - port: 3000
    targetPort: 3000
    nodePort: 32000
EOF

kubectl apply -f grafana.yml

# verify
kubectl get deployment grafana-deployment-datacenter
kubectl get pods
kubectl get svc grafana-service
