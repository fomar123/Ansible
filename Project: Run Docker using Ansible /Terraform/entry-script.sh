#!/bin/bash
sudo apt-get update && apt-get install -y docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user
docker run -p 8080:8080 nginx
