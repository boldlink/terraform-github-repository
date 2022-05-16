
# Sample organization teams
resource "github_team" "admin" {
  name        = "admin-team"
  description = "Sample admin team"
  privacy     = "closed"
}

resource "github_team" "maintain" {
  name        = "maintain-team"
  description = "Sample maintain team"
  privacy     = "closed"
}

locals {
  admin    = github_team.admin.id
  maintain = github_team.maintain.id
}

# ###############################################################################
# The examples below create an organization repository and team repository
# To deploy this example export both the GITHUB_TOKEN and GITHUB_OWNER variables
# ###############################################################################

module "complete" {
  source             = "./../../"
  name               = "example-complete"
  description        = "A Terraform repository example."
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
