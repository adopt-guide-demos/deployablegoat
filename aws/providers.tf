
provider "aws" {
  profile = var.profile
  region  = var.region
}

terraform {
  #backend "s3" {
  #  bucket = "deployablegoat-test"
  #  key    = "s3state/deployablegoat"
  #  region = "us-east-2"
  #}
  backend "local" {
    path = "terraform.tfstate"
  }
}