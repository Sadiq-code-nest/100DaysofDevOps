# Day 9 — Debugging MariaDB Issues 🗄️

## 📋 Task

> There is a critical issue with the Nautilus application in Stratos DC — the application **cannot connect to the database**. After investigation, the team found that the **MariaDB service is down** on the database server (`stdb01`).
>
> Find the root cause and fix it so MariaDB starts successfully.

---

## 🧠 Concepts Explained

### What is MariaDB?

**MariaDB** is an open-source relational database management system (RDBMS) — a community fork of MySQL. It's widely used as the "M" in the LAMP/LEMP stack.

It stores data in `/var/lib/mysql/` and runs as the `mysql` system user.

### Linux Service Users

In Linux, system services like databases run as **dedicated low-privilege users** (not root) for security:

| Service | Runs as User |
|---------|-------------|
| mariadb/mysql | `mysql` |
| nginx | `nginx` |
| apache | `apache` |
| postgres | `postgres` |

This is a **security principle** — if the service is compromised, the attacker only gets `mysql` user access, not root.

### File Ownership and Services

If a service's data directory is **owned by the wrong user**, the service can't read/write its own files:

```
Service (mysql user) tries to read /var/lib/mysql/
↓
File is owned by: root (not mysql)
↓
Permission denied!
↓
Service crashes / fails to start
```

### Debugging Methodology: "Check Logs First"

```bash
# 1. Check service status
systemctl status mariadb

# 2. Check detailed logs
journalctl -u mariadb --no-pager | tail -50

# 3. Look for clues in error messages:
#    "Permission denied" → ownership/permissions issue
#    "Address already in use" → port conflict
#    "Can't connect to socket" → socket file issue
#    "Table is marked as crashed" → data corruption

# 4. Fix the root cause (not just restart!)
# 5. Verify the fix
```

### chown — Change Ownership

```bash
chown user:group file          # change single file
chown -R user:group directory  # change directory + all contents recursively

# Examples:
chown mysql:mysql /var/lib/mysql       # fix mariadb data dir
chown -R www-data:www-data /var/www/   # fix nginx/apache web files
chown root:root /etc/passwd            # system file should be root
```

---

## ✅ Solution

```bash
# SSH to database server
ssh root@stdb01

# Check service status and find error
systemctl status mariadb
journalctl -u mariadb --no-pager | tail -30

# Investigate data directory ownership
ls -lah /var/lib/mysql/
# Problem: owned by root instead of mysql user

# Fix: restore correct ownership
chown -R mysql:mysql /var/lib/mysql

# Verify fix
ls -lah /var/lib/mysql/  # should show mysql:mysql

# Start service
systemctl start mariadb
systemctl enable mariadb

# Confirm it's running
systemctl status mariadb

# Test connection
mysql -u root -p
```

---

## 🔍 Root Cause

| | Details |
|--|---------|
| **Problem** | `/var/lib/mysql` owned by `root` instead of `mysql` |
| **Effect** | MariaDB (running as `mysql` user) couldn't access its data files |
| **Fix** | `chown -R mysql:mysql /var/lib/mysql` |
| **Lesson** | Always check file ownership when a service fails to start |

---

## 💡 Key Takeaway

- Services run as dedicated users — their data directories must match
- `systemctl status` + `journalctl` are your best debugging tools
- `chown -R user:group path` fixes recursive ownership issues
- Fix the **root cause**, not just restart the service

---

*Day 9 of 100 | #100DaysOfDevOps #KodeKloud #MariaDB #Debugging*
