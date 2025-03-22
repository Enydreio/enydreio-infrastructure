#!/bin/bash
cp .env .env.temp
echo "HOST_IP=$(ip route get 1.1.1.1 | awk '{print $7}')" >> .env.temp
docker compose --env-file ./.env.temp up -d
rm .env.temp