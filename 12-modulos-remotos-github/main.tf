terraform {
  required_version = "1.3.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " 4.41.0"
    }
  }

}

provider "aws" {
  region  = "us-east-1"
}


module "s3-bucket" {
  source  = "git::https://github.com/caiodelgadonew/s3-module.git"

  team = "DE"
  env = "dev"
  bucket_name = "pedro-santos-bucket-remoto"

}