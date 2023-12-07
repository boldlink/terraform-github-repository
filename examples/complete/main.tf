
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
  name                   = "example-complete-repository"
  description            = "A github repository example created using terraform."
  license_template       = "apache-2.0"
  allow_squash_merge     = true
  branch                 = ["dev", "prod"]
  default_branch         = "develop"
  gitignore_template     = "Terraform"
  require_signed_commits = true
  homepage_url           = "https://boldlink.io"
  pattern                = "develop"
  visibility             = "private"
  has_issues             = true
  has_projects           = true
  has_wiki               = true
  is_template            = false
  allow_merge_commit     = false
  delete_branch_on_merge = true
  has_downloads          = false
  auto_init              = true
  archive_on_destroy     = false
  vulnerability_alerts   = true
  archived               = false
  topics                 = []
  template = {
    owner      = "boldlink"
    repository = "terraform-module-template"
  }
  pages = {
    branch     = "main" # branch must exist before GitHub Pages can be built
    path       = "/"
    build_type = "legacy"
  }
  teams = {
    admin    = local.admin
    maintain = local.maintain
  }

  branch_protection_version = {
    use_branch_protection    = false
    use_branch_protection_v3 = true
  }
  enforce_admins                  = false #this option is set to false to show bypass_pull_request_allowances being effected
  require_conversation_resolution = true

  required_pull_request_reviews_v3 = {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 2
    restrict_dismissals             = true
    dismissal_teams                 = [github_team.admin.node_id]
    dismissal_users                 = ["ndegwajohn"]
    bypass_pull_request_allowances = {
      users = ["ndegwajohn"]
      teams = []
      apps  = []
    }
  }
  restrictions = {
    users = []
    teams = [
      local.admin,
      local.maintain
    ]
    apps = []
  }



  required_status_checks_v3 = {
    strict = true
    checks = [
      "ci/check"
    ]
  }
  issue_label = {
    patch = {
      color       = "ff0000"
      description = "Example label for complete repository"
    }
  }

  secrets = {
    AUTOMATION_TOKEN = "<verysecrettoken>"
  }
}
