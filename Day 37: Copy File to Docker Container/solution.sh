
# DAY 37 - Copy File to Docker Container
ssh steve@stapp02

docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/opt/

# verify
docker exec ubuntu_latest ls /opt/
