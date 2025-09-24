#!/bin/bash
# Day 2 - Temporary User Setup with Expiry Date

# Create temporary user 'javed' with expiry date 2024-02-17
sudo useradd -e 2024-02-17 javed

# Verify user creation
cat /etc/passwd | grep javed

# Check expiry information
chage -l javed

