# VPC
resource "aws_vpc" "starlink" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
  instance_tenancy     = "default"

  tags = {
    Name = "star_vpc"
  }
}

# internet gateway
resource "aws_internet_gateway" "starlink_gateway" {
  vpc_id = aws_vpc.starlink.id

  tags = {
    Name = "starlink_gtw"
  }
}

# subnets
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.starlink.id
  cidr_block              = var.public_cidr
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.starlink.id
  cidr_block              = var.private_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"
  tags = {
    Name = "private"
  }
}

# create route table for internet gateway
resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.starlink.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.starlink_gateway.id
  }

  tags = {
    Name = "public route table"
  }
}
# route table association to public subnet
resource "aws_route_table_association" "public_RT_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_RT.id
}

# create elastic ip for nat gateway
resource "aws_eip" "starlink_gtw_ip" {
  vpc = true
  tags = {
    Name = "nat_gtw_ip"
  }
}

# create nat gateway
resource "aws_nat_gateway" "starlink_nat_gtw" {
  allocation_id = aws_eip.starlink_gtw_ip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "nat gtw"
  }
}

# create route table for private subnet
resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.starlink.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.starlink_nat_gtw.id
  }

  tags = {
    Name = "private route table"
  }
}

# route table association to private subnet
resource "aws_route_table_association" "private_RT_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_RT.id
}

# security group 
resource "aws_security_group" "starlink_sg" {
  name        = "starlink_sg"
  description = "Allow starlink inbound traffic"
  vpc_id      = aws_vpc.starlink.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "PING icmp"
    from_port   = -1
    to_port     = -1
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_starlink_traffic"
  }
}

# create ec2 key pair
resource "tls_private_key" "rsa_starlink_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "starlink_key_pair" {
  key_name   = "starlink_key"
  public_key = tls_private_key.rsa_starlink_key.public_key_openssh
}
resource "local_file" "key" {
  content  = tls_private_key.rsa_starlink_key.private_key_openssh
  filename = "stralink_key.pem"
}

# create ec2 instance in public subnet
resource "aws_instance" "starlink_public_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.starlink_key_pair.id
  vpc_security_group_ids = ["${aws_security_group.starlink_sg.id}"]
  subnet_id              = aws_subnet.public_subnet.id
  tags = {
    Name = "public instance"
  }
}

# create ec2 instance in private subnet
resource "aws_instance" "starlink_private_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.starlink_key_pair.id
  vpc_security_group_ids = ["${aws_security_group.starlink_sg.id}"]
  subnet_id              = aws_subnet.private_subnet.id
  tags = {
    Name = "private instance"
  }
}
