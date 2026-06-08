# Day 19: Install and Configure Web Application 🌐

## Task
On **App Server 3**, install Apache on port `8083`. Host two websites:
- `http://localhost:8083/official/` → from `/home/thor/official` on jump host
- `http://localhost:8083/demo/` → from `/home/thor/demo` on jump host

---

## Apache Document Root Structure
Apache's default document root is `/var/www/html/`. Subdirectories automatically become URL paths:

```
/var/www/html/
├── official/
│   └── index.html     →  http://host:8083/official/
└── demo/
    └── index.html     →  http://host:8083/demo/
```
No extra config needed — Apache serves subdirectories automatically.

## Why `apache:apache` ownership?
Apache runs as the `apache` user. If files are owned by `root`, Apache can read them (they're world-readable), but it's best practice to set proper ownership. If you ever enable write access or PHP uploads, ownership becomes critical.

## scp -r for directories
```bash
scp file user@host:/path/          # single file
scp -r directory/ user@host:/path/ # recursive — whole folder
```

## Changing Apache port
In `/etc/httpd/conf/httpd.conf`:
```
Listen 80   →   Listen 8083
```
One line change. Restart required.

---

## Solution

```bash
# Jump host → copy files
scp -r /home/thor/official banner@stapp03:/tmp/
scp -r /home/thor/demo banner@stapp03:/tmp/

# On stapp03
yum install -y httpd
sed -i 's/^Listen 80/Listen 8083/' /etc/httpd/conf/httpd.conf
mkdir -p /var/www/html/official /var/www/html/demo
mv /tmp/official/* /var/www/html/official/
mv /tmp/demo/* /var/www/html/demo/
chown -R apache:apache /var/www/html/
systemctl enable httpd && systemctl start httpd
curl http://localhost:8083/official/
curl http://localhost:8083/demo/
```

---

*Day 19 of 100 | #100DaysOfDevOps #KodeKloud #Apache #WebServer*
