# Day 47: Docker Python App

## Task
On **App Server 2**, create a Dockerfile under `/python_app/`, build image `nautilus/python-app`, and run container `pythonapp_nautilus` mapping host port `8092` to container port `8087`.

---

## Dockerizing a Python App

The standard pattern for a Python app Dockerfile:

```dockerfile
FROM python:3.11          # official Python image
WORKDIR /app              # all commands run from here
COPY requirements.txt .   # copy deps first (layer caching)
RUN pip install -r requirements.txt  # install deps
COPY src/ .               # then copy app code
EXPOSE 8087               # document the port
CMD ["python3", "server.py"]  # start the app
```

**Why copy `requirements.txt` before the rest of the code?**
Docker caches each layer. If you copy all files first, then install deps — any code change busts the cache and re-installs everything. By copying `requirements.txt` first, the install step is only re-run when dependencies actually change. This makes rebuilds much faster.

**`WORKDIR` vs `RUN cd`:**
`WORKDIR` sets the working directory for all subsequent instructions. Unlike `RUN cd ...`, it persists across instructions. Always use `WORKDIR`.

**Port mapping here:**
```
host:8092  →  container:8087
```
The app listens on `8087` inside the container. We expose it on `8092` on the host. These can be different numbers — that's the point of port mapping.

**If the app only binds to `127.0.0.1`:**
Flask/Python servers sometimes default to `127.0.0.1` (localhost only), which means they're unreachable from outside the container. Fix: `app.run(host='0.0.0.0', port=8087)` — bind to all interfaces.

---

## Solution

```dockerfile
FROM python:3.11
WORKDIR /app
COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY src/ .
EXPOSE 8087
CMD ["python3", "server.py"]
```

```bash
docker build -t nautilus/python-app .
docker run -d --name pythonapp_nautilus -p 8092:8087 nautilus/python-app
curl http://localhost:8092/
```

---
*Day 47 of 100 | #100DaysOfDevOps #KodeKloud #Docker #Python*
