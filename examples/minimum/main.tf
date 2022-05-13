terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.1.3"
    }

    github = {
      source  = "integrations/github"
      version = ">= 4.24.1"
    }
  }

  required_version = ">= 0.13"
}

module "minimum" {
  source      = "./../../"
  name        = "sample-terraform-repository"
  description = "Terraform sample github repository "
  visibility  = "public"
}
