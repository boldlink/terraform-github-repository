
terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

data "github_team" "admin" {
  slug = "AdminTestTeam"
}

data "github_team" "maintain" {
  slug = "MaintainTestTeam"
}

data "github_team" "contributer" {
  slug = "ContributerTestTeam"
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
# The examples below create an organization repository and team repository
# To deploy this example export both the GITHUB_TOKEN and GITHUB_OWNER variables
# ###############################################################################

module "branch_protection_v3" {
  source             = "./../../"
  name               = random_string.repository.result
  description        = "Terraform random repository example"
  license_template   = "apache-2.0"
  allow_squash_merge = true
  branch             = ["dev", "pre", "prd"]
  default_branch     = "develop"
  gitignore_template = "Terraform"
  visibility         = "public"
  homepage_url       = "https://boldlink.io"
  template = {
    owner      = "boldlink"
    repository = "terraform-module-template"
  }
  teams = {
    admin    = local.admin
    maintain = local.maintain
  }
  required_pull_request_reviews_v3 = {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
    dismissal_teams                 = []
    dismissal_users                 = []
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
    module.branch_protection_v3,
  ]
}