# Day 12: Linux Network Services 🔌

## Task
Apache is not reachable on port `5000` on one of the app servers. Find the root cause and fix it. Don't touch `index.html`. Verify with `curl http://stapp01:5000` from jump host.

---

## The Debugging Mindset
Never guess. Always check layer by layer:

```
1. Is the service running?        → systemctl status httpd
2. Is the port in use by someone else? → netstat -tulnp | grep 5000
3. Is it listening on 0.0.0.0?   → must NOT be 127.0.0.1 only
4. Is firewall blocking it?       → iptables -L -n
```

## What is a Port Conflict?
Every port can only be used by **one process** at a time. If `sendmail` grabs port 5000 before Apache starts, Apache fails with:
```
Address already in use
```
Solution: stop the conflicting service, free the port, restart Apache.

## 0.0.0.0 vs 127.0.0.1 — Why It Matters
| Binding | Who can reach it |
|---------|-----------------|
| `127.0.0.1:5000` | Only the local machine |
| `0.0.0.0:5000` | Everyone on the network ✅ |

If Apache listens only on `127.0.0.1`, external servers (like the jump host) will get `No route to host`.

## iptables basics
Even without `firewalld`, Linux has `iptables` — the kernel-level firewall.
```bash
iptables -L -n              # list all rules
iptables -I INPUT -p tcp --dport 5000 -j ACCEPT   # allow port
```

---

## Solution

```bash
systemctl status httpd
netstat -tulnp | grep 5000        # find who owns the port
systemctl stop sendmail && systemctl disable sendmail
systemctl restart httpd
netstat -tulnp | grep 5000        # confirm 0.0.0.0:5000
iptables -I INPUT -p tcp --dport 5000 -j ACCEPT
curl http://stapp01:5000
```

---

*Day 12 of 100 | #100DaysOfDevOps #KodeKloud #Networking #Apache*
