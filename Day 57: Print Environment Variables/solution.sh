
# DAY 57 - Print Environment Variables
# Run from jump host

cat > print-envars-greeting.yml << 'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: print-envars-greeting
spec:
  restartPolicy: Never
  containers:
  - name: print-env-container
    image: bash
    env:
    - name: GREETING
      value: "Welcome to"
    - name: COMPANY
      value: "xFusionCorp"
    - name: GROUP
      value: "Industries"
    command:
    - /bin/sh
    - -c
    - 'echo "$GREETING $COMPANY $GROUP"'
EOF

kubectl apply -f print-envars-greeting.yml
kubectl get pod print-envars-greeting

# check output
kubectl logs -f print-envars-greeting
