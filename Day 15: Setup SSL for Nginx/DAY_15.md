# Day 15: Setup SSL for Nginx 🔒

## Task
Install Nginx on **App Server 2**. Move the self-signed SSL cert/key from `/tmp/` to the right location and configure HTTPS. Create `index.html` with `Welcome!`. Test with `curl -Ik https://stapp02` from jump host.

---

## What is SSL/TLS?
SSL (now TLS) encrypts traffic between client and server. When you see `https://`, TLS is working. It requires two files:

| File | What it is |
|------|-----------|
| `.crt` | Certificate — public, sent to browsers |
| `.key` | Private key — secret, stays on server |

A **self-signed cert** means you signed it yourself (not a trusted CA like Let's Encrypt). Browsers will warn, but it still encrypts — fine for internal/testing use.

## Where to store certs in Nginx?
Common locations:
```
/etc/nginx/          ← simple, works fine
/etc/ssl/certs/      ← standard Linux SSL dir
/etc/pki/tls/certs/  ← RHEL standard
```

## Nginx SSL config block
```nginx
server {
    listen 443 ssl;                      # 443 = HTTPS port
    ssl_certificate     /path/to.crt;
    ssl_certificate_key /path/to.key;
    ...
}
```

## curl -Ik explained
```bash
curl -I   # HEAD request — shows response headers only
curl -k   # ignore SSL cert errors (needed for self-signed)
```

---

## Solution

```bash
yum install -y nginx
mv /tmp/nautilus.crt /etc/nginx/
mv /tmp/nautilus.key /etc/nginx/
echo "Welcome!" > /usr/share/nginx/html/index.html

# Add SSL server block to /etc/nginx/conf.d/ssl.conf
nginx -t
systemctl enable nginx && systemctl start nginx

# From jump host:
curl -Ik https://stapp02
```

---

*Day 15 of 100 | #100DaysOfDevOps #KodeKloud #Nginx #SSL*
