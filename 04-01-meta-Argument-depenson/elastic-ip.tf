resource "aws_eip" "my-eip" {
  instance = aws_instance.tfvm.id
  vpc = aws_route_table.tfvpc-public-route-table
  # Meta-Argument
  depends_on = [ aws_internet_gateway.tfvc-igw ]
}