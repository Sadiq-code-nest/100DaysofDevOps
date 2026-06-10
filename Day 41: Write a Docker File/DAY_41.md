# Day 41: Write a Docker File

## Task
Create `/opt/docker/Dockerfile` on **App Server 3**. Base image: `ubuntu:24.04`. Install Apache2 and configure it to run on port `3001`.

---

## What is a Dockerfile?
A Dockerfile is a text file with instructions to build a Docker image — step by step. Every instruction creates a new layer in the image.

```
Dockerfile  →  docker build  →  Image  →  docker run  →  Container
```

**Core instructions:**
| Instruction | Purpose |
|-------------|---------|
| `FROM` | Base image to start from |
| `RUN` | Execute a shell command during build |
| `COPY` / `ADD` | Copy files into the image |
| `ENV` | Set environment variables |
| `EXPOSE` | Document which port the container uses |
| `CMD` | Default command when container starts |

**`EXPOSE` vs `-p` flag:**
`EXPOSE` is documentation — it tells readers what port the app uses. It doesn't actually publish the port. That's done with `docker run -p host:container`. Both together make the app accessible.

**Why `apachectl -D FOREGROUND`?**
Containers run one main process. If it stops, the container stops. Apache normally daemonizes (runs in background and exits the shell). `-D FOREGROUND` keeps it running in the foreground so the container stays alive.

**`ENV DEBIAN_FRONTEND=noninteractive`**
Prevents apt from asking interactive prompts during install — essential in Dockerfiles since there's no terminal to answer them.

---

## Solution
```dockerfile
FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y apache2
RUN sed -i 's/Listen 80/Listen 3001/' /etc/apache2/ports.conf
RUN sed -i 's/<VirtualHost \*:80>/<VirtualHost *:3001>/' /etc/apache2/sites-available/000-default.conf
EXPOSE 3001
CMD ["apachectl", "-D", "FOREGROUND"]
```

```bash
docker build -t apache-custom /opt/docker/
```

---
*Day 41 of 100 | #100DaysOfDevOps #KodeKloud #Docker*
