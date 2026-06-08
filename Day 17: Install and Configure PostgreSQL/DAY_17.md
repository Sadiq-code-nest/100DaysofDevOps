# Day 17: Install and Configure PostgreSQL 🐘

## Task
On the DB server (`stdb01`), PostgreSQL is already installed. Create user `kodekloud_pop` with password `Rc5C9EyvbU`, create database `kodekloud_db5`, and grant full permissions. **Do not restart PostgreSQL.**

---

## PostgreSQL vs MariaDB
| | PostgreSQL | MariaDB/MySQL |
|--|------------|--------------|
| Admin user | `postgres` | `root` |
| Shell | `psql` | `mysql` |
| Default port | 5432 | 3306 |
| Strong at | Complex queries, JSON | Simple CRUD, speed |

## The postgres user
PostgreSQL installs a system user called `postgres` who is the database superadmin. You switch to it with:
```bash
sudo su - postgres
psql          # opens the PostgreSQL shell
```

## Essential psql commands
```sql
\du           -- list users/roles
\l            -- list databases
\c dbname     -- connect to a database
\q            -- quit
```

## GRANT ALL PRIVILEGES
```sql
GRANT ALL PRIVILEGES ON DATABASE dbname TO username;
```
This gives the user full control over that database — create tables, insert, update, delete, drop.

---

## Solution

```bash
ssh peter@stdb01
sudo su - postgres
psql
```

```sql
CREATE USER kodekloud_pop WITH PASSWORD 'Rc5C9EyvbU';
CREATE DATABASE kodekloud_db5;
GRANT ALL PRIVILEGES ON DATABASE kodekloud_db5 TO kodekloud_pop;
\q
```

---

*Day 17 of 100 | #100DaysOfDevOps #KodeKloud #PostgreSQL #Database*
