# Day 8 — Setup Ansible 🤖

## 📋 Task

> The Nautilus DevOps team has decided to use **Ansible** for configuration management and automation. The jump host will serve as the **Ansible controller**.
>
> Install **Ansible version 4.8.0** on the jump host using **pip3 only**. The Ansible binary must be available **globally** (all users on the system can run Ansible commands).

---

## 🧠 Concepts Explained

### What is Ansible?

**Ansible** is an open-source automation tool for:
- **Configuration management** — ensure servers are in the desired state
- **Application deployment** — deploy apps consistently across many servers
- **Orchestration** — coordinate complex multi-server workflows
- **Provisioning** — set up new servers automatically

It's **agentless** — no software needed on target servers, just SSH + Python.

### Ansible Architecture

```
┌─────────────────┐        SSH        ┌──────────────┐
│  Control Node   │ ───────────────▶  │  App Server 1│
│  (Jump Host)    │                   └──────────────┘
│                 │        SSH        ┌──────────────┐
│  ansible        │ ───────────────▶  │  App Server 2│
│  playbooks      │                   └──────────────┘
│  inventory      │        SSH        ┌──────────────┐
└─────────────────┘ ───────────────▶  │  App Server 3│
                                      └──────────────┘
```

### pip3 vs yum/apt for Ansible

| Method | Pros | Cons |
|--------|------|------|
| `pip3 install ansible==X.X.X` | Exact version control, latest versions | Requires Python |
| `yum install ansible` | Simple, system-integrated | Often outdated version |

**Why pip3 here:** The task requires a **specific version** (4.8.0) — pip3 is the only reliable way.

### Global vs User Installation

```bash
# User-level (only current user):
pip3 install ansible
# Installs to: ~/.local/bin/ansible

# Global (ALL users):
sudo pip3 install ansible
# Installs to: /usr/local/bin/ansible  ← accessible to everyone
```

### Ansible 4.x vs Ansible Core

Starting from Ansible 4.0, there are two packages:
- `ansible` — the full package with community collections (what we install)
- `ansible-core` — just the engine (minimal)

`ansible==4.8.0` installs both, with `ansible-core` as a dependency.

---

## ✅ Solution

```bash
# Verify pip3 is available
pip3 --version

# Install ansible 4.8.0 globally (sudo = all users can access it)
sudo pip3 install ansible==4.8.0

# Verify installation
ansible --version

# Confirm it's globally accessible
which ansible
# Expected: /usr/local/bin/ansible

ls -l $(which ansible)
# Check it's executable
```

---

## 💡 Key Takeaway

- `sudo pip3 install` = global install → all users get access
- Without `sudo` → user-level install → only you can run it
- Always verify with `which ansible` that the binary is in a system-wide PATH location
- Ansible requires NO agent on target servers — just SSH access + Python

---

*Day 8 of 100 | #100DaysOfDevOps #KodeKloud #Ansible #Automation*
