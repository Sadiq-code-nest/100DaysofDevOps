<div align="center">

```
██████╗ ███████╗██╗   ██╗ ██████╗ ██████╗ ███████╗
██╔══██╗██╔════╝██║   ██║██╔═══██╗██╔══██╗██╔════╝
██║  ██║█████╗  ██║   ██║██║   ██║██████╔╝███████╗
██║  ██║██╔══╝  ╚██╗ ██╔╝██║   ██║██╔═══╝ ╚════██║
██████╔╝███████╗ ╚████╔╝ ╚██████╔╝██║     ███████║
╚═════╝ ╚══════╝  ╚═══╝   ╚═════╝ ╚═╝     ╚══════╝
```

# 100 Days of DevOps — KodeKloud

**A documented, beginner-friendly journey through real DevOps challenges**
*One task. One concept. One day at a time.*

[![Days Completed](https://img.shields.io/badge/Days%20Completed-58%2F100-brightgreen?style=for-the-badge&logo=checkmarx)](.)
[![Platform](https://img.shields.io/badge/Platform-KodeKloud-orange?style=for-the-badge&logo=kubernetes)](https://kodekloud.com)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](./LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-Welcome-blueviolet?style=for-the-badge)](./CONTRIBUTING.md)

</div>

---

## What This Repo Is

This isn't just a collection of commands — it's a **learning diary**.

Every day contains two files:

| File | Purpose |
|------|---------|
| `solution.sh` | Clean, commented commands — the *why*, not just the *what* |
| `DAY_N.md` | Concept breakdown, tables, and the full solution |

Whether you are following along or stuck on a task, these notes explain the thinking behind every command.

---

## Progress Tracker

### Module 1 — Linux Fundamentals `Days 01–20`

| Day | Task | Key Concept | Status |
|-----|------|-------------|--------|
| [01](./Day%2001:%20Linux%20User%20Setup%20with%20Non-Interactive%20Shell/) | Linux User Setup with Non-Interactive Shell | `useradd`, `/sbin/nologin` | ✅ |
| [02](./Day%2002:%20Temporary%20User%20Setup%20with%20Expiry/) | Temporary User Setup with Expiry | `useradd -e`, account expiry | ✅ |
| [03](./Day%2003:%20Secure%20Root%20SSH%20Access/) | Secure Root SSH Access | `sshd_config`, PermitRootLogin | ✅ |
| [04](./Day%2004:%20Script%20Execution%20Permissions/) | Script Execution Permissions | `chmod`, octal modes | ✅ |
| [05](./Day%2005:%20SElinux%20Installation%20and%20Configuration/) | SElinux Installation and Configuration | SELinux modes, `/etc/selinux/config` | ✅ |
| [06](./Day%2006:%20Create%20a%20Cron%20Job/) | Create a Cron Job | `cronie`, `crontab`, cron syntax | ✅ |
| [07](./Day%2007:%20Linux%20SSH%20Authentication/) | Linux SSH Authentication | `ssh-keygen`, `ssh-copy-id` | ✅ |
| [08](./Day%2008:%20Install%20Ansible/) | Install Ansible | `pip3`, global vs user install | ✅ |
| [09](./Day%2009:%20MariaDB%20Troubleshooting/) | MariaDB Troubleshooting | `systemctl`, `chown`, service debugging | ✅ |
| [10](./Day%2010:%20Linux%20Bash%20Scripts/) | Linux Bash Scripts | `zip`, `scp`, bash scripting | ✅ |
| [11](./Day%2011:%20Install%20and%20Configure%20Tomcat%20Server/) | Install and Configure Tomcat Server | Tomcat, WAR deploy, port config | ✅ |
| [12](./Day%2012:%20Linux%20Network%20Services/) | Linux Network Services | port conflicts, `netstat`, `iptables` | ✅ |
| [13](./Day%2013:%20IPtables%20Installation%20And%20Configuration/) | IPtables Installation And Configuration | firewall rules, rule ordering, persistence | ✅ |
| [14](./Day%2014:%20Linux%20Process%20Troubleshooting/) | Linux Process Troubleshooting | `ss`, `netstat`, Apache port fix | ✅ |
| [15](./Day%2015:%20Setup%20SSL%20for%20Nginx/) | Setup SSL for Nginx | SSL/TLS, self-signed cert, HTTPS | ✅ |
| [16](./Day%2016:%20Install%20and%20Configure%20Nginx%20as%20an%20LBR/) | Install and Configure Nginx as an LBR | `upstream`, `proxy_pass`, round-robin | ✅ |
| [17](./Day%2017:%20Install%20and%20Configure%20PostgreSQL/) | Install and Configure PostgreSQL | `psql`, `CREATE USER`, `GRANT` | ✅ |
| [18](./Day%2018:%20Install%20and%20Configure%20DB%20Server/) | Install and Configure DB Server | MariaDB, `mysql`, user and DB setup | ✅ |
| [19](./Day%2019:%20Install%20and%20Configure%20Web%20Application/) | Install and Configure Web Application | Apache subdirectories, `scp -r` | ✅ |
| [20](./Day%2020:%20Configure%20Nginx%20+%20PHP-FPM%20Using%20Unix%20Sock/) | Configure Nginx + PHP-FPM Using Unix Sock | FastCGI, unix socket, PHP-FPM | ✅ |

---

### Module 2 — Version Control `Days 21–34`

| Day | Task | Key Concept | Status |
|-----|------|-------------|--------|
| [21](./Day%2021:%20Set%20Up%20Git%20Repository%20on%20Storage%20Server/) | Set Up Git Repository on Storage Server | `git init --bare`, bare repos | ✅ |
| [22](./Day%2022:%20Clone%20Git%20Repository%20on%20Storage%20Server/) | Clone Git Repository on Storage Server | `git clone`, origin remote | ✅ |
| [23](./Day%2023:%20Fork%20a%20Git%20Repository/) | Fork a Git Repository | fork vs clone, Gitea UI | ✅ |
| [24](./Day%2024:%20Git%20Create%20Branches/) | Git Create Branches | `git checkout -b`, branch pointer | ✅ |
| [25](./Day%2025:%20Git%20Merge%20Branches/) | Git Merge Branches | `git merge`, fast-forward vs 3-way | ✅ |
| [26](./Day%2026:%20Git%20Manage%20Remotes/) | Git Manage Remotes | `git remote add`, multiple remotes | ✅ |
| [27](./Day%2027:%20Git%20Revert%20Some%20Changes/) | Git Revert Some Changes | `git revert`, safe undo | ✅ |
| [28](./Day%2028:%20Git%20Cherry%20Pick/) | Git Cherry Pick | `git cherry-pick`, selective commits | ✅ |
| [29](./Day%2029:%20Manage%20Git%20Pull%20Requests/) | Manage Git Pull Requests | PR workflow, code review, Gitea | ✅ |
| [30](./Day%2030:%20Git%20hard%20reset/) | Git hard reset | `git reset --hard`, force push | ✅ |
| [31](./Day%2031:%20Git%20Stash/) | Git Stash | `git stash`, `stash apply` | ✅ |
| [32](./Day%2032:%20Git%20Rebase/) | Git Rebase | `git rebase`, linear history | ✅ |
| [33](./Day%2033:%20Resolve%20Git%20Merge%20Conflicts/) | Resolve Git Merge Conflicts | conflict markers, `rebase --continue` | ✅ |
| [34](./Day%2034:%20Git%20Hook/) | Git Hook | `post-update`, hook scripts, git tags | ✅ |

---

### Module 3 — Containerization `Days 35–47`

| Day | Task | Key Concept | Status |
|-----|------|-------------|--------|
| [35](./Day%2035:%20Install%20Docker%20Packages%20and%20Start%20Docker%20Service/) | Install Docker Packages and Start Docker Service | `docker-ce`, Docker repo, systemctl | ✅ |
| [36](./Day%2036:%20Deploy%20Nginx%20Container%20on%20Application%20Server/) | Deploy Nginx Container on Application Server | `docker run -d`, image tags | ✅ |
| [37](./Day%2037:%20Copy%20File%20to%20Docker%20Container/) | Copy File to Docker Container | `docker cp`, host-to-container | ✅ |
| [38](./Day%2038:%20Pull%20Docker%20Image/) | Pull Docker Image | `docker pull`, `docker tag`, layers | ✅ |
| [39](./Day%2039:%20Create%20a%20Docker%20Image%20From%20Container/) | Create a Docker Image From Container | `docker commit`, image snapshot | ✅ |
| [40](./Day%2040:%20Docker%20EXEC%20Operations/) | Docker EXEC Operations | `docker exec -it`, in-container ops | ✅ |
| [41](./Day%2041:%20Write%20a%20Docker%20File/) | Write a Docker File | `FROM`, `RUN`, `CMD`, `EXPOSE` | ✅ |
| [42](./Day%2042:%20Create%20a%20Docker%20Network/) | Create a Docker Network | `docker network create`, bridge, subnet | ✅ |
| [43](./Day%2043:%20Docker%20Ports%20Mapping/) | Docker Ports Mapping | `-p host:container`, port forwarding | ✅ |
| [44](./Day%2044:%20Write%20a%20Docker%20Compose%20File/) | Write a Docker Compose File | `docker-compose.yml`, services, volumes | ✅ |
| [45](./Day%2045:%20Resolve%20Dockerfile%20Issues/) | Resolve Dockerfile Issues | build context, COPY paths, sed | ✅ |
| [46](./Day%2046:%20Deploy%20an%20App%20on%20Docker%20Containers/) | Deploy an App on Docker Containers | multi-service compose, env vars | ✅ |
| [47](./Day%2047:%20Docker%20Python%20App/) | Docker Python App | Python Dockerfile, layer caching | ✅ |

---

### Module 4 — Kubernetes `Days 48–67`

| Day | Task | Key Concept | Status |
|-----|------|-------------|--------|
| [48](./Day%2048:%20Deploy%20Pods%20in%20Kubernetes%20Cluster/) | Deploy Pods in Kubernetes Cluster | `Pod`, YAML spec, `kubectl apply` | ✅ |
| [49](./Day%2049:%20Deploy%20Applications%20with%20Kubernetes%20Deployments/) | Deploy Applications with Kubernetes Deployments | `Deployment`, ReplicaSet, self-healing | ✅ |
| [50](./Day%2050:%20Set%20Resource%20Limits%20in%20Kubernetes%20Pods/) | Set Resource Limits in Kubernetes Pods | requests vs limits, millicores, OOMKill | ✅ |
| [51](./Day%2051:%20Execute%20Rolling%20Updates%20in%20Kubernetes/) | Execute Rolling Updates in Kubernetes | `kubectl set image`, rollout status | ✅ |
| [52](./Day%2052:%20Revert%20Deployment%20to%20Previous%20Version%20in%20Kubernetes/) | Revert Deployment to Previous Version in Kubernetes | `kubectl rollout undo`, revision history | ✅ |
| [53](./Day%2053:%20Resolve%20VolumeMounts%20Issue%20in%20Kubernetes/) | Resolve VolumeMounts Issue in Kubernetes | volumeMounts, emptyDir, subPath | ✅ |
| [54](./Day%2054:%20Kubernetes%20Shared%20Volumes/) | Kubernetes Shared Volumes | emptyDir, shared volume, multi-container | ✅ |
| [55](./Day%2055:%20Kubernetes%20Sidecar%20Containers/) | Kubernetes Sidecar Containers | sidecar pattern, initContainer, restartPolicy | ✅ |
| [56](./Day%2056:%20Deploy%20Nginx%20Web%20Server%20on%20Kubernetes%20Cluster/) | Deploy Nginx Web Server on Kubernetes Cluster | Deployment + NodePort Service, replicas | ✅ |
| [57](./Day%2057:%20Print%20Environment%20Variables/) | Print Environment Variables | env vars, restartPolicy: Never | ✅ |
| [58](./Day%2058:%20Deploy%20Grafana%20on%20Kubernetes%20Cluster/) | Deploy Grafana on Kubernetes Cluster | Grafana, multi-resource YAML, NodePort | ✅ |
| 59–67 | Coming soon | | 🔜 |

---

### Module 5 — CI/CD & IaC `Days 68–100`

| Day | Task | Key Concept | Status |
|-----|------|-------------|--------|
| 68–100 | Coming soon | | 🔜 |

---

## Repo Structure

```
100DaysofDevOps/
│
├── README.md
│
├── Day 01: Linux User Setup with Non-Interactive Shell/
│   ├── solution.sh
│   └── DAY_1.md
│
├── Day 02: Temporary User Setup with Expiry/
│   ├── solution.sh
│   └── DAY_2.md
│
└── ... and so on for each day
```

---

## Technologies Covered

| Category | Tools |
|----------|-------|
| OS and Shell | Linux (CentOS / RHEL / Ubuntu), Bash |
| Security | SELinux, SSH key auth, iptables, SSL/TLS |
| Scheduling | Cron, cronie |
| Configuration Management | Ansible, YAML |
| Databases | MariaDB, MySQL, PostgreSQL |
| Containers | Docker, Docker Compose |
| Orchestration | Kubernetes, kubectl |
| Version Control | Git, GitHub, Gitea |
| CI/CD | Jenkins, pipelines |
| Infrastructure as Code | Terraform, AWS |
| Web Servers | Nginx, Apache, Tomcat, PHP-FPM |

---

## How to Use This Repo

**Following the challenge:**
1. Sign up at [KodeKloud](https://kodekloud.com) and start the Stratos lab
2. Open `DAY_N.md` to understand the concept before starting
3. Try solving it yourself first
4. Check `solution.sh` to compare your approach

**Just learning concepts:**
- Each `DAY_N.md` is self-contained — no prior context needed
- Browse any day as a focused mini-lesson on that topic

---

## Philosophy

> "I don't want to just pass tasks — I want to understand what's happening and why."

Every note here answers four questions:

- **What** does this command do?
- **Why** is this the right approach?
- **When** would I use this in real life?
- **What breaks** if I get it wrong?

---

## Contributing

Found a better approach or spotted an error? PRs are welcome.

1. Fork the repo
2. Create a branch: `git checkout -b improve/day-N`
3. Commit your changes
4. Open a Pull Request

---

## Connect

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin)](https://linkedin.com/in/YOUR_HANDLE)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github)](https://github.com/Sadiq-code-nest)

Sharing on LinkedIn? Use `#100DaysOfDevOps` and tag me — happy to see your progress.

---

<div align="center">

*Built with curiosity, coffee, and a lot of `man` pages*

[Back to Top](#)

</div>
