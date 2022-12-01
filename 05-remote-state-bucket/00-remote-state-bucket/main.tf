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

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "remote-state" {

  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

  versioning {
    enabled = true
  }

  tags = {
    Description = "Salva os arquivos TFSTATE para uso"

    Managedby = "Terraform"

    Owner = "Pedro Santos"

    CreateAt = timestamp()
  }

}

resource "aws_dynamodb_table" "lock-table" {

  name = "tflock-${aws_s3_bucket.remote-state.bucket}"

  read_capacity = 5

  write_capacity = 5

  hash_key = "LockID"

  attribute {
    
    name = "LockID"

    type = "S"
  }
  
}

output "remote_state_bucket" {
  value = aws_s3_bucket.remote-state.bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote-state.arn
}

