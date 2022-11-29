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
  region  = "us-east-2"
  profile = "pedro.santos"
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-test-bucket-pedro-santos"
  //Comando para fazer o update -> terraform plan -out="tfplan.out"
  //Fazendo mudanças abaixo
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Owner       = "Pedro Santos"
    UpdateAt  = timestamp()
  }
}

resource "aws_s3_bucket_acl" "my-test-bucket-acl" {
  bucket = aws_s3_bucket.my-test-bucket.id
  acl    = "private"
}
