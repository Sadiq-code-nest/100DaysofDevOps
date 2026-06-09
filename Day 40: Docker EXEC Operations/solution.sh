
# DAY 40 - Docker EXEC Operations
ssh banner@stapp03

docker exec -it kkloud bash

# Inside container:
apt update
apt install -y apache2

# Change port 80 → 8084
sed -i 's/^Listen 80/Listen 8084/' /etc/apache2/ports.conf
sed -i 's/<VirtualHost \*:80>/<VirtualHost *:8084>/' /etc/apache2/sites-available/000-default.conf

service apache2 start

# verify inside container
service apache2 status

exit
# container stays running
