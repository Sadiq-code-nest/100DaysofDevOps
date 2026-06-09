# Day 4 — Script Execute Permissions 🔐

## 📋 Task

> In a bid to automate backup processes, the xFusionCorp Industries sysadmin team developed a new bash script named `xfusioncorp.sh`. While the script has been distributed to all necessary servers, it **lacks executable permissions** on App Server 2 within the Stratos Datacenter.
>
> Grant executable permissions to `/tmp/xfusioncorp.sh` on **App Server 2** so that **all users** can execute it.

---

## 🧠 Concepts Explained

### What are Linux File Permissions?

Every file in Linux has **3 permission sets** for 3 types of users:

```
-rwxr-xr--
 ^^^         → Owner permissions
    ^^^      → Group permissions
       ^^^   → Others permissions
```

Each set has 3 bits: **r**ead (4), **w**rite (2), e**x**ecute (1)

### chmod — Change Mode

`chmod` changes who can do what with a file.

#### Numeric (Octal) Mode:
| Number | Binary | Meaning |
|--------|--------|---------|
| 7 | 111 | rwx — read + write + execute |
| 6 | 110 | rw- — read + write |
| 5 | 101 | r-x — read + execute |
| 4 | 100 | r-- — read only |
| 0 | 000 | --- — no permissions |

#### Common patterns:
```bash
chmod 755 file   # Owner: full | Group+Others: read+execute
chmod 777 file   # Everyone: full permissions (use carefully!)
chmod 644 file   # Owner: read+write | Group+Others: read only
```

### Why does execute permission matter for scripts?

Without the `x` (execute) bit, the OS refuses to run the script directly:
```bash
bash: ./script.sh: Permission denied
```

---

## ✅ Solution

```bash
# SSH into App Server 2
ssh steve@stapp02

# Check current permissions
ls -l /tmp/xfusioncorp.sh

# Grant execute to all users
chmod 777 /tmp/xfusioncorp.sh

# Verify
ls -l /tmp/xfusioncorp.sh
# Output: -rwxrwxrwx ... xfusioncorp.sh
```

---

## 💡 Key Takeaway

- `chmod 777` = everyone (owner, group, others) gets **read + write + execute**
- For scripts that must run as any user, `755` is safer (prevents accidental overwrites), but `777` satisfies this task's requirement explicitly
- Always verify with `ls -l` after applying permissions

---

*Day 4 of 100 | #100DaysOfDevOps #KodeKloud #Linux*
