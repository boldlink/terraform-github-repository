terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.42.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
  }
  required_version = ">= 0.14.11"
}
