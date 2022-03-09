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

//local variables limited to the file
locals {
  project_name = "Gourav"
}

variable "instance_type"{
    type = string
}
resource "aws_instance" "app_server" {
  ami           = "ami-0c293f3f676ec4f90"
  instance_type = var.instance_type

  tags = {
    Name = "MyServer-${local.project_name}"
  }
}

//output variable. Terraform refresh will fetch the value of the output variable
//if the terraform apply is already performed.
output "instance_ip_address"{
    value = aws_instance.app_server.public_ip
}
