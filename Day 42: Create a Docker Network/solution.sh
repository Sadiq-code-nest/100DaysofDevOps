
# DAY 42 - Create a Docker Network
ssh steve@stapp02

docker network create \
  --driver bridge \
  --subnet 172.168.0.0/24 \
  --ip-range 172.168.0.0/24 \
  news

# verify
docker network inspect news
