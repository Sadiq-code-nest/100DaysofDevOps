
# DAY 60 - Persistent Volumes in Kubernetes
# Run from jump host — apply in order (PV before PVC before Pod)

kubectl apply -f pv.yml
kubectl apply -f pvc.yml
kubectl apply -f pod.yml
kubectl apply -f service.yml

# verify
kubectl get pv pv-datacenter
kubectl get pvc pvc-datacenter
kubectl get pod pod-datacenter
kubectl get svc web-datacenter
