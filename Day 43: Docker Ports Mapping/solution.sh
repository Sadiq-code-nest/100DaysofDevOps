
# DAY 43 - Docker Ports Mapping
ssh steve@stapp02

docker pull nginx:stable

docker run -d \
  --name blog \
  -p 5002:80 \
  nginx:stable

# verify
docker ps
curl http://localhost:5002
