locals {
  template                         = var.template == null ? [] : [var.template]
  required_status_checks           = var.required_status_checks == null ? [] : [var.required_status_checks]
  required_status_checks_v3        = var.required_status_checks_v3 == null ? [] : [var.required_status_checks_v3]
  required_pull_request_reviews    = var.required_pull_request_reviews == null ? [] : [var.required_pull_request_reviews]
  required_pull_request_reviews_v3 = var.required_pull_request_reviews_v3 == null ? [] : [var.required_pull_request_reviews_v3]
  restrictions                     = var.restrictions == null ? [] : [var.restrictions]
}
