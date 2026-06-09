# Day 39: Create a Docker Image From Container

## Task
On **App Server 3**, create a new Docker image `blog:datacenter` from the running container `ubuntu_latest`.

---

## docker commit
`docker commit` takes a snapshot of a container's current state and saves it as a new image. It's like `git commit` — you're capturing the current state as a checkpoint.

```bash
docker commit container_name  new_image:tag
docker commit ubuntu_latest   blog:datacenter
```

**What gets saved:**
- All changes made inside the container since it started
- Any packages installed, files created, configs changed
- The filesystem layer on top of the base image

**What does NOT get saved:**
- Running processes
- Volume mounts
- Container metadata like exposed ports (unless you pass `-c` flags)

**Better practice for production:**
`docker commit` is quick but not reproducible. For real projects, use a `Dockerfile` — it documents every step and anyone can rebuild the exact same image. But for quick backups or one-off tasks, `commit` is fine.

```bash
docker images blog       # list images named blog
docker history blog:datacenter   # see layers
```

---

## Solution
```bash
docker commit ubuntu_latest blog:datacenter
docker images | grep blog    # confirm blog:datacenter exists
```

---
*Day 39 of 100 | #100DaysOfDevOps #KodeKloud #Docker*
