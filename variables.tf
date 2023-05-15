variable "aws_region" {
  type = string
  description = "AWS region"
}
variable "aws_access_key" {
  type = string
  description = "AWS access key"
}

variable "aws_secret_key" {
  type = string
  description = "AWS secret key"
}

variable "ami" {
  type = string
  description = "EC2 instance AMI"
  default = "ami-0aa2b7722dc1b5612"
}

variable "instance_type" {
  type = string
  description = "AWS instance type"
  default = "t2.micro"
}

variable "vpc_cidr" {
  type = string
  description = "range of vpc cidr"
  default = "10.0.0.0/16"
}

variable "public_cidr" {
  type = string
  description = "range of public subnet cidr"
  default = "10.0.1.0/24"
}

variable "private_cidr" {
  type = string
  description = "range of private subnet cidr"
  default = "10.0.2.0/24"
}

