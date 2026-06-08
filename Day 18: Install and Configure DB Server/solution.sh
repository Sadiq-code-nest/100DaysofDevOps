#!/bin/bash
# DAY 18 — Install and Configure DB Server (MariaDB)
# Goal: Install MariaDB, create DB + user, grant permissions

ssh peter@stdb01
sudo su -

# Install and start MariaDB
yum install -y mariadb-server
systemctl enable mariadb && systemctl start mariadb

# Open MariaDB shell
mysql -u root

# Run these SQL commands:
# CREATE DATABASE kodekloud_db9;
# CREATE USER 'kodekloud_joy'@'localhost' IDENTIFIED BY '8FmzjvFU6S';
# GRANT ALL PRIVILEGES ON kodekloud_db9.* TO 'kodekloud_joy'@'localhost';
# FLUSH PRIVILEGES;
# EXIT;
