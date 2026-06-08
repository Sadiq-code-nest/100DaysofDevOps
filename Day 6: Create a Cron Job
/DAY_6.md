# Day 6 — Setup a Cron Job ⏰

## 📋 Task

> The Nautilus system admins team has prepared scripts to automate day-to-day tasks and wants to deploy them on a schedule on **all app servers** in Stratos DC. Before full deployment, test with a sample cron job:
>
> **a.** Install `cronie` package on all Nautilus app servers and start `crond` service  
> **b.** Add a cron job for **root** user: `*/5 * * * * echo hello > /tmp/cron_text`

---

## 🧠 Concepts Explained

### What is a Cron Job?

A **cron job** is a scheduled task in Linux — like a built-in alarm clock for your server. The cron daemon (`crond`) checks every minute if any scheduled job needs to run.

Common use cases:
- 🗄️ Database backups at midnight
- 📊 Generating reports every hour
- 🧹 Cleaning up temp files weekly
- 📡 Health checks every 5 minutes

### Cron Syntax

```
* * * * * command_to_run
│ │ │ │ │
│ │ │ │ └── Day of Week  (0-7, 0 and 7 = Sunday)
│ │ │ └──── Month        (1-12)
│ │ └────── Day of Month (1-31)
│ └──────── Hour         (0-23)
└────────── Minute       (0-59)
```

#### Special patterns:
| Pattern | Meaning |
|---------|---------|
| `*` | Every unit (every minute, every hour, etc.) |
| `*/5` | Every 5 units (every 5 minutes) |
| `0 * * * *` | Every hour at minute 0 |
| `0 0 * * *` | Every day at midnight |
| `0 9 * * 1` | Every Monday at 9 AM |

### cronie vs cron vs crond

| Term | What it is |
|------|-----------|
| `cron` | The general concept / legacy package |
| `cronie` | Modern cron implementation for RHEL/CentOS |
| `crond` | The actual running daemon (background service) |
| `crontab` | Tool to manage cron job entries |

### crontab commands

```bash
crontab -e    # Edit current user's cron jobs
crontab -l    # List current user's cron jobs
crontab -r    # Remove all cron jobs (careful!)
crontab -u root -e  # Edit root's crontab (as sudo)
```

---

## ✅ Solution

```bash
# Run on ALL 3 app servers
sudo su -

# Install and enable crond
yum install cronie -y
systemctl enable crond && systemctl start crond

# Add cron job (non-interactive method)
(crontab -l 2>/dev/null; echo "*/5 * * * * echo hello > /tmp/cron_text") | crontab -

# Verify
crontab -l

# After 5 mins, check the output
cat /tmp/cron_text   # should print: hello
```

---

## 💡 Key Takeaway

- `*/5 * * * *` = runs at minutes 0, 5, 10, 15... of every hour, every day
- Always `enable` AND `start` a service — enable alone doesn't start it now
- The non-interactive `(crontab -l 2>/dev/null; echo "...")  | crontab -` pattern is great for scripting

---

*Day 6 of 100 | #100DaysOfDevOps #KodeKloud #Linux #Cron*
