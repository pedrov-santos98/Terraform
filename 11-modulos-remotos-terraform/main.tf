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
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.6.0"

  bucket = "pedro-santos-bucket-remoto"
  acl    = "private"

  versioning = {
    enabled = true
  }

  tags = {
    Env = "Dev"
  }

}