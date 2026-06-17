
# DAY 60 - Persistent Volumes in Kubernetes
# Run from jump host

cat > pv.yml << 'EOF'
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-datacenter
spec:
  storageClassName: manual
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /mnt/devops
EOF

cat > pvc.yml << 'EOF'
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-datacenter
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 2Gi
EOF

cat > pod.yml << 'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: pod-datacenter
  labels:
    app: httpd
spec:
  containers:
  - name: container-datacenter
    image: httpd:latest
    ports:
    - containerPort: 80
    volumeMounts:
    - name: web-storage
      mountPath: /usr/local/apache2/htdocs
  volumes:
  - name: web-storage
    persistentVolumeClaim:
      claimName: pvc-datacenter
EOF

cat > service.yml << 'EOF'
apiVersion: v1
kind: Service
metadata:
  name: web-datacenter
spec:
  type: NodePort
  selector:
    app: httpd
  ports:
  - port: 80
    targetPort: 80
    nodePort: 30008
EOF

kubectl apply -f pv.yml
kubectl apply -f pvc.yml
kubectl apply -f pod.yml
kubectl apply -f service.yml

# verify
kubectl get pv pv-datacenter
kubectl get pvc pvc-datacenter
kubectl get pod pod-datacenter
kubectl get svc web-datacenter
