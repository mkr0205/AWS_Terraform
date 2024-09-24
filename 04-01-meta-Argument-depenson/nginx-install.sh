#!/bin/bash
sudo yum update -y
sudo yum install nginx -y
sudo systemctl nginx start
sudo systemctl enable nginx
# Echo "<h1>Welcome to Devopstech.online ... AWS Infra created using Terraform in us.east-1 Region"
echo "<h1>Welcom to Devtechionline ! AWS Infra created using Terraform in us.east-1 Region"