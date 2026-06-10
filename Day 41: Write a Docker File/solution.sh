
# DAY 41 - Write a Docker File
ssh banner@stapp03
sudo mkdir -p /opt/docker

cat > /opt/docker/Dockerfile << 'EOF'
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y apache2

RUN sed -i 's/Listen 80/Listen 3001/' /etc/apache2/ports.conf
RUN sed -i 's/<VirtualHost \*:80>/<VirtualHost *:3001>/' /etc/apache2/sites-available/000-default.conf

EXPOSE 3001

CMD ["apachectl", "-D", "FOREGROUND"]
EOF

# build and verify
docker build -t apache-custom /opt/docker/
docker images | grep apache-custom
