terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = "nustar-teken-s3-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "nustar-dynamodb-lock-table"
  }
}

provider "aws" {
  region     = var.AWS_Region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}