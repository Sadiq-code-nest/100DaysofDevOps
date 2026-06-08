#!/bin/bash
# ============================================================
# DAY 8 — Setup Ansible on Jump Host
# Host   : Jump Host
# Task   : Install Ansible version 4.8.0 using pip3 ONLY
#          Make ansible binary available GLOBALLY (all users)
# ============================================================

# === WHY pip3 ONLY? ===
# pip3 = Python package manager → installs the exact version we need
# yum/apt repos often have outdated Ansible versions
# pip3 allows precise version pinning: ansible==4.8.0

# ============================================================
# STEP 1: Verify pip3 is available
# ============================================================
pip3 --version
# If not found: yum install python3-pip -y

# STEP 2: Check Python3 location
which python3
python3 --version

# ============================================================
# STEP 3: Install Ansible 4.8.0 via pip3
# ============================================================
# sudo is REQUIRED for global installation
# Without sudo → installs only for current user (~/.local/bin)
# With sudo    → installs system-wide (/usr/local/bin) = all users
sudo pip3 install ansible==4.8.0

# ============================================================
# STEP 4: Verify the installation
# ============================================================
ansible --version
# Expected output:
# ansible [core X.X.X]
#   ansible python module location = /usr/lib/python3.x/site-packages/ansible
#   ansible collection location = ...
#   python version = 3.x.x

# Check WHERE ansible binary is installed (must be in system path)
which ansible
# Should show: /usr/local/bin/ansible  (accessible to all users)

# Verify it's globally available (test as another user)
ls -l $(which ansible)
# Should be readable/executable by all

# ============================================================
# STEP 5: Check Ansible version specifically
# ============================================================
ansible --version | head -1
# ansible [core X.X.X]  ← Ansible 4.x uses "core" for the engine

# ============================================================
# TROUBLESHOOTING — if ansible not found after install
# ============================================================
# The binary might be in /usr/local/bin — check if it's in PATH
echo $PATH
# If /usr/local/bin is missing, add it:
# export PATH=$PATH:/usr/local/bin
# echo 'export PATH=$PATH:/usr/local/bin' >> /etc/profile  # permanent

# If installed without sudo (user-level), move it:
# sudo cp ~/.local/bin/ansible /usr/local/bin/
