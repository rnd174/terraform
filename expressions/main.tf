terraform {
  # required_providers {
  #   aws = {
  #     source  = "hashicorp/aws"
  #     version = "4.5.0"
  #   }
  # }
}


# provider "aws" {
#   # Configuration options
#   profile                  = "default"
#   region                   = "us-east-1"
#   shared_config_files      = ["~/.aws/per/config"]
#   shared_credentials_files = ["~/.aws/per/credentials"]
# }


variable "worlds" {
  type = list(any)
}

variable "hello" {
  type = string
}
variable "worlds_map" {
  type = map(any)
}

variable "worlds_splat" {
  type = list(any)
}