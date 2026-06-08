# Day 14: Linux Process Troubleshooting 🔍

## Task
Apache is down on one of the app servers. Identify which one, fix it, and make sure Apache is running on port `6100` on **all** app servers.

---

## Troubleshooting Process

Start with the most obvious check and go deeper only if needed:

```bash
systemctl status httpd    # is it running?
grep "^Listen" /etc/httpd/conf/httpd.conf   # is port correct?
ss -tulnp | grep 6100     # is it actually bound to the port?
```

## ss vs netstat
`ss` is the modern replacement for `netstat`. Both show listening ports:
```bash
ss -tulnp | grep 6100
netstat -tulnp | grep 6100
```
If `ss` is missing: `yum install -y iproute`  
If `netstat` is missing: `yum install -y net-tools`

## Apache port config
Apache reads its port from `/etc/httpd/conf/httpd.conf`:
```
Listen 80   ← change this to 6100
```
After any config change → always restart the service.

## firewall-cmd vs iptables
If the server uses `firewalld` (modern RHEL 8/9):
```bash
firewall-cmd --permanent --add-port=6100/tcp
firewall-cmd --reload
```
If it uses raw `iptables`: `iptables -I INPUT -p tcp --dport 6100 -j ACCEPT`

---

## Solution

```bash
# On each app server:
systemctl status httpd
systemctl start httpd
sed -i 's/^Listen .*/Listen 6100/' /etc/httpd/conf/httpd.conf
systemctl restart httpd && systemctl enable httpd
ss -tulnp | grep 6100
```

---

*Day 14 of 100 | #100DaysOfDevOps #KodeKloud #Apache #Troubleshooting*
