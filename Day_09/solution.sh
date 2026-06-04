#!/bin/bash
# ============================================================
# DAY 9 — Debugging MariaDB Issues
# Server : Database Server (stdb01)
# Task   : MariaDB service is down — find root cause and fix it
#          so the application can reconnect to the database
# ============================================================

# ============================================================
# STEP 1: SSH into the database server
# ============================================================
# ssh root@stdb01   (or the appropriate user)

# ============================================================
# STEP 2: Check MariaDB service status
# ============================================================
systemctl status mariadb
# Look for:
#   Active: failed  ← service is down
#   Error messages in the journal log section

# View detailed logs for more clues
journalctl -xe --unit=mariadb
# OR
journalctl -u mariadb --no-pager | tail -50

# ============================================================
# STEP 3: Investigate the data directory permissions
# ============================================================
# MariaDB stores its data in /var/lib/mysql
# If permissions are wrong → MariaDB can't read/write → crashes

ls -lah /var/lib/
# Look at the mysql directory ownership:
# drwxr-xr-x 1 root  mysql  ← WRONG: owner is root, should be mysql
# drwxr-xr-x 1 mysql mysql  ← CORRECT: mysql user owns it

ls -lah /var/lib/mysql/
# Check files inside too — they should all be owned by mysql:mysql

# ============================================================
# STEP 4: Fix the ownership of the MySQL data directory
# ============================================================
# chown -R = recursive (applies to all files and subdirectories)
# mysql:mysql = user:group both set to mysql
chown -R mysql:mysql /var/lib/mysql

# Verify the fix
ls -lah /var/lib/mysql/
# Should now show: drwxr-xr-x 1 mysql mysql ...

# ============================================================
# STEP 5: Start (or restart) the MariaDB service
# ============================================================
systemctl start mariadb
# OR if it was previously started with wrong state:
# systemctl restart mariadb

# ============================================================
# STEP 6: Verify MariaDB is now running
# ============================================================
systemctl status mariadb
# Expected: Active: active (running)

# Enable MariaDB to start on boot (good practice)
systemctl enable mariadb

# ============================================================
# STEP 7: Test database connectivity
# ============================================================
mysql -u root -p
# Enter root password
# If you get the mysql> prompt → success!
# Type: exit

# ============================================================
# ROOT CAUSE SUMMARY
# ============================================================
# Problem : /var/lib/mysql was owned by root instead of mysql
# Effect  : mariadb process (runs as mysql user) couldn't access its data
# Fix     : chown -R mysql:mysql /var/lib/mysql
# Result  : MariaDB service starts successfully
