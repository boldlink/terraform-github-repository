
terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

data "github_team" "admin" {
  slug = "tfmadmin"
}

data "github_team" "maintain" {
  slug = "tfmmaintainers"
}

data "github_team" "contributer" {
  slug = "tfmwriters"
}

locals {
  admin      = data.github_team.admin.id
  maintain   = data.github_team.maintain.id
  conributer = data.github_team.contributer.id
}


resource "random_string" "repository" {
  length  = 5
  special = false
  upper   = false
  number  = false
}

# ###############################################################################
# The examples below create an organization repository and team
# To deploy this example export both the GITHUB_TOKEN and GITHUB_OWNER variables
# ###############################################################################

module "random_complete_rep" {
  source             = "./../../"
  name               = "new-repo-complete"
  description        = "Terraform random repository example"
  license_template   = "apache-2.0"
  allow_squash_merge = true
  branch             = ["dev", "pre", "prd"]
  default_branch     = "main"
  gitignore_template = "Terraform"
  visibility         = "public"
  homepage_url       = "https://boldlink.io"
  teams = {
    admin    = local.admin
    maintain = local.maintain
  }
  required_pull_request_reviews = {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
    dismissal_teams                 = []
    dismissal_users                 = []
    pull_request_bypassers          = [local.admin]
  }
  restrictions = {
    users = []
    teams = [
      local.admin,
      local.maintain
    ]
    apps = []
  }
}

output "outputs" {
  value = [
    module.random_repository,
  ]
}