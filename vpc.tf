# VPC
resource "aws_vpc" "project-dev-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"

  tags = {
    Name = "${var.project}"
    Env  = "dev"
  }
}

# subnets
resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.project-dev-vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id                  = aws_vpc.project-dev-vpc.id
  cidr_block              = var.private_subnet_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"
  tags = {
    Name = "private"
  }
}