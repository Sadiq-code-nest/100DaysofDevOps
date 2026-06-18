
# DAY 63 - Deploy Iron Gallery App on Kubernetes
# Run from jump host — apply in order (namespace first)

kubectl apply -f namespace.yml
kubectl apply -f iron-db-deployment.yml
kubectl apply -f iron-db-service.yml
kubectl apply -f iron-gallery-deployment.yml
kubectl apply -f iron-gallery-service.yml

# verify all resources in the namespace
kubectl get all -n iron-namespace-datacenter
