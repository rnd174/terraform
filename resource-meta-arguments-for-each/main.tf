terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}


provider "aws" {
  # Configuration options
  profile                  = "default"
  region                   = "us-east-1"
  shared_config_files      = ["~/.aws/per/config"]
  shared_credentials_files = ["~/.aws/per/credentials"]
}

resource "aws_instance" "MyServer" {
  ami = "ami-0c293f3f676ec4f90"
  count  = 2
  instance_type = "t2.micro"

  tags = {
    Name = "MyServer-${count.index}"
  }
}


output "public_ip" {
  value = values(aws_instance.MyServer)[*].public_ip
}