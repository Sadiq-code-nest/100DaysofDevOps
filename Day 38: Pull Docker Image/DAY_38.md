# Day 38: Pull Docker Image

## Task
On **App Server 2**, pull the `busybox:musl` image and re-tag it as `busybox:blog`.

---

## Docker Images and Tags
A Docker image is a read-only template used to create containers. Tags are labels that identify different versions of an image.

```
busybox:musl   → busybox image with musl libc variant
busybox:glibc  → busybox image with GNU libc
busybox:latest → default tag (most recent stable)
```

**docker pull:**
```bash
docker pull image:tag      # download from Docker Hub
docker pull image          # pulls :latest tag
```

**docker tag:**
```bash
docker tag source:tag  new:tag
```
`docker tag` doesn't copy the image — it just creates a **new reference (alias)** pointing to the same image layers. Both tags share the same image ID.

```bash
docker images | grep busybox
# REPOSITORY   TAG     IMAGE ID      ...
# busybox      musl    abc123...
# busybox      blog    abc123...    ← same IMAGE ID, different tag
```

**busybox variants:**
- `musl` — uses musl libc (lightweight, used in Alpine Linux)
- `glibc` — uses GNU libc (standard on most distros)
- `uclibc` — micro C library (embedded systems)

---

## Solution
```bash
docker pull busybox:musl
docker tag busybox:musl busybox:blog
docker images | grep busybox    # both tags should appear, same IMAGE ID
```

---
*Day 38 of 100 | #100DaysOfDevOps #KodeKloud #Docker*
