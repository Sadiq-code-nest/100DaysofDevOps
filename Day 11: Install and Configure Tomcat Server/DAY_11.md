# Day 11: Install and Configure Tomcat Server 🍅

## Task
Install Tomcat on **App Server 1**, configure it on port `3001`, deploy `ROOT.war` from the jump host, and verify with `curl http://stapp01:3001`.

---

## What is Tomcat?
Apache Tomcat is a **Java application server** — it runs `.war` (Web Application Archive) files, the packaged format for Java web apps. Think of it like Nginx/Apache but specifically for Java.

### Key paths on RHEL/CentOS:
| Path | Purpose |
|------|---------|
| `/etc/tomcat/server.xml` | Main config — ports, connectors |
| `/var/lib/tomcat/webapps/` | Drop your `.war` files here |
| `/var/log/tomcat/` | Logs |

### What is ROOT.war?
Tomcat maps `ROOT.war` → base URL `/`. So `http://host:port/` serves it directly. Any other name like `app.war` would need `http://host:port/app/`.

### How port change works:
In `server.xml`, find the `<Connector>` tag:
```xml
<Connector port="8080" protocol="HTTP/1.1"  ← change this number
```
Restart Tomcat → it binds to the new port.

---

## Solution

```bash
# From jump host — copy WAR
scp /tmp/ROOT.war tony@stapp01:/tmp/

# On stapp01
sudo yum install -y tomcat tomcat-webapps tomcat-admin-webapps
sudo sed -i 's/port="8080"/port="3001"/' /etc/tomcat/server.xml
sudo mv /tmp/ROOT.war /var/lib/tomcat/webapps/ROOT.war
sudo systemctl enable tomcat && sudo systemctl start tomcat
curl http://stapp01:3001
```

---

*Day 11 of 100 | #100DaysOfDevOps #KodeKloud #Tomcat #Java*
