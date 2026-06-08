#!/bin/bash
# DAY 16 — Install and Configure Nginx as an LBR
# Goal: Configure Nginx on stlb01 to load balance across all 3 app servers

ssh stlb01
sudo su -

# Install nginx
yum install -y nginx
systemctl enable nginx && systemctl start nginx

# Verify Apache is running on all app servers first
# ssh stapp01 → systemctl status httpd (note the port it's using)
# ssh stapp02 → systemctl status httpd
# ssh stapp03 → systemctl status httpd

# Edit ONLY /etc/nginx/nginx.conf — add upstream + proxy
vi /etc/nginx/nginx.conf

# The http {} block should contain:
# upstream backend {
#     server stapp01:<apache_port>;
#     server stapp02:<apache_port>;
#     server stapp03:<apache_port>;
# }
# server {
#     listen 80;
#     location / {
#         proxy_pass http://backend;
#     }
# }

# Minimal working nginx.conf:
cat > /etc/nginx/nginx.conf << 'EOF'
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

events {
    worker_connections 1024;
}

http {
    upstream backend {
        server stapp01:3000;
        server stapp02:3000;
        server stapp03:3000;
    }

    server {
        listen 80;
        location / {
            proxy_pass http://backend;
        }
    }
}
EOF

# Test and restart
nginx -t
systemctl restart nginx

# Test
curl http://stlb01:80
