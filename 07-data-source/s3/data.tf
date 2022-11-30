data "terraform_remote_state" "server" {
  backend = "s3"

  config = {
    bucket  = "tfstate-093308904237"
    key     = "dev/03-data-sources-s3/terrafor.tfstate"
    region  = var.aws_region
    profile = var.aws_profile
  }
}