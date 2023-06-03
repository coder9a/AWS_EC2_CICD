resource "aws_internet_gateway" "telescope-igw" {
  vpc_id = aws_vpc.telescope.id

  tags = {
    Name = "telescopr-igw"
  }
}

resource "aws_eip" "nat-eip" {
  vpc = "true"
}

resource "aws_nat_gateway" "telescope-nat-gtw" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.telescope-private-subnet.id

  tags = {
    Name = "telescope-nat-gtw"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.telescope-igw]
}
