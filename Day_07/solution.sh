#!/bin/bash
# ============================================================
# DAY 7 — Linux SSH Automation (Passwordless SSH)
# Host   : Jump Host (thor user)
# Target : All App Servers via their sudo users:
#          tony@stapp01, steve@stapp02, banner@stapp03
# Task   : Set up passwordless SSH from thor (jump host)
#          to all app servers
# ============================================================

# === WHY PASSWORDLESS SSH? ===
# Automation scripts can't type passwords interactively.
# SSH key authentication allows trusted, password-free login.
# Works by: placing your PUBLIC key in the remote server's authorized_keys file

# ============================================================
# STEP 1: Generate SSH Key Pair on Jump Host (thor user)
# ============================================================
# Run as thor on jump host
# -t rsa      = RSA algorithm (widely supported)
# -b 4096     = 4096-bit key (stronger than default 2048)
# Press ENTER for all prompts (no passphrase for automation)
ssh-keygen -t rsa
# Keys generated at:
#   ~/.ssh/id_rsa       ← PRIVATE key (keep secret, never share!)
#   ~/.ssh/id_rsa.pub   ← PUBLIC key  (this goes to remote servers)

# STEP 2: View the generated public key (optional verification)
cat ~/.ssh/id_rsa.pub
# Output looks like: ssh-rsa AAAA...long string... thor@jumphost

# ============================================================
# STEP 3: Copy public key to each App Server
# ============================================================
# ssh-copy-id automatically:
#   1. Connects to remote server (will ask for password THIS time)
#   2. Appends your public key to remote ~/.ssh/authorized_keys
#   3. Sets correct permissions on remote .ssh directory

# App Server 1 (tony)
ssh-copy-id tony@stapp01
# Enter tony's password when prompted

# App Server 2 (steve)
ssh-copy-id steve@stapp02
# Enter steve's password when prompted

# App Server 3 (banner)
ssh-copy-id banner@stapp03
# Enter banner's password when prompted

# ============================================================
# STEP 4: Test passwordless SSH (no password should be asked)
# ============================================================
ssh tony@stapp01 "echo 'Passwordless login to stapp01 works!'"
ssh steve@stapp02 "echo 'Passwordless login to stapp02 works!'"
ssh banner@stapp03 "echo 'Passwordless login to stapp03 works!'"

# ============================================================
# STEP 5: Verify authorized_keys on remote server (optional)
# ============================================================
# SSH in and check
ssh tony@stapp01
cat ~/.ssh/authorized_keys
# thor's public key should be listed here
exit

# ============================================================
# TROUBLESHOOTING — if ssh-copy-id fails
# ============================================================
# Manual alternative: copy key by hand
# cat ~/.ssh/id_rsa.pub | ssh tony@stapp01 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
