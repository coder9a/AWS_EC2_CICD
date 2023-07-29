variable "AWS_Region" {
  type        = string
  description = "region where vpn is configured"
  default = ""
}

variable "aws_access_key" {
  type        = string
  description = "Access key of AWS account"
  default = ""
}

variable "aws_secret_key" {
  type        = string
  description = "secret key of AWS account"
  default = ""
}

variable "AWS_AMI" {
  type        = string
  description = "EC2 instance AMI"
  default = ""
}

variable "EC2_Instance_Type" {
  type        = string
  description = "AWS instance type"
  default = ""
}

variable "VPC_CIDR" {
  type        = string
  description = "vpc cidr"
  default = ""
}

variable "Public_Subnet_CIDR" {
  type        = string
  description = "public subnet cidr"
  default = ""
}

variable "Private_Subnet_CIDR" {
  type        = string
  description = "private subnet cidr"
  default = ""
}

variable "project" {
  type        = string
  description = "project name"
  default = ""
}

variable "ports" {
  type = list(number)
  default = [443, 80, 22]
}

variable "Private_Instance_Count" {
  type    = number
  default = 1
}
