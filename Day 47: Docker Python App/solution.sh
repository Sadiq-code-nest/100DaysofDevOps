
# DAY 47 - Docker Python App
ssh steve@stapp02
cd /python_app

cat > Dockerfile << 'EOF'
FROM python:3.11
WORKDIR /app
COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY src/ .
EXPOSE 8087
CMD ["python3", "server.py"]
EOF

docker build -t nautilus/python-app .

docker run -d --name pythonapp_nautilus -p 8092:8087 nautilus/python-app

# verify
docker ps
curl http://localhost:8092/
