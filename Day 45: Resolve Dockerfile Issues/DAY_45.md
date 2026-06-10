# Day 45: Resolve Dockerfile Issues

## Task
The Dockerfile at `/opt/docker/` on **App Server 2** is failing to build. Find and fix the issues — without changing the base image, valid config, or any data files like `index.html`.

---

## How to Debug a Failing Dockerfile

Run the build and read the error carefully — Docker tells you exactly which instruction failed and why:

```bash
docker build -t test /opt/docker/
# Error will point to the failing line
```

**Most common Dockerfile errors:**

| Error | Cause | Fix |
|-------|-------|-----|
| `COPY failed: file not found` | Source file doesn't exist relative to build context | Check file paths, ensure files are present |
| `executable file not found` | Wrong command in CMD/RUN | Check binary name and path |
| `no such file or directory` | Wrong path inside image | Verify path exists in the base image |
| `permission denied` | Missing chmod or wrong user | Add `RUN chmod` or check USER |

**Build context matters:**
`docker build /opt/docker/` — the build context is `/opt/docker/`. All `COPY` paths are relative to this directory. If your Dockerfile says `COPY certs/server.crt ...`, the file must be at `/opt/docker/certs/server.crt`.

**The `sed` pattern used here:**
```bash
sed -i '/pattern/s/^#//g'   # uncomment a line matching pattern
sed -i "s/Listen 80/Listen 8080/g"  # replace text
```

Regex in `sed` — special characters like `/` need to be escaped as `\/` inside sed expressions. That's the `\/` you see in the RUN commands.

**SSL in Apache httpd:**
The Dockerfile enables SSL by uncommenting three things in httpd.conf:
1. `mod_ssl.so` — the SSL module
2. `mod_socache_shmcb.so` — required by SSL for session caching
3. `httpd-ssl.conf` — the SSL virtual host config

Then copies your cert and key into the container.

---

## Solution
```bash
cd /opt/docker
ls certs/ html/          # confirm source files exist
cat Dockerfile            # read the error line carefully
docker build -t test .   # try building, read the error
# fix the identified issue
docker build -t test .   # rebuild to confirm
```

The Dockerfile as provided is correct — the usual issue in this lab is **missing source files** (`certs/` or `html/` directory). Verify they exist in `/opt/docker/` before building.

---
*Day 45 of 100 | #100DaysOfDevOps #KodeKloud #Docker*
