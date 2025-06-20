#!/bin/bash

echo "Gỡ cài đặt Docker cũ..."
sudo docker system prune -a --volumes -f
sudo apt-get remove -y docker docker-engine docker.io containerd runc

echo "Cập nhật hệ thống..."
sudo apt-get update

echo "Cập nhật apt và cài Docker..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo "Cài compose..."
sudo apt-get install docker-compose-plugin

mkdir traefik_data
docker volume create traefik_data

sudo docker network create web
sudo docker-compose up -d

# Cai n8n
