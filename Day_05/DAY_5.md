# Day 5 — SELinux Installation & Configuration 🛡️

## 📋 Task

> Following a security audit, xFusionCorp Industries decided to enhance security with SELinux on **App Server 2** in the Stratos Datacenter:
> - Install the required SELinux packages
> - **Permanently disable** SELinux (will be re-enabled after config changes)
> - Do NOT reboot (scheduled maintenance reboot planned for tonight)
> - Disregard the current runtime status — final status after reboot should be **disabled**

---

## 🧠 Concepts Explained

### What is SELinux?

**SELinux (Security-Enhanced Linux)** is a Linux kernel security module that provides **Mandatory Access Control (MAC)** — a layer of security on top of standard Linux permissions.

Think of it like this:
- Standard Linux permissions = a lock on your front door
- SELinux = a full security system with zones, cameras, and access logs

It was originally developed by the **NSA** and is built into the Linux kernel.

### SELinux Modes

| Mode | Description |
|------|-------------|
| **Enforcing** | SELinux policy is active — violations are **blocked and logged** |
| **Permissive** | SELinux policy is active — violations are **logged only** (not blocked) |
| **Disabled** | SELinux is completely **off** — no policy loaded |

```bash
getenforce          # Quick check: Enforcing / Permissive / Disabled
sestatus            # Detailed status report
```

### Runtime vs Persistent Configuration

| File/Command | Scope | Survives Reboot? |
|---|---|---|
| `setenforce 0` | Runtime (immediate) | ❌ No |
| `/etc/selinux/config` | Persistent config | ✅ Yes |

**Key insight:** This task requires a **permanent** change → edit the config file, not just `setenforce`.

### SELinux Policy Types

- **targeted** (most common) — only targeted processes are confined
- **strict** — all processes are confined
- **mls** — Multi-Level Security, highest control

---

## ✅ Solution

```bash
# SSH in and switch to root
ssh steve@stapp02
sudo su -

# Check current state
sestatus

# Install SELinux packages
yum install selinux-policy selinux-policy-targeted -y

# Permanently disable via config file
vi /etc/selinux/config
# Change:  SELINUX=enforcing
# To:      SELINUX=disabled

# OR use sed (faster, no editor needed):
sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config

# Verify the change
grep "^SELINUX=" /etc/selinux/config
# Output: SELINUX=disabled

# DO NOT reboot — maintenance window handles this
```

---

## ⚠️ Important Notes

- `sestatus` may still show **Enforcing** after this step — that's correct!
- The permanent disable only kicks in after the reboot
- The task specifically says to **disregard the current runtime status**
- Never use `setenforce 0` for a permanent solution — it resets on reboot

---

## 💡 Key Takeaway

- Runtime changes: `setenforce 0/1` — **temporary**
- Permanent changes: `/etc/selinux/config` — **persists across reboots**
- Always prefer `sed -i` for automated/scripted config changes

---

*Day 5 of 100 | #100DaysOfDevOps #KodeKloud #SELinux #Security*
