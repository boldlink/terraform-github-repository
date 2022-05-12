locals {
  template                         = var.template == null ? [] : [var.template]
  required_status_checks           = var.required_status_checks == null ? [] : [var.required_status_checks]
  required_pull_request_reviews    = var.required_pull_request_reviews == null ? [] : [var.required_pull_request_reviews]
  required_pull_request_reviews_v3 = var.required_pull_request_reviews_v3 == null ? [] : [var.required_pull_request_reviews_v3]
  restrictions                     = var.restrictions == null ? [] : [var.restrictions]
  validate_protection_version      = var.use_branch_protection && var.use_branch_protection_v3 ? tobool("Sorry, you can only use either `github_branch_protection` or `github_branch_protection_v3`.") : true
}
