
# DAY 44 - Write a Docker Compose File
ssh tony@stapp01
sudo mkdir -p /opt/docker

cat > /opt/docker/docker-compose.yml << 'EOF'
version: '3'

services:
  web:
    image: httpd:latest
    container_name: httpd
    ports:
      - "5004:80"
    volumes:
      - /opt/security:/usr/local/apache2/htdocs
EOF

cd /opt/docker
docker compose up -d

# verify
docker ps
curl http://localhost:5004
