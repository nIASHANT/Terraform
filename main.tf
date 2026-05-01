terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA4K6PC"
  secret_key = "6bWWIzL7LTzbM0lgIKh/T"
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "tutedude-altair-2026"
    tags = {
        "num"= var.num_var
    }
}

resource "aws_instance" "ezio" {
    ami  = "ami-0e12ffc2dd465f6e4"
    instance_type = "t2.micro"
    tags = {
        "num" = var.num_var
    }
    key_name = "test"
}