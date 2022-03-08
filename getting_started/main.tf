terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }
}

provider "aws" {
  # Configuration options
  profile                  = "default"
  region                   = "us-east-1"
  shared_config_files      = ["~/.aws/per/conf"]
  shared_credentials_files = ["~/.aws/per/credentials"]

}

resource "aws_instance" "app_server" {
  ami           = "ami-0c293f3f676ec4f90"
  instance_type = "t2.nano"

  tags = {
    Name = "MyServer"
  }
}