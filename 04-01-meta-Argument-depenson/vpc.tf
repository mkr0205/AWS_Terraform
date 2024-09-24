# Resource2-Creation -VPC
resource "aws_vpc" "tfvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-dev"
  }
} 

# Create Public subnet
resource "aws_subnet" "tf-pubsubnet1" {
  vpc_id = aws_vpc.tfvpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east1-a"
  map_public_ip_on_launch = true
}

# Create Internet gateway 
resource "aws_internet_gateway" "tfvc-igw" {
  vpc_id = aws_vpc.tfvpc.id
}

# Create route table
resource "aws_route_table" "tfvpc-public-route-table" {
  vpc_id = aws_vpc.tfvpc.id
}

# Create route in route table and associate internet gateway
resource "aws_route" "vpctf-public-route" {
  route_table_id = aws_route_table.tfvpc-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.tfvc-igw.id
}

# Associate route table to public subnet
resource "aws_route_table_association" "tfvpc-route-table-association" {
  route_table_id = aws_route_table.tfvpc-public-route-table.id
  subnet_id = aws_subnet.tf-pubsubnet1.id
}

# Create sucurity group

resource "aws_security_group" "tfvpc-sg" {
  name = "vpc-default-sg"
  description = "Dev VPC Default Security Group"
  vpc_id = aws_vpc.tfvpc.id

  ingress = [ 
    {
      description = "Allow Port 22"
      from_port = "22"
      to_port = "22"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow Port 80"
      from_port = "80"
      to_port = "80"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress = [
    {
      description = "Allow all IP and Port to OUTbound"
      from_port = 0
      to_port = 0
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

