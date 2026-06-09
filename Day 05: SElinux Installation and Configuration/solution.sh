#!/bin/bash
# ============================================================
# DAY 5 — SELinux Installation & Permanent Disable
# Server : App Server 2 (stapp02) | User: steve
# Task   : Install SELinux packages, permanently disable SELinux
#          (takes effect after reboot — do NOT reboot now)
# ============================================================

# STEP 1: SSH into App Server 2 from jump host
# ssh steve@stapp02

# STEP 2: Switch to root (required for system-level changes)
sudo su -

# STEP 3: Check the OS version (important for correct package manager)
cat /etc/os-release
# This tells us if we're on CentOS/RHEL → use yum
# Ubuntu/Debian → use apt

# STEP 4: Check current SELinux status
sestatus
# Shows: SELinuxfs mount, current mode (Enforcing/Permissive/Disabled)
# getenforce   ← simpler command, just prints mode

# STEP 5: Install required SELinux packages
# selinux-policy          = core SELinux policy framework
# selinux-policy-targeted = targeted policy (most common type)
yum install selinux-policy selinux-policy-targeted -y

# STEP 6: Edit the SELinux configuration file to PERMANENTLY disable
# This file controls SELinux state AFTER reboot
# /etc/selinux/config is the persistent config (NOT runtime)
vi /etc/selinux/config
# Find the line:  SELINUX=enforcing
# Change it to:   SELINUX=disabled
# Save and exit:  :wq

# --- What the config file looks like after edit ---
# # This file controls the state of SELinux on the system.
# # SELINUX= can take one of these three values:
# #     enforcing  - SELinux security policy is enforced.
# #     permissive - SELinux prints warnings instead of enforcing.
# #     disabled   - No SELinux policy is loaded.
# SELINUX=disabled          ← this line
# SELINUXTYPE=targeted

# ALTERNATIVE — sed command to change without opening editor:
# sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config

# STEP 7: Verify the file change was saved correctly
grep "^SELINUX=" /etc/selinux/config
# Expected: SELINUX=disabled

# STEP 8: Check runtime status (will still show old state — that's OK!)
sestatus
# NOTE: Current mode may still show "Enforcing" — this is EXPECTED
# The disable only takes effect after the scheduled reboot tonight
# Task says: "Disregard the current status via command line"

# STEP 9: DO NOT reboot (scheduled maintenance reboot handles this)
# A reboot now is NOT required and NOT desired per task instructions
