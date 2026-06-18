
# DAY 56 - Deploy Nginx Web Server on Kubernetes Cluster
# Run from jump host

kubectl apply -f deployment.yml
kubectl apply -f service.yml

# verify
kubectl get deployment nginx-deployment
kubectl get pods
kubectl get svc nginx-service
