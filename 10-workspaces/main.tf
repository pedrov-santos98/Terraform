terraform {
  required_version = "1.3.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " 4.41.0"
    }
  }

    backend "s3" {
      bucket         = "tfstate-093308904237"
      key            = "05-workspaces/terrafor.tfstate"
      region         = "us-east-2"
      profile        = "pedro.santos"
      dynamodb_table = "tflock-tfstate-093308904237"
    }

}

provider "aws" {
  region  = "us-east-2"
  profile = "pedro.santos"
}


locals {
  env = terraform.workspace == "default" ? "dev" : terraform.workspace
}

resource "aws_instance" "web" {

  count = lookup(var.instance, local.env)["number"]

  ami = lookup(var.instance, local.env)["ami"]

  instance_type = lookup(var.instance, local.env)["type"]

  tags = {
    Name = "Minha máquina web ${local.env}"

    Env = local.env
  }
}

