resource "aws_security_group" "telescope-public-sg" {
  name        = "security group for public instance"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.telescope.id
  dynamic "ingress" {
    for_each    = var.ports
    iterator    = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-instance-sg"
  }
}

resource "aws_security_group" "telescope-private-sg" {
  name        = "security group for private instance"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.telescope.id
  dynamic "ingress" {
    for_each    = var.ports
    iterator    = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [aws_subnet.telescope-public-subnet.cidr_block]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-instance-sg"
  }
}
