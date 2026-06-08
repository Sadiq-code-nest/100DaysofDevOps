# Day 18: Install and Configure DB Server 🗄️

## Task
On `stdb01`, install and configure **MariaDB**. Create database `kodekloud_db9`, user `kodekloud_joy` with password `8FmzjvFU6S`, and grant full permissions.

---

## MariaDB Quick Concepts

**MariaDB** is a MySQL-compatible database — same SQL syntax, same commands, just a community fork with extra features.

### `'user'@'localhost'` — what does this mean?
In MariaDB, a user is defined by both **username** and **host**:
```sql
'kodekloud_joy'@'localhost'    -- only connects from the same server
'kodekloud_joy'@'%'           -- connects from anywhere
```
Always specify the host — it's part of the identity.

### GRANT syntax
```sql
GRANT ALL PRIVILEGES ON database_name.* TO 'user'@'host';
-- database.*  = all tables in that database
-- ALL PRIVILEGES = SELECT, INSERT, UPDATE, DELETE, CREATE, DROP...
```
Always run `FLUSH PRIVILEGES;` after — it reloads the grant tables.

### Verify your work
```sql
SHOW DATABASES;
SELECT User, Host FROM mysql.user;
SHOW GRANTS FOR 'kodekloud_joy'@'localhost';
```

---

## Solution

```bash
yum install -y mariadb-server
systemctl enable mariadb && systemctl start mariadb
mysql -u root
```

```sql
CREATE DATABASE kodekloud_db9;
CREATE USER 'kodekloud_joy'@'localhost' IDENTIFIED BY '8FmzjvFU6S';
GRANT ALL PRIVILEGES ON kodekloud_db9.* TO 'kodekloud_joy'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

---

*Day 18 of 100 | #100DaysOfDevOps #KodeKloud #MariaDB #Database*
