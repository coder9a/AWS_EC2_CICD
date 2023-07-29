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
  default     = "ami-0aa2b7722dc1b5612"
}

variable "EC2_Instance_Type" {
  type        = string
  description = "AWS instance type"
  default     = "t2.micro"
}

variable "VPC_CIDR" {
  type        = string
  description = "vpc cidr"
  default     = "10.0.0.0/16"
}

variable "Public_Subnet_CIDR" {
  type        = string
  description = "public subnet cidr"
  default     = "10.0.1.0/24"
}

variable "Private_Subnet_CIDR" {
  type        = string
  description = "private subnet cidr"
  default     = "10.0.2.0/24"
}

variable "project" {
  type        = string
  description = "project name"
}

variable "ports" {
  type = list(number)
  default = [443, 80, 22]
}

variable "Private_Instance_Count" {
  type    = number
  default = 1
}
