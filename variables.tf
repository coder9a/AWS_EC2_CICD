variable "AWS_Region" {
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

variable "AWS_AMI" {
  type        = string
  description = "EC2 instance AMI"
}

variable "EC2_Instance_Type" {
  type        = string
  description = "AWS instance type"
}

variable "VPC_CIDR" {
  type        = string
  description = "vpc cidr"
}

variable "Public_Subnet_CIDR" {
  type        = string
  description = "public subnet cidr"
}

variable "Private_Subnet_CIDR" {
  type        = string
  description = "private subnet cidr"
}

variable "project" {
  type        = string
  description = "project name"
}

variable "public_sg_ports" {
  type    = list(number)
  default = [8080, 80, 22]
}

variable "private_sg_ports" {
  type    = list(number)
  default = [22]
}

variable "Public_Instance_Name" {
  type        = list(string)
  description = "name of public instances"
}

variable "Private_Instance_Name" {
  type        = list(string)
  description = "name of private instances"
}

variable "Private_Instance_Count" {
  type        = number
  description = "count of private instances"
}

variable "Public_Instance_Count" {
  type        = number
  description = "count of public instances"
}
