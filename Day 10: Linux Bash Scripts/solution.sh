#!/bin/bash
# ============================================================
# DAY 10 — Create a Bash Backup Script
# Server : App Server 3 (stapp03) | User: banner
# Task   : Create media_backup.sh under /scripts that:
#          a) Zips /var/www/html/media → xfusioncorp_media.zip
#          b) Saves zip to /backup/ on App Server 3
#          c) Copies zip to Nautilus Backup Server (/backup/)
#          d) No password prompt during copy (passwordless SSH)
#          e) No sudo inside the script
# ============================================================

# ============================================================
# PRE-STEPS (run manually BEFORE creating the script)
# ============================================================

# PRE-1: Install zip package (must be done outside the script)
sudo yum install zip -y

# PRE-2: Create required directories
sudo mkdir -p /scripts /backup

# Give banner user ownership so they can run the script
sudo chown banner:banner /scripts /backup

# PRE-3: Setup passwordless SSH to backup server (clint@stbkp01)
# The backup server user is typically 'clint'
ssh-keygen -t rsa     # press Enter for all prompts
ssh-copy-id clint@stbkp01  # enter clint's password once

# Test passwordless SSH works
ssh clint@stbkp01 "echo SSH working"

# PRE-4: Make sure /backup directory exists on backup server too
ssh clint@stbkp01 "mkdir -p /backup"

# ============================================================
# MAIN: Create the actual backup script
# ============================================================
# IMPORTANT: Do NOT use sudo inside the script (per task requirements)
# The script should be executable by banner without elevated privileges

cat > /scripts/media_backup.sh << 'SCRIPT'
#!/bin/bash
# ============================================================
# media_backup.sh — Website Media Backup Script
# Author  : banner (App Server 3)
# Purpose : Backup /var/www/html/media to local + remote
# Schedule: To be added to cron for automation
# ============================================================

# Variables — easy to update if paths change
SOURCE_DIR="/var/www/html/media"
BACKUP_DIR="/backup"
ARCHIVE_NAME="xfusioncorp_media.zip"
BACKUP_SERVER="clint@stbkp01"
REMOTE_BACKUP_DIR="/backup"

# STEP 1: Create zip archive of the media directory
# zip -r = recursive (include all subdirectories and files)
echo "[$(date)] Starting backup of $SOURCE_DIR..."
zip -r "$BACKUP_DIR/$ARCHIVE_NAME" "$SOURCE_DIR"

if [ $? -eq 0 ]; then
    echo "[$(date)] Archive created: $BACKUP_DIR/$ARCHIVE_NAME"
else
    echo "[$(date)] ERROR: Failed to create archive!"
    exit 1
fi

# STEP 2: Copy the archive to Nautilus Backup Server via SCP
# scp = secure copy over SSH
# -o StrictHostKeyChecking=no = avoid host key prompt in automation
echo "[$(date)] Copying backup to $BACKUP_SERVER:$REMOTE_BACKUP_DIR..."
scp "$BACKUP_DIR/$ARCHIVE_NAME" "$BACKUP_SERVER:$REMOTE_BACKUP_DIR/"

if [ $? -eq 0 ]; then
    echo "[$(date)] Backup successfully copied to remote server!"
else
    echo "[$(date)] ERROR: Failed to copy backup to remote server!"
    exit 1
fi

echo "[$(date)] Backup process completed successfully."
SCRIPT

# ============================================================
# STEP 5: Make the script executable by banner (and all users)
# ============================================================
chmod +x /scripts/media_backup.sh
# OR for all users: chmod 755 /scripts/media_backup.sh

# ============================================================
# STEP 6: Run the script to test it
# ============================================================
/scripts/media_backup.sh

# ============================================================
# STEP 7: Verify backups exist
# ============================================================
# Check local backup
ls -lh /backup/xfusioncorp_media.zip

# Check remote backup
ssh clint@stbkp01 "ls -lh /backup/xfusioncorp_media.zip"
