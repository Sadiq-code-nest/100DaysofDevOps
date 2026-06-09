# Day 40: Docker EXEC Operations

## Task
On **App Server 3**, exec into the running `kkloud` container, install Apache2, configure it to listen on port `8084` (not bound to specific IP), and keep Apache running inside the container.

---

## docker exec
`docker exec` runs a command inside an **already running** container. It's how you get a shell inside a container to inspect or configure it.

```bash
docker exec -it container_name bash
#            ↑↑
#            -i = interactive (keeps stdin open)
#            -t = allocate a pseudo-TTY (terminal)
```

Without `-it`, you can run one-off commands:
```bash
docker exec container_name ls /opt
docker exec container_name cat /etc/hosts
```

**exec vs run:**
| | docker run | docker exec |
|--|-----------|------------|
| Creates new container | Yes | No |
| Works on existing container | No | Yes |
| Use case | Start fresh | Debug/configure running container |

**Apache inside a container:**
Containers don't use `systemctl` — they use `service` command or direct process commands. `systemd` typically isn't available inside containers.

```bash
service apache2 start     # works inside Ubuntu container
service apache2 status
service apache2 restart
```

**Port binding `Listen 8084` vs `Listen 0.0.0.0:8084`:**
`Listen 8084` alone means listen on all interfaces — equivalent to `0.0.0.0:8084`. That's what the task wants — accessible from localhost, 127.0.0.1, and container IP.

---

## Solution
```bash
docker exec -it kkloud bash
apt update && apt install -y apache2
sed -i 's/^Listen 80/Listen 8084/' /etc/apache2/ports.conf
sed -i 's/<VirtualHost \*:80>/<VirtualHost *:8084>/' /etc/apache2/sites-available/000-default.conf
service apache2 start
service apache2 status
exit
```

---
*Day 40 of 100 | #100DaysOfDevOps #KodeKloud #Docker*
