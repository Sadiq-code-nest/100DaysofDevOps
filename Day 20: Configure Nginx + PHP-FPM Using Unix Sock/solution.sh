#!/bin/bash
# DAY 20 — Configure Nginx + PHP-FPM Using Unix Sock
# Goal: Nginx on port 8092, PHP-FPM 8.3 via unix socket, doc root /var/www/html

ssh banner@stapp03
sudo su -

# Install EPEL + Remi repos (needed for PHP 8.3)
dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
dnf install -y https://rpms.remirepo.net/enterprise/remi-release-9.rpm

# Enable PHP 8.3
dnf module reset php -y
dnf module enable php:remi-8.3 -y

# Install nginx + php-fpm
dnf install -y nginx php php-fpm

# Create socket directory
mkdir -p /var/run/php-fpm

# Configure php-fpm socket — edit /etc/php-fpm.d/www.conf
sed -i 's|^listen = .*|listen = /var/run/php-fpm/default.sock|' /etc/php-fpm.d/www.conf
sed -i 's/^user = apache/user = nginx/' /etc/php-fpm.d/www.conf
sed -i 's/^group = apache/group = nginx/' /etc/php-fpm.d/www.conf
sed -i 's/^;listen.owner = .*/listen.owner = nginx/' /etc/php-fpm.d/www.conf
sed -i 's/^;listen.group = .*/listen.group = nginx/' /etc/php-fpm.d/www.conf
sed -i 's/^;listen.mode = .*/listen.mode = 0660/' /etc/php-fpm.d/www.conf

# Configure nginx — add server block for port 8092
cat > /etc/nginx/conf.d/php-app.conf << 'EOF'
server {
    listen 8092;
    server_name localhost;
    root /var/www/html;
    index index.php index.html;

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass unix:/var/run/php-fpm/default.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
EOF

# Fix permissions
chown -R nginx:nginx /var/www/html

# Start services
systemctl enable php-fpm && systemctl start php-fpm
systemctl enable nginx && systemctl start nginx

# Test config
nginx -t

# Test from jump host
curl http://stapp03:8092/index.php
