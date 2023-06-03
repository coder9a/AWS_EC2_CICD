variable "aws_region" {
  type        = string
  description = "region where vpn is configured"
}

variable "aws_access_key" {
  type        = string
  description = "Access key of AWS account"
}

variable "aws_secret_key" {
  type        = string
  description = "secret key of AWS account"
}

variable "ami" {
  type        = string
  description = "EC2 instance AMI"
  default     = "ami-0aa2b7722dc1b5612"
}

variable "instance_type" {
  type        = string
  description = "AWS instance type"
  default     = "t2.micro"
}

variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  description = "public subnet cidr"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  description = "private subnet cidr"
  default     = "10.0.2.0/24"
}

variable "ports" {
  type = list(number)
}
