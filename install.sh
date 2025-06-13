#!/bin/bash

echo "Gỡ cài đặt Docker cũ..."
sudo docker system prune -a --volumes -f
sudo apt-get remove -y docker docker-engine docker.io containerd runc

echo "Cập nhật hệ thống..."
sudo apt-get update

echo "Cài các gói cần thiết..."
sudo apt-get install -y ca-certificates curl gnupg lsb-release

echo "Tạo thư mục keyrings..."
sudo mkdir -p /etc/apt/keyrings

echo "Thêm GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Thêm repo Docker..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Cập nhật apt và cài Docker..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo "Cài compose..."
sudo apt-get install docker-compose-plugin

# Cai n8n