resource "aws_route_table" "public-rtb" {
  vpc_id = aws_vpc.telescope.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.telescope-igw.id
  }

  tags = {
    Name = "telescope-public-rtb"
  }
}

resource "aws_route_table_association" "public-rtb-association" {
  subnet_id      = aws_subnet.telescope-public-subnet.id
  route_table_id = aws_route_table.public-rtb.id
}

resource "aws_route_table" "private-rtb" {
  vpc_id = aws_vpc.telescope.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.telescope-nat-gtw.id
  }

  tags = {
    Name = "telescope-private-rtb"
  }
}

resource "aws_route_table_association" "private-rtb-association" {
  subnet_id      = aws_subnet.telescope-private-subnet.id
  route_table_id = aws_route_table.private-rtb.id
}