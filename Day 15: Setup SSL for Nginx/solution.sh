#!/bin/bash
# DAY 15 — Setup SSL for Nginx
# Goal: Install nginx on stapp02, deploy SSL cert, serve "Welcome!" on HTTPS

ssh steve@stapp02
sudo su -

# Install nginx
yum install -y nginx

# Move SSL cert and key to nginx config directory
mv /tmp/nautilus.crt /etc/nginx/
mv /tmp/nautilus.key /etc/nginx/

# Create index page
echo "Welcome!" > /usr/share/nginx/html/index.html

# Configure nginx with SSL — edit /etc/nginx/nginx.conf
# Add this server block inside the http {} block:
cat >> /etc/nginx/conf.d/ssl.conf << 'EOF'
server {
    listen 443 ssl;
    server_name stapp02;

    ssl_certificate     /etc/nginx/nautilus.crt;
    ssl_certificate_key /etc/nginx/nautilus.key;

    root /usr/share/nginx/html;

    location / {
        index index.html;
    }
}
EOF

# Test config
nginx -t

# Start nginx
systemctl enable nginx && systemctl start nginx

# Test from jump host
curl -Ik https://stapp02
