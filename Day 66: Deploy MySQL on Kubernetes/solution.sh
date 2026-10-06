
# DAY 66 - Deploy MySQL on Kubernetes
# Run from jump host — apply in this order (PV → PVC → Secrets → Deployment → Service)

kubectl apply -f mysql-pv.yml
kubectl apply -f mysql-pvc.yml
kubectl apply -f mysql-secrets.yml
kubectl apply -f mysql-deployment.yml
kubectl apply -f mysql-service.yml

# verify all resources
kubectl get pv mysql-pv
kubectl get pvc mysql-pv-claim
kubectl get secrets | grep mysql
kubectl get deployment mysql-deployment
kubectl get pods -l app=mysql
kubectl get svc mysql
