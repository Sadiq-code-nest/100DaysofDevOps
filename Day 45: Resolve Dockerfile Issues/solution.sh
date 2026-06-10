
# DAY 45 - Resolve Dockerfile Issues
ssh steve@stapp02
cd /opt/docker

# view the broken Dockerfile
cat Dockerfile

# common issues to check and fix:
# 1. Wrong base image tag
# 2. Missing COPY source files (certs/, html/ directories must exist)
# 3. Typos in RUN sed commands
# 4. Wrong file paths

# verify required files exist
ls certs/    # should have server.crt and server.key
ls html/     # should have index.html

# the correct working Dockerfile content:
cat > Dockerfile << 'EOF'
FROM httpd:2.4.43

RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf

RUN sed -i '/LoadModule ssl_module modules\/mod_ssl.so/s/^#//g' /usr/local/apache2/conf/httpd.conf

RUN sed -i '/LoadModule socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' /usr/local/apache2/conf/httpd.conf

RUN sed -i '/Include conf\/extra\/httpd-ssl.conf/s/^#//g' /usr/local/apache2/conf/httpd.conf

COPY certs/server.crt /usr/local/apache2/conf/server.crt
COPY certs/server.key /usr/local/apache2/conf/server.key

COPY html/index.html /usr/local/apache2/htdocs/
EOF

# build to confirm it works
docker build -t test-image /opt/docker/
