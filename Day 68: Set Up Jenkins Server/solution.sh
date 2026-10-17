
# DAY 68 - Set Up Jenkins Server
# Run from jump host as root

ssh root@jenkins
# Password: S3curePass

apt update
apt install -y openjdk-21-jre

# Add Jenkins repo
wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" \
  > /etc/apt/sources.list.d/jenkins.list

apt update
apt install -y jenkins

service jenkins start
service jenkins status

# Get initial unlock password
cat /var/lib/jenkins/secrets/initialAdminPassword

# Then in Jenkins UI:
# 1. Paste the initial password to unlock
# 2. Install suggested plugins
# 3. Create admin user:
#    Username:  theadmin
#    Password:  Adm!n321
#    Full Name: Javed
#    Email:     javed@jenkins.stratos.xfusioncorp.com
# 4. Click "Start using Jenkins"
