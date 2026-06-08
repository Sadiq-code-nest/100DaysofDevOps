<div align="center">

```
██████╗ ███████╗██╗   ██╗ ██████╗ ██████╗ ███████╗
██╔══██╗██╔════╝██║   ██║██╔═══██╗██╔══██╗██╔════╝
██║  ██║█████╗  ██║   ██║██║   ██║██████╔╝███████╗
██║  ██║██╔══╝  ╚██╗ ██╔╝██║   ██║██╔═══╝ ╚════██║
██████╔╝███████╗ ╚████╔╝ ╚██████╔╝██║     ███████║
╚═════╝ ╚══════╝  ╚═══╝   ╚═════╝ ╚═╝     ╚══════╝
```

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
> 🔜 Coming soon

### 🐳 Module 3 — Containerization `[Days 35–47]`
> 🔜 Coming soon

### ☸️ Module 4 — Kubernetes `[Days 48–67]`
> 🔜 Coming soon

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
