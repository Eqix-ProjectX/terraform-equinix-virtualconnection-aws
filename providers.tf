
terraform {
  required_providers {
    equinix = {
      source = "equinix/equinix"
      #version = "1.36.4"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  
    }

  }
}

provider "aws" {
  region = var.aws_region
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
  # token = var.aws_token 
}
