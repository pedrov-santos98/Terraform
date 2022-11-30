terraform {
  required_version = "1.3.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " 4.41.0"
    }
  }

  backend "s3" {
    bucket  = "tfstate-093308904237"
    key     = "dev/03-data-sources-s3/terrafor.tfstate"
    region  = "us-east-2"
    profile = "pedro.santos"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
