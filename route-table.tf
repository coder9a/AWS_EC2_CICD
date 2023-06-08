resource "aws_route_table" "public-rtb" {
  vpc_id = aws_vpc.project-dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "${var.project}-public-rtb"
  }
}

resource "aws_route_table_association" "public-rtb-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rtb.id
}

resource "aws_route_table" "private-rtb" {
  vpc_id = aws_vpc.project-dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway.id
  }

  tags = {
    Name = "${var.project}-private-rtb"
  }
}

resource "aws_route_table_association" "private-rtb-association" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private-rtb.id
}