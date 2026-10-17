# Day 68: Set Up Jenkins Server

## Task
Install Jenkins on the jenkins server using `apt`, start it with `service`, then configure the admin user via the UI.

---

## What is Jenkins?
Jenkins is an open-source automation server for building CI/CD pipelines. It runs jobs (builds, tests, deployments) automatically on code changes or schedules. It's the most widely used CI/CD tool in self-hosted environments.

## Why Java first?
Jenkins is a Java application — it needs a JRE to run. Install Java before Jenkins, or the Jenkins service will fail to start.

## Jenkins install flow on Debian/Ubuntu

Jenkins isn't in the default apt repos. You need to:
1. Download and trust the Jenkins GPG signing key
2. Add the Jenkins repo to apt sources
3. Then `apt install jenkins`

```bash
# Key → repo → install (always this order)
wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=...] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list
apt update && apt install -y jenkins
```

## `service` vs `systemctl`
The task specifically says use `service jenkins start` — both work on modern systems (`service` is a wrapper around systemctl), but match exactly what the task asks.

## Initial unlock password
Jenkins generates a random password on first start, stored at:
```
/var/lib/jenkins/secrets/initialAdminPassword
```
Paste this into the UI to unlock Jenkins, then create your admin account.

---

## Solution
```bash
ssh root@jenkins
apt update && apt install -y openjdk-21-jre
# add repo key + source, then:
apt update && apt install -y jenkins
service jenkins start
cat /var/lib/jenkins/secrets/initialAdminPassword
# Complete setup in UI — create admin: theadmin / Adm!n321 / Javed
```

---
*Day 68 of 100 | #100DaysOfDevOps #KodeKloud #Jenkins*
