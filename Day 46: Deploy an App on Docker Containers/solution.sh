
# DAY 46 - Deploy an App on Docker Containers
ssh tony@stapp01
sudo mkdir -p /opt/devops

cat > /opt/devops/docker-compose.yml << 'EOF'
version: '3.8'

services:
  web:
    image: php:apache
    container_name: php_host
    ports:
      - "3000:80"
    volumes:
      - /var/www/html:/var/www/html

  db:
    image: mariadb:latest
    container_name: mysql_host
    ports:
      - "3306:3306"
    volumes:
      - /var/lib/mysql:/var/lib/mysql
    environment:
      MYSQL_DATABASE: database_host
      MYSQL_USER: devuser
      MYSQL_PASSWORD: Dev@12345
      MYSQL_ROOT_PASSWORD: Root@12345
EOF

cd /opt/devops
docker compose up -d

# verify
docker ps
curl http://localhost:3000
