
# DAY 35 - Install Docker Packages and Start Docker Service
ssh tony@stapp01
sudo su -

yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

systemctl start docker
systemctl enable docker

# verify
docker --version
docker compose version
