module "minimum" {
  source      = "./../../"
  name        = "example-minimum"
  description = "Terraform sample github repository "
  visibility  = "private"

  required_pull_request_reviews = {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 2
    dismissal_teams                 = []
    dismissal_restrictions          = []
    pull_request_bypassers          = []
    restrict_dismissals             = true
  }
}
