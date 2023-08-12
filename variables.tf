variable "AWS_Region" {
  type        = string
  default     = "us-east-1"
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
  default     = "ami-0557a15b87f6559cf"
  description = "EC2 instance AMI"
}

variable "EC2_Instance_Type" {
  type        = string
  default     = "t2.micro"
  description = "AWS instance type"
}

variable "VPC_CIDR" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr"
}

variable "Public_Subnet_CIDR" {
  type        = string
  default     = "10.0.1.0/24"
  description = "public subnet cidr"
}

variable "Private_Subnet_CIDR" {
  type        = string
  default     = "10.0.2.0/24"
  description = "private subnet cidr"
}

variable "project" {
  type        = string
  default     = "ArcReactor"
  description = "project name"
}

variable "ports" {
  type    = list(number)
  default = [443, 80, 22]
}

variable "Private_Instance_Count" {
  type    = number
  default = 1
}
