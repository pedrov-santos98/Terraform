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
    key     = "dev/01-usando-remote-sate/terrafor.tfstate"
    region  = "us-east-2"
    profile = "pedro.santos"
  }

}

  provider "aws" {
  region  = "us-east-2"
  profile = "pedro.santos"
}