
# DAY 61 - Init Containers in Kubernetes
# Run from jump host

kubectl apply -f deployment.yml

# verify
kubectl get deploy ic-deploy-xfusion
kubectl get pods

# check init container ran and main container reads the message
kubectl logs <pod-name>
# Expected: Init Done - Welcome to xFusionCorp Industries
