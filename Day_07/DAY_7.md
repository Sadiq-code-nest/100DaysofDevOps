# Day 7 — Linux SSH Automation 🔑

## 📋 Task

> The xFusionCorp sysadmin team has scripts on the jump host that run on regular intervals and perform operations on all app servers. To make these scripts work, **thor** on jump host needs **passwordless SSH access** to all app servers through their respective sudo users:
> - `tony` → stapp01
> - `steve` → stapp02  
> - `banner` → stapp03

---

## 🧠 Concepts Explained

### How SSH Key Authentication Works

Traditional SSH uses passwords — insecure and can't be automated. SSH keys solve this with **public-key cryptography**:

```
┌─────────────┐                    ┌─────────────┐
│  Jump Host  │                    │  App Server │
│  (thor)     │                    │  (tony)     │
│             │                    │             │
│ 🔑 id_rsa   │── public key ───▶  │ authorized_ │
│ (private)   │                    │ keys file   │
│             │◀── challenge ────  │             │
│             │── signed proof ──▶ │             │
│             │◀─── ACCESS ──────  │             │
└─────────────┘                    └─────────────┘
```

**How it works:**
1. You generate a **key pair**: private key (secret) + public key (shareable)
2. You place your **public key** on the remote server's `~/.ssh/authorized_keys`
3. When you SSH in, the server challenges you — your private key signs the response
4. No password needed — math proves you own the private key

### The Files Involved

| File | Location | Purpose |
|------|----------|---------|
| `id_rsa` | `~/.ssh/id_rsa` | Your **private** key — never share! |
| `id_rsa.pub` | `~/.ssh/id_rsa.pub` | Your **public** key — share freely |
| `authorized_keys` | `~/.ssh/authorized_keys` on remote | List of public keys allowed in |
| `known_hosts` | `~/.ssh/known_hosts` on local | Fingerprints of trusted servers |

### Permissions Matter!

SSH is paranoid about permissions — wrong permissions = SSH refuses to use the key:
```bash
chmod 700 ~/.ssh              # Only owner can read/write/execute
chmod 600 ~/.ssh/id_rsa       # Only owner can read/write private key
chmod 644 ~/.ssh/id_rsa.pub   # Public key, others can read
chmod 600 ~/.ssh/authorized_keys  # Only owner can read/write
```

`ssh-copy-id` sets all these automatically ✅

---

## ✅ Solution

```bash
# On jump host as thor:

# 1. Generate SSH key pair
ssh-keygen -t rsa
# Press Enter for all prompts (no passphrase)

# 2. Copy public key to each app server
ssh-copy-id tony@stapp01    # enter tony's password once
ssh-copy-id steve@stapp02   # enter steve's password once
ssh-copy-id banner@stapp03  # enter banner's password once

# 3. Test passwordless login
ssh tony@stapp01    # should NOT ask for password
ssh steve@stapp02
ssh banner@stapp03

# 4. Verify on remote side (optional)
cat ~/.ssh/authorized_keys
```

---

## 💡 Key Takeaway

- SSH keys = passwordless, secure, automation-friendly
- `ssh-keygen` creates the key pair; `ssh-copy-id` distributes the public key
- You only type the password **once** during `ssh-copy-id` — never again after
- This setup enables scripts to SSH across servers without human intervention

---

*Day 7 of 100 | #100DaysOfDevOps #KodeKloud #SSH #Linux*
