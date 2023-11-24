resource "github_repository" "main" {
  name                   = var.name
  description            = var.description
  homepage_url           = var.homepage_url
  visibility             = var.visibility
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  is_template            = var.is_template
  allow_merge_commit     = var.allow_merge_commit
  allow_rebase_merge     = var.allow_rebase_merge
  allow_squash_merge     = var.allow_squash_merge
  allow_auto_merge       = var.allow_auto_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  has_downloads          = var.has_downloads
  auto_init              = var.auto_init
  gitignore_template     = var.gitignore_template
  license_template       = var.license_template
  archived               = var.archived
  archive_on_destroy     = var.archive_on_destroy
  dynamic "pages" {
    for_each = var.pages != null ? [true] : []

    content {
      source {
        branch = var.pages.branch
        path   = try(var.pages.path, "/")
      }
      cname = try(var.pages.cname, null)
    }
  }
  topics = var.topics
  dynamic "template" {
    for_each = local.template
    content {
      owner      = template.value.owner
      repository = template.value.repository
    }
  }
  vulnerability_alerts = var.vulnerability_alerts
}

resource "github_branch" "branch" {
  count         = length(var.branch) == 0 ? 0 : length(var.branch)
  repository    = github_repository.main.name
  branch        = element(var.branch, count.index)
  source_branch = var.default_branch
  depends_on = [
    github_repository.main,
    github_branch.default
  ]
}

resource "github_branch" "default" {
  count      = var.default_branch == "main" ? 0 : 1
  repository = github_repository.main.name
  branch     = var.default_branch
  depends_on = [
    github_repository.main
  ]
}

resource "github_branch_default" "default" {
  count      = var.default_branch == "main" ? 0 : 1
  repository = github_repository.main.name
  branch     = var.default_branch
  depends_on = [
    github_branch.default
  ]
}

resource "github_team_repository" "main" {
  for_each   = var.teams
  repository = github_repository.main.name
  permission = each.key
  team_id    = each.value
}

resource "github_branch_protection_v3" "main" {
  count                           = var.branch_protection_version.use_branch_protection_v3 ? 1 : 0
  repository                      = github_repository.main.name
  branch                          = var.default_branch
  enforce_admins                  = var.enforce_admins
  require_signed_commits          = var.require_signed_commits
  require_conversation_resolution = var.require_conversation_resolution

  dynamic "required_status_checks" {
    for_each = local.required_status_checks
    content {
      strict = required_status_checks.value.strict
      #checks  = required_status_checks.value.checks
    }
  }

  dynamic "required_pull_request_reviews" {
    for_each = local.required_pull_request_reviews_v3
    content {
      dismiss_stale_reviews           = required_pull_request_reviews.value.dismiss_stale_reviews
      dismissal_users                 = required_pull_request_reviews.value.dismissal_users
      dismissal_teams                 = required_pull_request_reviews.value.dismissal_teams
      require_code_owner_reviews      = required_pull_request_reviews.value.require_code_owner_reviews
      required_approving_review_count = required_pull_request_reviews.value.required_approving_review_count
    }
  }

  dynamic "restrictions" {
    for_each = local.restrictions
    content {
      users = restrictions.value.users
      teams = restrictions.value.teams
      apps  = restrictions.value.apps
    }
  }

  depends_on = [
    github_branch_default.default,
    github_branch.default
  ]
}

resource "github_branch_protection" "main" {
  count                           = var.branch_protection_version.use_branch_protection ? 1 : 0
  repository_id                   = github_repository.main.name
  pattern                         = var.pattern
  enforce_admins                  = var.enforce_admins
  require_signed_commits          = var.require_signed_commits
  required_linear_history         = var.required_linear_history
  require_conversation_resolution = var.require_conversation_resolution
  allows_deletions                = var.allows_deletions
  allows_force_pushes             = var.allows_force_pushes

  dynamic "required_status_checks" {
    for_each = local.required_status_checks
    content {
      strict = required_status_checks.value.strict
      #checks = required_status_checks.value.checks
    }
  }

  dynamic "required_pull_request_reviews" {
    for_each = local.required_pull_request_reviews
    content {
      dismiss_stale_reviews           = required_pull_request_reviews.value.dismiss_stale_reviews
      restrict_dismissals             = required_pull_request_reviews.value.restrict_dismissals
      dismissal_restrictions          = required_pull_request_reviews.value.dismissal_restrictions
      pull_request_bypassers          = required_pull_request_reviews.value.pull_request_bypassers
      require_code_owner_reviews      = required_pull_request_reviews.value.require_code_owner_reviews
      required_approving_review_count = required_pull_request_reviews.value.required_approving_review_count
    }
  }

  push_restrictions = var.push_restrictions
}

resource "github_issue_label" "main" {
  for_each    = var.issue_label
  repository  = var.name
  name        = each.key
  color       = each.value.color
  description = each.value.description
  depends_on  = [github_repository.main]
}

resource "github_actions_secret" "main" {
  for_each        = var.secrets
  repository      = github_repository.main.name
  secret_name     = each.key
  encrypted_value = data.sodium_encrypted_item.main[each.key].encrypted_value_base64
  depends_on = [
    github_repository.main
  ]
}
