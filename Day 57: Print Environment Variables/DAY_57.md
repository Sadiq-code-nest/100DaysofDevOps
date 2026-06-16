# Day 57: Print Environment Variables

## Task
Create pod `print-envars-greeting` with container `print-env-container` (image: `bash`). Set three env vars (`GREETING`, `COMPANY`, `GROUP`) and print them with a specific command. `restartPolicy: Never`.

---

## Environment Variables in Kubernetes

Env vars are the standard way to pass configuration into containers — API keys, DB URLs, feature flags, app settings. You set them in the pod spec; the container sees them like any shell variable.

```yaml
env:
- name: GREETING
  value: "Welcome to"
- name: COMPANY
  value: "xFusionCorp"
```

Inside the container: `echo $GREETING` → `Welcome to`

**Three ways to set env vars in K8s:**

| Method | Use case |
|--------|---------|
| `env: value:` | Static values (this task) |
| `env: valueFrom: secretKeyRef:` | Sensitive data from Secrets |
| `env: valueFrom: configMapKeyRef:` | Config from ConfigMaps |

## restartPolicy: Never
By default pods restart on failure (`Always`). For a one-shot job that just runs a command and exits, use `Never` — otherwise Kubernetes keeps restarting it in a crash loop.

```yaml
restartPolicy: Never    # run once, stay Completed
restartPolicy: Always   # restart on any exit (default)
restartPolicy: OnFailure # restart only on non-zero exit
```

For batch jobs or one-time tasks, always use `Never` or `OnFailure`. For actual services, use `Always`.

## Command vs args vs CMD
```yaml
command: ["/bin/sh", "-c"]   # overrides Dockerfile ENTRYPOINT
args: ['echo "$VAR"']        # overrides Dockerfile CMD
```

When you use `command` + `-c` + a string, shell expansion like `$GREETING` works because you're explicitly running through `/bin/sh`. Without `-c`, env vars don't expand.

---

## Solution

```yaml
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
  command: ["/bin/sh", "-c", 'echo "$GREETING $COMPANY $GROUP"']
```

```bash
kubectl apply -f print-envars-greeting.yml
kubectl logs -f print-envars-greeting
# Output: Welcome to xFusionCorp Industries
```

---
*Day 57 of 100 | #100DaysOfDevOps #KodeKloud #Kubernetes*
