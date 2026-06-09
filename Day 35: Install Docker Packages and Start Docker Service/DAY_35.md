# Day 35: Install Docker Packages and Start Docker Service

## Task
Install `docker-ce` and `docker-compose` on **App Server 1** and start the Docker service.

---

## What is Docker?
Docker packages applications into **containers** — isolated, portable environments that include everything needed to run: code, runtime, libraries, config. Containers run the same way everywhere.

```
Without Docker:  "works on my machine" problem
With Docker:     same container runs identical everywhere
```

**Key components installed:**
| Package | Purpose |
|---------|---------|
| `docker-ce` | Docker engine (Community Edition) |
| `docker-ce-cli` | Command line interface (`docker` command) |
| `containerd.io` | Low-level container runtime |
| `docker-compose-plugin` | Multi-container orchestration |

**Why add the Docker repo first?**
The default CentOS/RHEL repos have an old or missing Docker version. Adding the official Docker repo ensures you get the current stable release.

```bash
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

After installing, Docker doesn't start automatically — you need `systemctl start docker`. Use `enable` so it starts on every reboot.

---

## Solution
```bash
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl start docker
systemctl enable docker
docker --version
```

---
*Day 35 of 100 | #100DaysOfDevOps #KodeKloud #Docker*
