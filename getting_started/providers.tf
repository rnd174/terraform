terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
      # configuration_aliases = [aws.alternate]
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

provider "aws" {
  # Configuration options
  profile                  = "default"
  region                   = "eu-west-1"
  shared_config_files      = ["~/.aws/per/conf"]
  shared_credentials_files = ["~/.aws/per/credentials"]
  alias                    = "eu"
}