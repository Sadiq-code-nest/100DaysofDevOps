# Day 42: Create a Docker Network

## Task
On **App Server 2**, create a Docker network named `news` using the `bridge` driver with subnet `172.168.0.0/24` and ip-range `172.168.0.0/24`.

---

## What is a Docker Network?
By default, containers are isolated — they can't talk to each other or the outside world unless you configure networking. Docker networks let containers communicate in a controlled way.

**Built-in network types:**
| Driver | Use case |
|--------|---------|
| `bridge` | Default for standalone containers on same host |
| `host` | Container shares the host's network stack |
| `none` | Complete network isolation |
| `overlay` | Multi-host networking (Docker Swarm) |

**Bridge network — how it works:**
Docker creates a virtual network interface on the host. Containers on the same bridge network can reach each other by container name. Traffic outside the bridge is routed through the host.

```bash
docker network create --driver bridge mynet
docker run --network mynet --name app1 nginx
docker run --network mynet --name app2 alpine ping app1   # works!
```

**Subnet vs IP range:**
- `--subnet` — defines the full address space of the network
- `--ip-range` — subset of the subnet that Docker actually assigns IPs from

When they're the same, Docker uses the entire subnet for assignment.

```bash
docker network ls                  # list all networks
docker network inspect network_name  # details + connected containers
docker network rm network_name     # delete
```

---

## Solution
```bash
docker network create \
  --driver bridge \
  --subnet 172.168.0.0/24 \
  --ip-range 172.168.0.0/24 \
  news

docker network inspect news
```

---
*Day 42 of 100 | #100DaysOfDevOps #KodeKloud #Docker*
