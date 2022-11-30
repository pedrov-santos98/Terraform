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

resource "random_pet" "this" {

    length = 5
  
}

# Adicionando modulo

module "bucket" {
  
  source = "./s3_modules"

  name = random_pet.this.id
}