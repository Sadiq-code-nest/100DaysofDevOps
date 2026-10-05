
# DAY 64 - Fix Python App Deployed on Kubernetes Cluster
# Deployment and service already exist — find and fix the misconfiguration

# Step 1: Check pod status
kubectl get all | grep python

# Step 2: Describe the failing pod to find the exact error
kubectl describe pod <pod-name>
# Expect: ImagePullBackOff — wrong image name in deployment

# Step 3: Fix the image in the deployment
kubectl edit deployment python-deployment-xfusion
# Find:  image: poroko/flask-app-demo     (wrong)
# Fix:   image: poroko/flask-demo-app     (correct)
# Save and exit (:wq)

# Step 4: Fix the service — ensure nodePort=32345 and targetPort=5000 (Flask default)
kubectl edit svc python-service-xfusion
# Ensure:
#   port: 5000
#   targetPort: 5000
#   nodePort: 32345
# Save and exit

# Step 5: Verify
kubectl get pods
kubectl get svc
# Pod: 1/1 Running
# Service: NodePort 32345 → 5000
