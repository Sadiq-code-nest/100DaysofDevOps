
# DAY 54 - Kubernetes Shared Volumes
# Run from jump host

cat > volume-share-nautilus.yml << 'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: volume-share-nautilus
spec:
  containers:
    - name: volume-container-nautilus-1
      image: debian:latest
      command: ["sleep", "infinity"]
      volumeMounts:
        - name: volume-share
          mountPath: /tmp/beta

    - name: volume-container-nautilus-2
      image: debian:latest
      command: ["sleep", "infinity"]
      volumeMounts:
        - name: volume-share
          mountPath: /tmp/apps

  volumes:
    - name: volume-share
      emptyDir: {}
EOF

kubectl apply -f volume-share-nautilus.yml
kubectl get pod volume-share-nautilus -w

# Write file from container 1
kubectl exec volume-share-nautilus -c volume-container-nautilus-1 -- \
  bash -c "echo 'Welcome to xFusionCorp Industries' > /tmp/beta/beta.txt"

# Verify container 2 sees it via shared volume
kubectl exec volume-share-nautilus -c volume-container-nautilus-2 -- \
  cat /tmp/apps/beta.txt
