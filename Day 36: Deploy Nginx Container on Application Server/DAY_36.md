# Day 36: Deploy Nginx Container on Application Server

## Task
On **App Server 1**, create a container named `nginx_1` using the `nginx:alpine` image. Container must be running.

---

## docker run — how it works
`docker run` pulls the image (if not local), creates a container from it, and starts it.

```bash
docker run -d --name nginx_1 nginx:alpine
#           ↑        ↑            ↑
#        detached   name       image:tag
```

**Key flags:**
| Flag | Meaning |
|------|---------|
| `-d` | Detached mode — runs in background |
| `--name` | Give the container a human-readable name |
| `-p 8080:80` | Map host port 8080 to container port 80 |
| `--rm` | Auto-delete container when it stops |

**Image tags:**
- `nginx` = `nginx:latest` — full Debian-based image (~180MB)
- `nginx:alpine` — Alpine Linux base, much smaller (~40MB), same nginx

**Verify:**
```bash
docker ps                   # running containers
docker ps -a                # all containers including stopped
docker logs nginx_1         # see container output
docker inspect nginx_1      # full details
```

---

## Solution
```bash
docker run -d --name nginx_1 nginx:alpine
docker ps    # confirm nginx_1 is in Up state
```

---
*Day 36 of 100 | #100DaysOfDevOps #KodeKloud #Docker*
