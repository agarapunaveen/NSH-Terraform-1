terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

 /* backend "s3" {
    bucket = "52297389-bucket-1"
    key    = "terraform-task-1.tfstate"
    dynamodb_table = "lock-state"
    region = "us-east-1"
  } */
}

provider "aws" {
  region = "us-east-1"
}




resource "aws_instance" "terraform-server" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"

  tags = {
    Name = "instance-1"
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "dbs-training-bucket"

  tags = {
     Terraform   = "true"
    Environment = "dev"
  }
}
