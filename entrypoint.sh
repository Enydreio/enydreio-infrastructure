#!/bin/sh
wget -O app https://github.com/Enydreio/enydreio-backend/releases/download/main/enydreio-backend
wget https://github.com/Enydreio/enydreio-frontend/releases/download/main/dist.tar.gz
mkdir dist
tar -xzf dist.tar.gz -C dist
rm dist.tar.gz
chmod +x app
echo exec $@