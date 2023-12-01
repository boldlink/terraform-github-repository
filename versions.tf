terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.42.0"
    }
    sodium = {
      source  = "killmeplz/sodium"
      version = "0.0.3"
    }
  }

  required_version = ">= 0.14.11"
}
