#!/bin/bash

export HOST_IP=$(ip route get 1.1.1.1 | awk '{print $7}') && docker-compose --env-file ./.env up -d
