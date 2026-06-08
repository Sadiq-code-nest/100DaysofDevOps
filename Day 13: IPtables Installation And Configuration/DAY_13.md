# Day 13: IPtables Installation And Configuration 🔥

## Task
Install `iptables` on all app servers. Block port `3003` for everyone **except** the LBR host (`172.16.238.14`). Rules must survive reboots.

---

## What is iptables?
`iptables` is Linux's built-in firewall — it filters network traffic using **rules**. Rules are checked top-to-bottom; the first match wins.

### Rule order matters critically:
```
Rule 1: ALLOW from 172.16.238.14 → port 3003   ← LBR gets in
Rule 2: DROP  from anyone        → port 3003   ← everyone else blocked
```
If you put DROP first, even the LBR gets blocked. **Order = logic.**

### Key iptables flags:
| Flag | Meaning |
|------|---------|
| `-I INPUT 1` | Insert at position 1 (top) |
| `-p tcp` | TCP protocol |
| `-s 172.16.238.14` | Source IP |
| `--dport 3003` | Destination port |
| `-j ACCEPT/DROP` | Action |

### Making rules persistent:
`iptables` rules reset on reboot unless saved. Two ways:
```bash
service iptables save          # RHEL/CentOS with iptables-services
iptables-save > /etc/iptables/rules.v4   # Debian/Ubuntu
```

---

## Solution

```bash
yum install -y iptables-services
systemctl enable iptables && systemctl start iptables

iptables -I INPUT 1 -p tcp -s 172.16.238.14 --dport 3003 -j ACCEPT
iptables -I INPUT 2 -p tcp --dport 3003 -j DROP

iptables -L -n --line-numbers   # verify order
service iptables save           # persist across reboots
```
Run on **all 3 app servers**.

---

*Day 13 of 100 | #100DaysOfDevOps #KodeKloud #iptables #Security*
