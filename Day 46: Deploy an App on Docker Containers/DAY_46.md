# Day 46: Deploy an App on Docker Containers

## Task
On **App Server 1**, create `/opt/devops/docker-compose.yml` that deploys two services — a PHP web app (`php_host`) and a MariaDB database (`mysql_host`) — with proper port mappings, volumes, and environment variables.

---

## Multi-Container Apps with Docker Compose

Real applications are almost never a single container. A typical web app has:
- A **web service** — serves the application (PHP, Node, Python)
- A **database service** — stores the data (MySQL, MariaDB, PostgreSQL)

Compose lets you define both in one file and bring them up together with one command.

**How services communicate in Compose:**
Compose automatically puts all services on the same internal network. They can reach each other by **service name**. So your PHP app connects to the DB using the hostname `db` — not an IP.

```yaml
# PHP app connects to DB like this:
$host = 'db';   # service name = hostname inside compose network
```

**Environment variables for MariaDB:**
| Variable | Purpose |
|----------|---------|
| `MYSQL_DATABASE` | Creates this DB on startup |
| `MYSQL_USER` | Creates this non-root user |
| `MYSQL_PASSWORD` | Password for that user |
| `MYSQL_ROOT_PASSWORD` | Required — root password |

Never use root for app connections — always create a dedicated user.

**Volumes in this task:**
Both use **bind mounts** — host directories mapped directly into the container. Data written inside the container appears on the host, and vice versa. This means the DB data survives container restarts.

---

## Solution

```yaml
# /opt/devops/docker-compose.yml
version: '3.8'
services:
  web:
    image: php:apache
    container_name: php_host
    ports:
      - "3000:80"
    volumes:
      - /var/www/html:/var/www/html
  db:
    image: mariadb:latest
    container_name: mysql_host
    ports:
      - "3306:3306"
    volumes:
      - /var/lib/mysql:/var/lib/mysql
    environment:
      MYSQL_DATABASE: database_host
      MYSQL_USER: devuser
      MYSQL_PASSWORD: Dev@12345
      MYSQL_ROOT_PASSWORD: Root@12345
```

```bash
cd /opt/devops
docker compose up -d
curl http://localhost:3000
```

---
*Day 46 of 100 | #100DaysOfDevOps #KodeKloud #Docker #DockerCompose*
