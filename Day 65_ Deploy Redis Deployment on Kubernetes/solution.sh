
# DAY 65 - Deploy Redis Deployment on Kubernetes
# Run from jump host

# ConfigMap must be applied before deployment (deployment references it)
kubectl apply -f redis-configmap.yml
kubectl apply -f redis-deployment.yml

# Verify deployment
kubectl get deployment redis-deployment
kubectl get pods -l app=redis

# Verify Redis can read the config from the mounted ConfigMap
kubectl exec -it $(kubectl get pod -l app=redis -o jsonpath='{.items[0].metadata.name}') \
  -- cat /redis-master/redis-config
# Expected: maxmemory 2mb
