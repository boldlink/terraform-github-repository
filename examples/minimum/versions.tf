terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "= 5.42.0"
    }
  }

  required_version = ">= 0.14.11"
}
