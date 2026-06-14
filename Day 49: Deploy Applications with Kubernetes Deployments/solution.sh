
# DAY 49 - Deploy Applications with Kubernetes Deployments
# Run from jump host

kubectl create deployment httpd --image=httpd:latest

# verify
kubectl get deployment httpd
kubectl get pods
kubectl describe deployment httpd
