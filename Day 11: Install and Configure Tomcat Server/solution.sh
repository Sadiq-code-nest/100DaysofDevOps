#!/bin/bash
# DAY 11 — Install and Configure Tomcat Server
# Goal: Install Tomcat on stapp01, run on port 3001, deploy ROOT.war

# === ON JUMP HOST: copy WAR file to app server ===
scp /tmp/ROOT.war tony@stapp01:/tmp/

# === SSH into App Server 1 ===
ssh tony@stapp01
sudo su -

# Install Tomcat
yum install -y tomcat tomcat-webapps tomcat-admin-webapps

# Change port 8080 → 3001
sed -i 's/port="8080"/port="3001"/' /etc/tomcat/server.xml

# Deploy WAR file
mv /tmp/ROOT.war /var/lib/tomcat/webapps/ROOT.war

# Start Tomcat
systemctl enable tomcat && systemctl start tomcat

# Test
curl http://stapp01:3001
