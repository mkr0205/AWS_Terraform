# Create EC2 instance resource
resource "aws_instance" "tfvm" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  key_name = karna
  subnet_id = aws_subnet.tf-pubsubnet1.id
  vpc_security_group_ids = [ aws_security_group.tfvpc-sg.id ]
  #user_data = file("inginx-install.sh")
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install nginx -y
    sudo systemctl nginx start
    sudo systemctl enable nginx
    echo "<h1>Welcom to Devtechionline ! AWS Infra created using Terraform in us.east-1 Region"
    EOF
}