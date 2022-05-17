
resource "random_pet" "admin" {
  length = 2
}

resource "random_pet" "maintain" {
  length = 2
}

# Sample organization teams
resource "github_team" "admin" {
  name        = random_pet.admin.id
  description = "Sample admin team"
  privacy     = "closed"
}

resource "github_team" "maintain" {
  name        = random_pet.maintain.id
  description = "Sample maintain team"
  privacy     = "closed"
}

locals {
  admin     = github_team.admin.id
  maintain  = github_team.maintain.id
  bypassers = github_team.admin.node_id
}

# ###############################################################################
# The examples below create an organization repository and team repository
# To deploy this example export both the GITHUB_TOKEN and GITHUB_OWNER variables
# ###############################################################################

module "branch_protection" {
  source             = "./../../"
  name               = "example-branch-protection"
  description        = "A Terraform repository example"
  license_template   = "apache-2.0"
  allow_squash_merge = true
  branch             = ["dev", "pre", "prd"]
  default_branch     = "develop"
  visibility         = "public"
  homepage_url       = "https://boldlink.io"
  branch_protection_version = {
    use_branch_protection    = true
    use_branch_protection_v3 = false
  }
  template = {
    owner      = "boldlink"
    repository = "terraform-module-template"
  }
  teams = {
    admin    = local.admin
    maintain = local.maintain
  }
  required_pull_request_reviews = {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
    dismissal_teams                 = []
    dismissal_restrictions          = []
    pull_request_bypassers          = [local.bypassers]
    restrict_dismissals             = true
  }
  push_restrictions = [
    github_team.admin.node_id,
  ]
}
