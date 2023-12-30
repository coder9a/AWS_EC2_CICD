terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = "ec2-cicd-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ec2-cicd-table"
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAWCBIPYVGYRW6NXOG"
  secret_key = "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"
}



# terraform plan -var aws_access_key="AKIAWCBIPYVGYRW6NXOG" -var aws_secret_key="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" -var region="us-east-1"