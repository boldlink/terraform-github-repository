terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "= 5.8.0"
    }
  }

  required_version = ">= 0.14.11"
}
