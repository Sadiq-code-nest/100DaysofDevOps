Linux User Setup with Non-Interactive Shell

**Question**
To accommodate the backup agent tool's specifications, the system admin team at xFusionCorp Industries requires the creation of a user with a non-Interactive shell. 
Here's your task:

Create a user named javed interactive shell on with a non-interactive shell on App-server 2

---------------------------------------------------------------------------------------------------------------------
What is Shell in Linux?
A shell is a program that acts as an interface between a user and the kernel. 
Interactive Shell?
A shell where the user types commands and receives output from those commands. 
Non-Interactive Shell? 
A non-interactive shell in Linux is a shell that executes commands without requiring any user interaction. This type of shell is typically used for running scripts or automated processes.

**Solution** 
1. Login to App-server 2
2. Create user with non-interactive shell:
sudo useradd javed --shell /sbin/nologin
3. Verify user:
cat /etc/passwd | grep javed
javed:x:1002:1002::/home/javed:/sbin/nologin
5. Test login prevention
su - javed
This account is currently not available.

