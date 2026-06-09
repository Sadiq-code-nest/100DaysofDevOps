
# DAY 36 - Deploy Nginx Container on Application Server
ssh tony@stapp01

docker run -d --name nginx_1 nginx:alpine

# verify
docker ps
