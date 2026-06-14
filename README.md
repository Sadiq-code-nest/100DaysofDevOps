<div align="center">
<pre>
██████╗ ███████╗██╗   ██╗ ██████╗ ██████╗ ███████╗
██╔══██╗██╔════╝██║   ██║██╔═══██╗██╔══██╗██╔════╝
██║  ██║█████╗  ██║   ██║██║   ██║██████╔╝███████╗
██║  ██║██╔══╝  ╚██╗ ██╔╝██║   ██║██╔═══╝ ╚════██║
██████╔╝███████╗ ╚████╔╝ ╚██████╔╝██║     ███████║
╚═════╝ ╚══════╝  ╚═══╝   ╚═════╝ ╚═╝     ╚══════╝
</pre>
</div>

# 🚀 100 Days of DevOps — KodeKloud

**A documented, beginner-friendly journey through real DevOps challenges**  
*One task. One concept. One day at a time.*

[![Days Completed](https://img.shields.io/badge/Days%20Completed-10%2F100-brightgreen?style=for-the-badge&logo=checkmarx)](.)
[![Platform](https://img.shields.io/badge/Platform-KodeKloud-orange?style=for-the-badge&logo=kubernetes)](https://kodekloud.com)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](./LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-Welcome-blueviolet?style=for-the-badge)](./CONTRIBUTING.md)

</div>

---

## 🗺️ What This Repo Is

This isn't just a collection of commands. it's a **learning diary**.

Every day contains:
- 📜 **`solution.sh`** — step-by-step commented script (the _why_, not just the _what_)
- 📖 **`DAY_N.md`** — concept deep-dive, diagrams, tables, and the clean solution

Whether you're following along or stuck on a challenge, these notes explain the thinking behind every command.

---

## 📚 Progress Tracker

### 🐧 Module 1 — Linux Fundamentals `[Days 1–20]`

| Day | Challenge | Core Concept | Status |
|-----|-----------|--------------|--------|
| [01](./Day%2001:%20Linux%20User%20Setup%20with%20Non-Interactive%20Shell/) | Linux User Setup with Non-Interactive Shell | `useradd`, non-interactive shell | ✅ |
| [02](./Day%2002:%20Temporary%20User%20Setup%20with%20Expiry/) | Temporary User Setup with Expiry | `useradd -e`, account expiry | ✅ |
| [03](./Day%2003:%20Secure%20Root%20SSH%20Access/) | Secure Root SSH Access | `sshd_config`, PermitRootLogin | ✅ |
| [04](./Day%2004:%20Script%20Execution%20Permissions/) | Script Execution Permissions | `chmod`, numeric/octal modes | ✅ |
| [05](./Day%2005:%20SElinux%20Installation%20and%20Configuration/) | SElinux Installation and Configuration | SELinux modes, `/etc/selinux/config` | ✅ |
| [06](./Day%2006:%20Create%20a%20Cron%20Job/) | Create a Cron Job | `cronie`, `crontab`, cron syntax | ✅ |
| [07](./Day%2007:%20Linux%20SSH%20Authentication/) | Linux SSH Authentication | `ssh-keygen`, `ssh-copy-id`, key pairs | ✅ |
| [08](./Day%2008:%20Install%20Ansible/) | Install Ansible | `pip3`, global vs user install | ✅ |
| [09](./Day%2009:%20MariaDB%20Troubleshooting/) | MariaDB Troubleshooting | `systemctl`, `chown`, service debugging | ✅ |
| [10](./Day%2010:%20Linux%20Bash%20Scripts/) | Linux Bash Scripts | `zip`, `scp`, bash scripting | ✅ |
| [11](./Day%2011:%20Install%20and%20Configure%20Tomcat%20Server/) | Install and Configure Tomcat Server | `tomcat`, WAR deploy, port config | ✅ |
| [12](./Day%2012:%20Linux%20Network%20Services/) | Linux Network Services | port conflicts, `netstat`, `iptables` | ✅ |
| [13](./Day%2013:%20IPtables%20Installation%20And%20Configuration/) | IPtables Installation And Configuration | firewall rules, rule ordering, persistence | ✅ |
| [14](./Day%2014:%20Linux%20Process%20Troubleshooting/) | Linux Process Troubleshooting | `ss`, `netstat`, Apache port fix | ✅ |
| [15](./Day%2015:%20Setup%20SSL%20for%20Nginx/) | Setup SSL for Nginx | SSL/TLS, self-signed cert, `nginx` HTTPS | ✅ |
| [16](./Day%2016:%20Install%20and%20Configure%20Nginx%20as%20an%20LBR/) | Install and Configure Nginx as an LBR | `upstream`, `proxy_pass`, round-robin | ✅ |
| [17](./Day%2017:%20Install%20and%20Configure%20PostgreSQL/) | Install and Configure PostgreSQL | `psql`, `CREATE USER`, `GRANT` | ✅ |
| [18](./Day%2018:%20Install%20and%20Configure%20DB%20Server/) | Install and Configure DB Server | MariaDB, `mysql`, user + DB setup | ✅ |
| [19](./Day%2019:%20Install%20and%20Configure%20Web%20Application/) | Install and Configure Web Application | Apache subdirectories, `scp -r`, port | ✅ |
| [20](./Day%2020:%20Configure%20Nginx%20+%20PHP-FPM%20Using%20Unix%20Sock/) | Configure Nginx + PHP-FPM Using Unix Sock | FastCGI, unix socket, PHP-FPM config | ✅ |


### 🔀 Module 2 — Version Control `[Days 21–34]`

| Day | Challenge | Core Concept | Status |
|-----|-----------|--------------|--------|
| [21](./Day%2021:%20Set%20Up%20Git%20Repository%20on%20Storage%20Server/) | Set Up Git Repository on Storage Server | `git init --bare`, bare repos | ✅ |
| [22](./Day%2022:%20Clone%20Git%20Repository%20on%20Storage%20Server/) | Clone Git Repository on Storage Server | `git clone`, origin remote | ✅ |
| [23](./Day%2023:%20Fork%20a%20Git%20Repository/) | Fork a Git Repository | fork vs clone, Gitea UI | ✅ |
| [24](./Day%2024:%20Git%20Create%20Branches/) | Git Create Branches | `git checkout -b`, branch pointer | ✅ |
| [25](./Day%2025:%20Git%20Merge%20Branches/) | Git Merge Branches | `git merge`, fast-forward vs 3-way | ✅ |
| [26](./Day%2026:%20Git%20Manage%20Remotes/) | Git Manage Remotes | `git remote add`, multiple remotes | ✅ |
| [27](./Day%2027:%20Git%20Revert%20Some%20Changes/) | Git Revert Some Changes | `git revert`, safe undo | ✅ |
| [28](./Day%2028:%20Git%20Cherry%20Pick/) | Git Cherry Pick | `git cherry-pick`, selective commit copy | ✅ |
| [29](./Day%2029:%20Manage%20Git%20Pull%20Requests/) | Manage Git Pull Requests | PR workflow, code review, Gitea | ✅ |
| [30](./Day%2030:%20Git%20hard%20reset/) | Git hard reset | `git reset --hard`, force push | ✅ |
| [31](./Day%2031:%20Git%20Stash/) | Git Stash | `git stash`, `stash apply`, stash list | ✅ |
| [32](./Day%2032:%20Git%20Rebase/) | Git Rebase | `git rebase`, linear history | ✅ |
| [33](./Day%2033:%20Resolve%20Git%20Merge%20Conflicts/) | Resolve Git Merge Conflicts | conflict markers, `rebase --continue` | ✅ |
| [34](./Day%2034:%20Git%20Hook/) | Git Hook | `post-update`, hook scripts, git tags | ✅ |

### 🐳 Module 3 — Containerization `[Days 35–47]`

| Day | Challenge | Core Concept | Status |
|-----|-----------|--------------|--------|
| [35](./Day%2035:%20Install%20Docker%20Packages%20and%20Start%20Docker%20Service/) | Install Docker Packages and Start Docker Service | `docker-ce`, Docker repo, systemctl | ✅ |
| [36](./Day%2036:%20Deploy%20Nginx%20Container%20on%20Application%20Server/) | Deploy Nginx Container on Application Server | `docker run -d`, image tags | ✅ |
| [37](./Day%2037:%20Copy%20File%20to%20Docker%20Container/) | Copy File to Docker Container | `docker cp`, host-container transfer | ✅ |
| [38](./Day%2038:%20Pull%20Docker%20Image/) | Pull Docker Image | `docker pull`, `docker tag`, image layers | ✅ |
| [39](./Day%2039:%20Create%20a%20Docker%20Image%20From%20Container/) | Create a Docker Image From Container | `docker commit`, image snapshot | ✅ |
| [40](./Day%2040:%20Docker%20EXEC%20Operations/) | Docker EXEC Operations | `docker exec -it`, service inside container | ✅ |
| [41](./Day%2041:%20Write%20a%20Docker%20File/) | Write a Docker File | `Dockerfile`, `FROM`, `RUN`, `CMD`, `EXPOSE` | ✅ |
| [42](./Day%2042:%20Create%20a%20Docker%20Network/) | Create a Docker Network | `docker network create`, bridge, subnet | ✅ |
| [43](./Day%2043:%20Docker%20Ports%20Mapping/) | Docker Ports Mapping | `-p host:container`, port forwarding | ✅ |
| [44](./Day%2044:%20Write%20a%20Docker%20Compose%20File/) | Write a Docker Compose File | `docker-compose.yml`, volumes, services | ✅ |
| [45](./Day%2045:%20Resolve%20Dockerfile%20Issues/) | Resolve Dockerfile Issues | build context, COPY paths, sed, SSL | ✅ |
| [46](./Day%2046:%20Deploy%20an%20App%20on%20Docker%20Containers/) | Deploy an App on Docker Containers | multi-service compose, volumes, env vars | ✅ |
| [47](./Day%2047:%20Docker%20Python%20App/) | Docker Python App | Python Dockerfile, layer caching, WORKDIR | ✅ |

### ☸️ Module 4 — Kubernetes `[Days 48–67]`

| Day | Challenge | Core Concept | Status |
|-----|-----------|--------------|--------|
| [48](./Day%2048:%20Deploy%20Pods%20in%20Kubernetes%20Cluster/) | Deploy Pods in Kubernetes Cluster | `Pod`, YAML spec, `kubectl apply` | ✅ |
| [49](./Day%2049:%20Deploy%20Applications%20with%20Kubernetes%20Deployments/) | Deploy Applications with Kubernetes Deployments | `Deployment`, ReplicaSet, self-healing | ✅ |
| [50](./Day%2050:%20Set%20Resource%20Limits%20in%20Kubernetes%20Pods/) | Set Resource Limits in Kubernetes Pods | requests vs limits, CPU millicores, OOMKill | ✅ |
| 51–67 | Coming soon | | 🔜 |


---

### ⚙️ Module 5 — CI/CD & IaC `[Days 68–100]`
> 🔜 Coming soon

---

## 🗂️ Repo Structure

```
100-days-devops/
│
├── README.md               ← You are here
│
├── Day_01/
│   ├── solution.sh         ← Heavily commented step-by-step commands
│   └── DAY_1.md            ← Concept explanation + clean solution
│
├── Day_02/
│   ├── solution.sh
│   └── DAY_2.md
│
...and so on for each day
```

Each `solution.sh` is written like a **tutorial**, not a script you blindly run — every line is explained with `#` comments.

---

## 🛠️ Technologies Covered

<div align="center">

| Category | Tools |
|----------|-------|
| **OS & Shell** | Linux (CentOS/RHEL), Bash Scripting |
| **Security** | SELinux, SSH Keys, File Permissions |
| **Scheduling** | Cron, cronie, systemd timers |
| **Config Mgmt** | Ansible, YAML playbooks |
| **Databases** | MariaDB, MySQL, PostgreSQL |
| **Containers** | Docker, Docker Compose |
| **Orchestration** | Kubernetes, kubectl |
| **Version Control** | Git, GitHub workflows |
| **CI/CD** | Jenkins, pipelines |
| **IaC** | Terraform, AWS |
| **Web Servers** | Nginx, Apache, SSL/TLS |

</div>

---

## 🚦 How to Use This Repo

**Option A — Follow along with the challenge:**
1. Sign up at [KodeKloud](https://kodekloud.com) and start the Stratos lab
2. Open the corresponding `DAY_N.md` to understand the concept
3. Try to solve it yourself first
4. Use `solution.sh` to verify your approach

**Option B — Just learning concepts:**
- Browse any `DAY_N.md` for a focused mini-lesson on that topic
- Each `.md` is self-contained — no prior context needed

---

## 💡 Philosophy

> "I don't want to just pass tasks — I want to understand what's happening and why."

Every note here answers:
- **What** does this command do?
- **Why** is this the right approach?
- **When** would I use this in real life?
- **What breaks** if I get it wrong?

---

## 🤝 Contributing

Found a better approach? Spotted an error? PRs are welcome.

1. Fork the repo
2. Create a branch: `git checkout -b improve/day-05`
3. Commit your changes
4. Open a Pull Request

---

## 📬 Connect

If this helped you, let's connect:

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin)](https://linkedin.com/in/YOUR_HANDLE)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github)](https://github.com/YOUR_USERNAME)

**Sharing on LinkedIn?** Tag me and use `#100DaysOfDevOps` — I'd love to see your progress!

---

<div align="center">

*Built with 🔥 curiosity, ☕ coffee, and a lot of `man` pages*

**[⬆ Back to Top](#)**

</div>
