#!/bin/bash
# DAY 12 — Linux Network Services
# Goal: Apache not reachable on port 5000 — find and fix the cause

ssh tony@stapp01
sudo su -

# Layer 1: Is Apache running?
systemctl status httpd

# Layer 2: What's using port 5000?
netstat -tulnp | grep 5000
# If sendmail (or anything else) is on 5000 → port conflict

# Fix: stop the conflicting service
systemctl stop sendmail
systemctl disable sendmail

# Restart Apache
systemctl restart httpd

# Layer 3: Is Apache listening on 0.0.0.0 (not just 127.0.0.1)?
netstat -tulnp | grep 5000
# Must show 0.0.0.0:5000 — not 127.0.0.1

# Layer 4: Firewall blocking?
iptables -L -n
# If port 5000 not allowed:
iptables -I INPUT -p tcp --dport 5000 -j ACCEPT

# Test from jump host
curl http://stapp01:5000
