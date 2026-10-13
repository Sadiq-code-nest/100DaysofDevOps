
# DAY 67 - Deploy Guest Book App on Kubernetes
# Apply in this order — backend before frontend

kubectl apply -f redis-master-deployment.yml
kubectl apply -f redis-master-service.yml
kubectl apply -f redis-slave-deployment.yml
kubectl apply -f redis-slave-service.yml
kubectl apply -f redis-follower-service.yml
kubectl apply -f frontend-deployment.yml
kubectl apply -f frontend-service.yml

# verify
kubectl get deployments
# redis-master  1/1 | redis-slave  2/2 | frontend  3/3

kubectl get pods
# 6 pods total: 1 master + 2 slaves + 3 frontend

kubectl get svc
# redis-master | redis-slave | redis-follower | frontend (30009)
