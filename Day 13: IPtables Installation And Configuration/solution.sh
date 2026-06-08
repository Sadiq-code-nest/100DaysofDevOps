#!/bin/bash
# DAY 13 — IPtables Installation And Configuration
# Goal: Block port 3003 for everyone EXCEPT LBR host (172.16.238.14)
# Run on ALL 3 app servers

ssh tony@stapp01   # repeat for stapp02 (steve), stapp03 (banner)
sudo su -

# Install iptables service
yum install -y iptables-services

# Enable and start
systemctl enable iptables && systemctl start iptables

# Rule 1: ALLOW port 3003 from LBR only
iptables -I INPUT 1 -p tcp -s 172.16.238.14 --dport 3003 -j ACCEPT

# Rule 2: BLOCK port 3003 for everyone else
iptables -I INPUT 2 -p tcp --dport 3003 -j DROP

# Verify rule order (ACCEPT must be before DROP)
iptables -L -n --line-numbers

# Save permanently (survives reboot)
service iptables save
