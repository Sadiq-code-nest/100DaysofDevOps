
# DAY 39 - Create a Docker Image From Container
ssh banner@stapp03

docker commit ubuntu_latest blog:datacenter

# verify
docker images | grep blog
