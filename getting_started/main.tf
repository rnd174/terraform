terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.58.0"
      # configuration_aliases = [aws.alternate]
    }
  }

  backend "remote" {
    organization = "rnd174"
    workspaces {
      name = "getting-started"
    }
  }

  #    cloud {
  #     organization = "rnd174"
  #     workspaces {
  #       name = "getting-started"
  #     }
  #   }

}


locals {
  project_name = "Gourav"
}