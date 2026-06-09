# Day 2 – Temporary User Setup with Expiry Date

## Question
As part of the temporary assignment to the Nautilus project, a developer named `javed` requires access for a limited duration.  
**Task:** Create a temporary user account `javed` on App Server 3 in Stratos Datacenter with expiry date **2024-02-17**, ensuring the username is in lowercase.

---

## Solution


```bash
Step 1: Login to App-server 3
ssh root@<App-server-3-IP>
Step 2: Create the temporary user with expiry
sudo useradd -e 2024-02-17 javed
Step 3: Verify the user
cat /etc/passwd | grep javed

Expected output:
javed:x:1003:1003::/home/javed:/bin/bash
Step 4: Check account expiry information
chage -l javed
