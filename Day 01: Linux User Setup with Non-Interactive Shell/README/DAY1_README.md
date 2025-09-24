# Linux User Setup with Non-Interactive Shell

## Question
To accommodate the backup agent tool's specifications, the system admin team at xFusionCorp Industries requires the creation of a user with a non-interactive shell.  
**Task:** Create a user named `javed` with a non-interactive shell on App-server 2.

---

## What is a Shell in Linux?
A shell is a program that acts as an interface between a user and the kernel.  

**Interactive Shell:**  
A shell where the user types commands and receives output from those commands.  

**Non-Interactive Shell:**  
A non-interactive shell in Linux is a shell that executes commands without requiring any user interaction. This type of shell is typically used for running scripts or automated processes.

---

## Solution

### Step 1: Login to App-server 2
Use SSH or direct access to log in as a user with sudo privileges.  

```bash
Step 1: ssh root@App-server-2-IP ```enf
Step 2: Create the user with a non-interactive shell
sudo useradd javed --shell /sbin/nologin

Step 3: Verify the user
cat /etc/passwd | grep javed

Expected output:
javed:x:1002:1002::/home/javed:/sbin/nologin
Step 4: Test login prevention
su - javed

Expected message:
This account is currently not available.

