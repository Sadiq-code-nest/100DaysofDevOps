# Day 43: Docker Ports Mapping

## Task
On **App Server 2**, pull `nginx:stable`, create a container named `blog`, map host port `5002` to container port `80`. Keep it running.

---

## How Docker Port Mapping Works
A container has its own network namespace — its ports are not reachable from outside by default. Port mapping creates a rule: traffic hitting the host on port X gets forwarded into the container on port Y.

```
Browser → host:5002 → Docker forwards → container:80 → nginx responds
```

**Syntax:**
```bash
docker run -p host_port:container_port image
docker run -p 5002:80 nginx:stable
#              ↑        ↑
#          host port  container port
```

**Multiple port mappings:**
```bash
docker run -p 8080:80 -p 8443:443 nginx
```

**Bind to specific host IP:**
```bash
docker run -p 127.0.0.1:5002:80 nginx   # only localhost can reach it
docker run -p 5002:80 nginx              # all interfaces (0.0.0.0)
```

**Check what ports are mapped:**
```bash
docker port blog         # shows: 80/tcp -> 0.0.0.0:5002
docker ps                # PORTS column shows mapping
```

**Image tags — stable vs latest:**
- `nginx:latest` — most recent release
- `nginx:stable` — latest stable (recommended for production, less frequent updates)
- `nginx:alpine` — stable but minimal size

---

## Solution
```bash
docker pull nginx:stable
docker run -d --name blog -p 5002:80 nginx:stable
docker ps
curl http://localhost:5002
```

---
*Day 43 of 100 | #100DaysOfDevOps #KodeKloud #Docker*
