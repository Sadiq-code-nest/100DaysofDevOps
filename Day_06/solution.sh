#!/bin/bash
# ============================================================
# DAY 6 — Setup a Cron Job
# Servers: ALL App Servers (stapp01, stapp02, stapp03)
# Task   : Install cronie, start crond service, and add a
#          cron job for root: */5 * * * * echo hello > /tmp/cron_text
# ============================================================

# ---- Run these steps on EACH app server ----
# ssh tony@stapp01   (App Server 1)
# ssh steve@stapp02  (App Server 2)
# ssh banner@stapp03 (App Server 3)

# STEP 1: Switch to root
sudo su -

# STEP 2: Install the cronie package
# cronie = the modern cron daemon for RHEL/CentOS systems
# It includes: crond (daemon), crontab (user tool), anacron (catch-up jobs)
yum install cronie -y

# STEP 3: Enable crond to start on boot AND start it immediately
# enable  = sets it to auto-start on every reboot
# start   = starts it right now in this session
systemctl enable crond
systemctl start crond

# STEP 4: Verify crond is running
systemctl status crond
# Look for: Active: active (running)

# STEP 5: Add the cron job for root user
# crontab -e  opens root's crontab in the default editor
# We'll use a non-interactive method to avoid editor interaction:
(crontab -l 2>/dev/null; echo "*/5 * * * * echo hello > /tmp/cron_text") | crontab -
# Explanation:
#   crontab -l        → list existing cron jobs (2>/dev/null suppresses "no crontab" error)
#   echo "..."        → the new cron job line
#   | crontab -       → pipe combined output as the new crontab

# INTERACTIVE ALTERNATIVE (if you want to use the editor):
# crontab -e
# Then type:  */5 * * * * echo hello > /tmp/cron_text
# Save with:  :wq  (vim) or Ctrl+O, Ctrl+X (nano)

# STEP 6: Understanding the cron schedule: */5 * * * *
# ┌─────────── minute (*/5 = every 5 minutes: 0,5,10,15...)
# │ ┌───────── hour   (* = every hour)
# │ │ ┌─────── day of month (* = every day)
# │ │ │ ┌───── month  (* = every month)
# │ │ │ │ ┌─── day of week (* = every day of week)
# │ │ │ │ │
# */5 * * * *   echo hello > /tmp/cron_text

# STEP 7: Verify the cron job was added
crontab -l
# Expected output:  */5 * * * * echo hello > /tmp/cron_text

# STEP 8: Wait 5 minutes, then verify the output file exists
# cat /tmp/cron_text
# Expected: hello
