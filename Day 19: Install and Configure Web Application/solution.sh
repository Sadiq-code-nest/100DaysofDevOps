#!/bin/bash
# DAY 19 — Install and Configure Web Application
# Goal: Apache on stapp03, port 8083, host /official and /demo subdirectories

# === ON JUMP HOST: copy website files ===
scp -r /home/thor/official banner@stapp03:/tmp/
scp -r /home/thor/demo banner@stapp03:/tmp/

# === ON APP SERVER 3 ===
ssh banner@stapp03
sudo su -

# Install Apache
yum install -y httpd

# Change port to 8083
sed -i 's/^Listen 80/Listen 8083/' /etc/httpd/conf/httpd.conf

# Create web directories and move content
mkdir -p /var/www/html/official /var/www/html/demo
mv /tmp/official/* /var/www/html/official/
mv /tmp/demo/* /var/www/html/demo/

# Fix permissions
chown -R apache:apache /var/www/html/

# Start Apache
systemctl enable httpd && systemctl start httpd

# Test
curl http://localhost:8083/official/
curl http://localhost:8083/demo/
