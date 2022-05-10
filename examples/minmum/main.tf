
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
# The examples below create an organization repository and team
# To deploy this example export both the GITHUB_TOKEN and GITHUB_OWNER variables
# ###############################################################################

module "random_repository" {
  source             = "boldlink/repository/github"
  version            = "1.0.0"
  name               = "new-repo"
  description        = "Terraform random repository example"
}

output "outputs" {
  value = [
    module.random_repository,
  ]
}