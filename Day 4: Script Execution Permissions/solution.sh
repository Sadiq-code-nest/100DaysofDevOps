#!/bin/bash
# ============================================================
# DAY 4 — Script Execute Permissions
# Server : App Server 2 (stapp02) | User: steve
# Task   : Grant executable permission to /tmp/xfusioncorp.sh
#          so that ALL users on the system can execute it
# ============================================================

# STEP 1: SSH into App Server 2 (run from jump host)
# ssh steve@stapp02

# STEP 2: Navigate to /tmp and confirm the file exists
cd /tmp
ls -l xfusioncorp.sh
# Expected (before fix): -rw-r--r-- 1 root root ... xfusioncorp.sh
# Notice: NO execute (x) bit for anyone

# STEP 3: Understand chmod numeric mode
# chmod [owner][group][others] filename
#   Each digit = sum of: read(4) + write(2) + execute(1)
#   7 = 4+2+1 = rwx  (full permissions)
#   5 = 4+0+1 = r-x  (read + execute, no write)
#   4 = 4+0+0 = r--  (read only)
#
# chmod 777 = rwxrwxrwx → ALL users (owner, group, others) get full access
# chmod 755 = rwxr-xr-x → Owner full, group+others can only read+execute
# For this task: ALL users must execute → use 777 (or at minimum 755)

# STEP 4: Apply executable permissions for all users
chmod 777 /tmp/xfusioncorp.sh

# STEP 5: Verify the new permissions
ls -l /tmp/xfusioncorp.sh
# Expected output: -rwxrwxrwx 1 root root ... xfusioncorp.sh
#                   ^^^ ^^^ ^^^
#                   own grp oth  → all have execute (x)

# STEP 6: Test the script runs (optional)
# /tmp/xfusioncorp.sh
