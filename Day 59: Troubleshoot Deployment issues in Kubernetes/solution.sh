
# DAY 59 - Troubleshoot Deployment Issues in Kubernetes
# Run from jump host

# Step 1: Find what's broken
kubectl get pods
kubectl describe pod <pod-name>
# Look for: ImagePullBackOff, ConfigMap not found, typos

# Step 2: Edit deployment to fix ConfigMap name typo and wrong image
kubectl edit deployment redis-deployment
# Fix: name: redis-cofig  →  name: redis-config
# Fix: image: redis:alpin  →  image: redis:alpine
# Save and exit (:wq)

# OR fix image directly without editor:
kubectl set image deployment/redis-deployment redis-container=redis:alpine

# Step 3: Restart to apply
kubectl rollout restart deployment redis-deployment

# Step 4: Verify
kubectl get pods
kubectl get deployment redis-deployment
# Expect: READY 1/1, STATUS Running
