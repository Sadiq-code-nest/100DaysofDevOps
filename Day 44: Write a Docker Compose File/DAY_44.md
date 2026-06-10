# Day 44: Write a Docker Compose File

## Task
On **App Server 1**, create `/opt/docker/docker-compose.yml`. Run an `httpd:latest` container named `httpd`, map host port `5004` to container port `80`, mount `/opt/security` on the host to `/usr/local/apache2/htdocs` in the container.

---

## What is Docker Compose?
Docker Compose lets you define and run multi-container applications using a single YAML file. Instead of long `docker run` commands, you describe your setup declaratively.

```
docker run -d --name httpd -p 5004:80 -v /opt/security:/usr/local/apache2/htdocs httpd:latest

# same thing in docker-compose.yml — much more readable and version-controlled
```

**Core compose file structure:**
```yaml
version: '3'          # compose file format version

services:             # define containers
  service_name:       # logical name (not the container name)
    image: ...        # image to use
    container_name:   # actual container name
    ports:
      - "host:container"
    volumes:
      - /host/path:/container/path
```

**Key commands:**
```bash
docker compose up -d       # start all services in background
docker compose down        # stop and remove containers
docker compose ps          # list running services
docker compose logs        # view logs
```

**Volumes — bind mount vs named volume:**
| Type | Example | Use case |
|------|---------|---------|
| Bind mount | `/host/path:/container/path` | Share specific host directory |
| Named volume | `mydata:/container/path` | Managed by Docker, persists |

This task uses a bind mount — the host directory `/opt/security` is directly shared into the container.

---

## Solution
```yaml
# /opt/docker/docker-compose.yml
version: '3'
services:
  web:
    image: httpd:latest
    container_name: httpd
    ports:
      - "5004:80"
    volumes:
      - /opt/security:/usr/local/apache2/htdocs
```

```bash
cd /opt/docker
docker compose up -d
curl http://localhost:5004
```

---
*Day 44 of 100 | #100DaysOfDevOps #KodeKloud #Docker #DockerCompose*
