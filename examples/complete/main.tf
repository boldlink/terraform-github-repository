
resource "random_pet" "admin" {
  length = 2
}

resource "random_pet" "maintain" {
  length = 2
}

# Example organization teams
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

# ###############################################################################
# The examples below create an organization repository and team repository
# To deploy this example export both the GITHUB_TOKEN and GITHUB_OWNER variables
# ###############################################################################

module "complete" {
  source                 = "./../../"
  name                   = "example-complete"
  description            = "A Terraform repository example."
  license_template       = "apache-2.0"
  allow_squash_merge     = true
  branch                 = ["dev", "pre", "prd"]
  default_branch         = "develop"
  gitignore_template     = "Terraform"
  require_signed_commits = true
  homepage_url           = "https://boldlink.io"
  pattern                = "develop"
  template = {
    owner      = "boldlink"
    repository = "terraform-module-template"
  }
  teams = {
    admin    = local.admin
    maintain = local.maintain
  }

  branch_protection_version = {
    use_branch_protection    = true
    use_branch_protection_v3 = false
  }
  required_pull_request_reviews = {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 2
    restrict_dismissals             = true
    dismissal_restrictions          = []
    pull_request_bypassers          = [github_team.admin.node_id]
  }
  restrictions = {
    users = []
    teams = [
      local.admin,
      local.maintain
    ]
    apps = []
  }

  required_status_checks = {
      strict = true
      contexts = ["checkov-scan / checkov-scan"]
  }
  issue_label = {
    patch = {
      color       = "ff0000"
      description = "Sample label for complete example repo"
    }
  }

  secrets = {
    AUTOMATION_TOKEN = "<verysecrettoken>"
  }
}
