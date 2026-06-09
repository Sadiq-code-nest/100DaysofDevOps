
# DAY 21 - Set Up Git Repository on Storage Server
ssh natasha@ststor01

sudo yum install -y git
sudo git init --bare /opt/beta.git

# verify
ls /opt/beta.git
