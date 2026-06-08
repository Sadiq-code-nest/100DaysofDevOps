#!/bin/bash
# DAY 14 — Linux Process Troubleshooting
# Goal: Find which app server has Apache down, fix it, ensure port 6100 on all

# Check all servers — run on each (stapp01, stapp02, stapp03)
systemctl status httpd

# If Apache is down, start it
systemctl start httpd

# Check what port Apache is configured on
grep "^Listen" /etc/httpd/conf/httpd.conf

# If not 6100, change it
sed -i 's/^Listen .*/Listen 6100/' /etc/httpd/conf/httpd.conf

# Restart to apply port change
systemctl restart httpd
systemctl enable httpd

# Verify listening on 6100
ss -tulnp | grep 6100
# or: netstat -tulnp | grep 6100

# If firewall is active, open the port
firewall-cmd --permanent --add-port=6100/tcp && firewall-cmd --reload

# Test
curl http://localhost:6100
