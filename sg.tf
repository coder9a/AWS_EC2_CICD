resource "aws_security_group" "public-sg" {
  name        = "${var.project}-public-security-group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.project-dev-vpc.id
  dynamic "ingress" {
    for_each = var.public_sg_ports
    iterator = port
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

resource "aws_security_group" "private-sg" {
  name        = "${var.project}-private-security-group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.project-dev-vpc.id
  dynamic "ingress" {
    for_each = var.private_sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [aws_subnet.public-subnet.cidr_block]
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