terraform {
  required_version = "1.3.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " 4.41.0"
    }

    random = {
      source  = "hashicorp/random"
      version = " 3.4.3"
    }

  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
