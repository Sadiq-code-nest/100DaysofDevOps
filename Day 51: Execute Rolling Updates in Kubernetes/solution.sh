
# DAY 51 - Execute Rolling Updates in Kubernetes
# Run from jump host

# Check deployment and get container name
kubectl get deployment nginx-deployment
kubectl get deployment nginx-deployment -o jsonpath="{.spec.template.spec.containers[*].name}"

# Perform rolling update
kubectl set image deployment/nginx-deployment nginx=nginx:1.19

# Watch until complete
kubectl rollout status deployment/nginx-deployment

# Verify
kubectl get pods
kubectl get pods -o jsonpath="{.items[*].spec.containers[*].image}"
