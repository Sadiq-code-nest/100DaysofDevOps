#!/bin/bash
# DAY 17 — Install and Configure PostgreSQL
# Goal: Create user kodekloud_pop, database kodekloud_db5, grant full access
# Note: Do NOT restart PostgreSQL

ssh peter@stdb01
sudo su - postgres

# Open PostgreSQL shell
psql

# Create user with password
CREATE USER kodekloud_pop WITH PASSWORD 'Rc5C9EyvbU';

# Create database
CREATE DATABASE kodekloud_db5;

# Grant all privileges
GRANT ALL PRIVILEGES ON DATABASE kodekloud_db5 TO kodekloud_pop;

# Verify
\du          # list users
\l           # list databases
\q           # exit
