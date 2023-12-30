resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.project-dev-vpc.id

  tags = {
    Name = "${var.project}-igw"
  }
}
resource "aws_eip" "nat-eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.private-subnet.id

  tags = {
    Name = "${var.project}-nat-gtw"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet-gateway]
}