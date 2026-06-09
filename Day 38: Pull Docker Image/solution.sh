
# DAY 38 - Pull Docker Image
ssh steve@stapp02

docker pull busybox:musl
docker tag busybox:musl busybox:blog

# verify
docker images | grep busybox
