
# DAY 58 - Deploy Grafana on Kubernetes Cluster
# Run from jump host

kubectl apply -f deployment.yml
kubectl apply -f service.yml

# verify
kubectl get deployment grafana-deployment-datacenter
kubectl get pods
kubectl get svc grafana-service
# Access: http://<node-ip>:32000
