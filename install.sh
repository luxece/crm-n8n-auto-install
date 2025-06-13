#!/bin/bash

# Gỡ cài đặt Docker cũ nếu có
sudo apt-get remove -y docker docker-engine docker.io containerd runc
echo "======= Docker uninstalled ======="

# Cập nhật hệ thống
sudo apt-get update

# Cài đặt các gói hỗ trợ
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Tạo thư mục chứa key
sudo mkdir -p /etc/apt/keyrings

# Tải key GPG Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Thêm repo Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Cập nhật và cài đặt Docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
echo "======= Docker installed ======="

# Dưới đây là ví dụ cài đặt Docker-Compose Ubuntu:
sudo apt-get install docker-compose-plugin
echo "======= Docker-Compose installed ======="
