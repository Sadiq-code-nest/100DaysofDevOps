# Day 20: Configure Nginx + PHP-FPM Using Unix Sock 🐘

## Task
On **App Server 3**: install Nginx (port `8092`, doc root `/var/www/html`), install PHP-FPM 8.3 using unix socket at `/var/run/php-fpm/default.sock`, wire them together. Test with `curl http://stapp03:8092/index.php` from jump host.

---

## Why Nginx + PHP-FPM?
Nginx can't execute PHP on its own — it only serves static files. PHP-FPM (FastCGI Process Manager) runs PHP code. They talk to each other via **FastCGI protocol**.

```
Browser → Nginx (port 8092)
              ↓ .php request
           PHP-FPM (unix socket)
              ↓ executes PHP
           Response back to Nginx → Browser
```

## Unix Socket vs TCP
Two ways Nginx and PHP-FPM can communicate:

| Method | Example | Speed | Use case |
|--------|---------|-------|---------|
| TCP | `127.0.0.1:9000` | Slower | Different servers |
| Unix socket | `/var/run/php-fpm/default.sock` | Faster | Same server ✅ |

Unix sockets skip the network stack — faster when both services are on the same machine.

## Key php-fpm config (`/etc/php-fpm.d/www.conf`)
```ini
user = nginx                              # run as nginx user
group = nginx
listen = /var/run/php-fpm/default.sock    # socket path
listen.owner = nginx                      # nginx owns the socket
listen.group = nginx
listen.mode = 0660
```

## Nginx FastCGI config
```nginx
location ~ \.php$ {
    include fastcgi_params;
    fastcgi_pass unix:/var/run/php-fpm/default.sock;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
}
```
`SCRIPT_FILENAME` tells PHP-FPM which file to execute.

---

## Solution

```bash
# Repos + install
dnf install -y epel-release
dnf install -y https://rpms.remirepo.net/enterprise/remi-release-9.rpm
dnf module reset php -y && dnf module enable php:remi-8.3 -y
dnf install -y nginx php php-fpm

# Configure php-fpm (socket + nginx user)
# Edit /etc/php-fpm.d/www.conf → set listen, user, group, listen.owner

# Configure nginx
# Add server block: listen 8092, fastcgi_pass to socket

mkdir -p /var/run/php-fpm
chown -R nginx:nginx /var/www/html
systemctl enable php-fpm nginx
systemctl start php-fpm nginx
curl http://stapp03:8092/index.php
```

---

*Day 20 of 100 | #100DaysOfDevOps #KodeKloud #Nginx #PHP #LEMP*
