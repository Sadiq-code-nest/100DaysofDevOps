# Day 10 — Create a Bash Backup Script 📦

## 📋 Task

> The production support team needs a bash script for website backups. A static website runs on **App Server 3** and needs a script `media_backup.sh` placed at `/scripts/`:
>
> **a.** Create a zip archive `xfusioncorp_media.zip` of `/var/www/html/media`  
> **b.** Save archive to `/backup/` on App Server 3 (weekly cleanup location)  
> **c.** Copy archive to **Nautilus Backup Server** at `/backup/`  
> **d.** No password prompts during copy (passwordless SSH required)  
> **e.** No `sudo` inside the script  
> **Note:** Install `zip` package manually before running the script

---

## 🧠 Concepts Explained

### Bash Scripting Essentials

A bash script is a file containing shell commands that run sequentially. Key elements:

```bash
#!/bin/bash          # Shebang — tells OS which interpreter to use

# Variables
SOURCE="/var/www/html/media"
echo "$SOURCE"       # Always quote variables

# Exit codes
command
if [ $? -eq 0 ]; then   # $? = exit code of last command (0 = success)
    echo "Success"
else
    echo "Failed"
    exit 1              # Exit with error code
fi
```

### zip vs tar

| Tool | Use Case | Command |
|------|----------|---------|
| `zip` | Cross-platform, Windows-friendly | `zip -r archive.zip directory/` |
| `tar.gz` | Linux-native, more efficient | `tar -czf archive.tar.gz directory/` |
| `tar.bz2` | Better compression than .gz | `tar -cjf archive.tar.bz2 directory/` |

For this task: `zip -r` (required by task specification)

### SCP — Secure Copy

`scp` copies files over SSH — same security, same authentication:

```bash
# Local to remote:
scp /local/file user@host:/remote/path/

# Remote to local:
scp user@host:/remote/file /local/path/

# Recursive (for directories):
scp -r /local/dir user@host:/remote/path/
```

### Why No sudo in the Script?

The task specifies `banner` user runs the script. Using `sudo` inside would require:
- A password prompt (breaks automation)
- Explicit sudoers configuration

**Solution:** Give `banner` proper ownership of `/backup/` and `/scripts/` upfront, so the script doesn't need elevated permissions.

### Error Handling in Scripts

```bash
# Check if last command succeeded
if [ $? -eq 0 ]; then
    echo "Success"
else
    echo "Failed"
    exit 1     # Stop script with error
fi

# Alternative: set -e (exit on any error)
set -e
zip -r archive.zip /dir   # if this fails, script stops automatically
```

---

## ✅ Solution

### Pre-steps (manual, run once):
```bash
# Install zip
sudo yum install zip -y

# Create directories with correct ownership
sudo mkdir -p /scripts /backup
sudo chown banner:banner /scripts /backup

# Setup passwordless SSH to backup server
ssh-keygen -t rsa
ssh-copy-id clint@stbkp01

# Ensure remote backup dir exists
ssh clint@stbkp01 "mkdir -p /backup"
```

### The Script (`/scripts/media_backup.sh`):
```bash
#!/bin/bash
SOURCE_DIR="/var/www/html/media"
BACKUP_DIR="/backup"
ARCHIVE_NAME="xfusioncorp_media.zip"
BACKUP_SERVER="clint@stbkp01"

# Create zip
zip -r "$BACKUP_DIR/$ARCHIVE_NAME" "$SOURCE_DIR"

# Copy to backup server (passwordless)
scp "$BACKUP_DIR/$ARCHIVE_NAME" "$BACKUP_SERVER:/backup/"

echo "Backup completed!"
```

### Make executable and run:
```bash
chmod +x /scripts/media_backup.sh
/scripts/media_backup.sh

# Verify
ls -lh /backup/xfusioncorp_media.zip
ssh clint@stbkp01 "ls -lh /backup/xfusioncorp_media.zip"
```

---

## 💡 Key Takeaway

- Always install dependencies **outside** automation scripts (not inside)
- Set up passwordless SSH **before** scripts that use SCP/SSH
- Use `$?` or `if` blocks for error handling — silent failures are dangerous
- Give service users proper directory ownership instead of using `sudo` everywhere

---

*Day 10 of 100 | #100DaysOfDevOps #KodeKloud #Bash #Scripting #Backup*
