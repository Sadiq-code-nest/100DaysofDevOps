# Day 37: Copy File to Docker Container

## Task
Copy `/tmp/nautilus.txt.gpg` from the **App Server 2** host into the `ubuntu_latest` container at `/opt/`. File must not be modified.

---

## docker cp
`docker cp` copies files between the host filesystem and a container — in either direction. The container doesn't need to expose any ports or volumes for this to work.

```bash
# Host → Container
docker cp /host/path/file  container_name:/container/path/

# Container → Host
docker cp container_name:/container/path/file  /host/path/
```

**The container can be stopped or running** — `docker cp` works either way.

**Why not use volumes?**
Volumes are for persistent, ongoing data sharing. `docker cp` is for one-time file transfers — simpler when you just need to drop a file in.

**Verify the copy:**
```bash
docker exec container_name ls /opt/
docker exec container_name cat /opt/file   # check content
```

**What is .gpg?**
GPG (GNU Privacy Guard) encrypted file. The `.gpg` extension means it's encrypted — you'd need the private key to read it. The task says don't modify it, so we just copy it as-is.

---

## Solution
```bash
docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/opt/
docker exec ubuntu_latest ls /opt/    # confirm file is there
```

---
*Day 37 of 100 | #100DaysOfDevOps #KodeKloud #Docker*
