
# DAY 62 - Manage Secrets in Kubernetes
# Run from jump host

# Step 1: Create secret from the existing file
kubectl create secret generic official --from-file=/opt/official.txt

# verify secret created
kubectl get secrets

# Step 2: Deploy the pod that mounts the secret
kubectl apply -f secret-pod.yml

kubectl get pods

# Step 3: Verify secret is accessible inside the container
kubectl exec secret-xfusion -- cat /opt/games/official.txt
