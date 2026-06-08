# Day 16: Install and Configure Nginx as an LBR 🔀

## Task
Configure the LBR server (`stlb01`) with Nginx as a **load balancer** across all 3 app servers. Only edit `/etc/nginx/nginx.conf`. Don't touch Apache config or port on app servers. Test with `curl http://stlb01:80`.

---

## What is a Load Balancer?
A load balancer sits in front of multiple servers and distributes incoming traffic between them. Benefits:
- No single point of failure
- Handles more traffic
- If one server dies, others keep serving

```
Client → LBR (stlb01:80) → stapp01, stapp02, or stapp03
```

## Nginx upstream block
The `upstream` block defines your pool of backend servers:
```nginx
upstream backend {
    server stapp01:3000;
    server stapp02:3000;
    server stapp03:3000;
}
```
Default algorithm is **round-robin** — requests rotate 1→2→3→1→2→3...

Other algorithms:
| Method | Directive | Behavior |
|--------|-----------|---------|
| Round Robin | (default) | Rotates evenly |
| Least Connections | `least_conn;` | Sends to least busy |
| IP Hash | `ip_hash;` | Same client → same server |

## proxy_pass
```nginx
location / {
    proxy_pass http://backend;   # forward to upstream pool
}
```
This is how Nginx becomes a reverse proxy — it receives the request and forwards it to a backend.

---

## Solution

```nginx
# /etc/nginx/nginx.conf
http {
    upstream backend {
        server stapp01:<port>;
        server stapp02:<port>;
        server stapp03:<port>;
    }
    server {
        listen 80;
        location / {
            proxy_pass http://backend;
        }
    }
}
```

```bash
nginx -t && systemctl restart nginx
curl http://stlb01:80
```

> ⚠️ Check the actual Apache port on app servers first before writing the upstream block.

---

*Day 16 of 100 | #100DaysOfDevOps #KodeKloud #Nginx #LoadBalancer*
