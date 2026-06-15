
# DAY 52 - Revert Deployment to Previous Version in Kubernetes
# Run from jump host

kubectl rollout undo deployment/nginx-deployment

# verify
kubectl rollout status deployment/nginx-deployment
kubectl rollout history deployment/nginx-deployment
kubectl get pods
