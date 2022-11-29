locals {

  ip_filepath = "ips.json"

  common_tags = {
    Service     = "Curso Terraform"
    Environment = var.Environment
    Managedby   = "Terraform"
    Owner       = "Pedro Santos"
  }
}