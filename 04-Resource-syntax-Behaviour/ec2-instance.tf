# Create EC2 instance
resource "aws_instance" "tfvm" {
  ami               = "ami-09c813fb71547fc4f"
  instance_type     = "t3.micro"
  availability_zone = "us-east-1a"
  tags = {
    Name        = "myEC2"
    Environment = "Dev"
  }
}

