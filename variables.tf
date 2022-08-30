#repository
variable "name" {
  description = "(Required) The name of the repository."
  type        = string
}

variable "description" {
  description = "(Optional) A description of the repository."
  type        = string
  default     = null
}

variable "visibility" {
  description = "(Optional) Can be 'public', 'private' or 'internal' .The visibility parameter overrides the private parameter. Defaults to 'private' if neither private nor visibility are set, default to state of private parameter if it is set."
  type        = string
  default     = "private"
}

variable "auto_init" {
  description = "(Optional) Whether or not to produce an initial commit in the repository. (Default: true)"
  type        = bool
  default     = true
}

variable "homepage_url" {
  description = "(Optional) The website of the repository."
  type        = string
  default     = null
}

variable "has_issues" {
  description = "(Optional) Set to true to enable the GitHub Issues features on the repository. (Default: false)"
  type        = bool
  default     = false
}

variable "has_projects" {
  description = "(Optional) Set to true to enable the GitHub Projects features on the repository. Per the github documentation when in an organization that has disabled repository projects it will default to false and will otherwise default to true. If you specify true when it has been disabled it will return an error.  (Default: false)"
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "(Optional) Set to true to enable the GitHub Wiki features on the repository. (Default: false)"
  type        = bool
  default     = false
}

variable "allow_auto_merge" {
  description = " (Optional) Set to true to allow auto-merging pull requests on the repository."
  type        = bool
  default     = true
}
variable "allow_merge_commit" {
  description = "(Optional) Set to false to disable merge commits on the repository. (Default: true)"
  type        = bool
  default     = true
}

variable "allow_rebase_merge" {
  description = "(Optional) Set to true to enable rebase merges on the repository. (Default: false)"
  type        = bool
  default     = false
}

variable "allow_squash_merge" {
  description = "(Optional) Set to true to enable squash merges on the repository. (Default: false)"
  type        = bool
  default     = false
}

variable "delete_branch_on_merge" {
  description = "(Optional) Whether or not to delete the merged branch after merging a pull request. (Default: false)"
  type        = bool
  default     = true
}

variable "is_template" {
  description = "(Optional) Whether or not to tell GitHub that this is a template repository. ( Default: false)"
  type        = bool
  default     = false
}

variable "has_downloads" {
  description = "(Optional) Set to true to enable the (deprecated) downloads features on the repository. (Default: false)"
  type        = bool
  default     = false
}

variable "gitignore_template" {
  description = "(Optional) Use the name of the template without the extension. For example, Haskell. Available templates: https://github.com/github/gitignore"
  type        = string
  default     = null
}

variable "license_template" {
  description = "(Optional) Use the name of the template without the extension. For example, 'mit' or 'mpl-2.0'. Available licenses: https://github.com/github/choosealicense.com/tree/gh-pages/_licenses"
  type        = string
  default     = null
}

variable "archived" {
  description = "(Optional) Specifies if the repository should be archived. (Default: false)"
  type        = bool
  default     = false
}

variable "topics" {
  description = "(Optional) The list of topics of the repository.  (Default: [])"
  type        = list(string)
  default     = []
}

variable "archive_on_destroy" {
  type        = bool
  description = "(Optional) Set to `false` to not archive the repository instead of deleting on destroy."
  default     = false
}

variable "vulnerability_alerts" {
  type        = bool
  description = "(Optional) Set to `false` to disable security alerts for vulnerable dependencies. Enabling requires alerts to be enabled on the owner level."
  default     = null
}

#branch
variable "branch" {
  description = "(Required) The branch (e.g. stage)"
  type        = list(string)
  default     = []
}

variable "default_branch" {
  description = "The default branch (e.g. develop)"
  type        = string
  default     = "main"
}

variable "template" {
  description = "Template repository to use, specify a `owner` and a `repository` id"
  type = object({
    owner      = string
    repository = string
  })
  default = null
}

variable "pages" {
  description = "The repository's GitHub Pages configuration, see examples for working example and required properties"
  type        = any
  default     = null
}

variable "teams" {
  description = "The teams and respective permissions to the repository, for example `admin = maintainer`"
  type        = map(string)
  default     = {}
}

variable "required_status_checks" {
  type = object({
    strict  = bool
    context = list(string)
  })
  description = "Enforce restrictions for required status checks, `strict` (Optional) Require branches to be up to date before merging. Defaults to false `contexts` (Optional) The list of status checks to require in order to merge into this branch. No status checks are required by default."
  default     = null
}

variable "required_pull_request_reviews_v3" {
  type = object({
    dismiss_stale_reviews           = bool
    dismissal_users                 = list(string)
    dismissal_teams                 = list(string)
    require_code_owner_reviews      = bool
    required_approving_review_count = number
  })
  description = "supports the following arguments: `dismiss_stale_reviews` (Optional) Dismiss approved reviews automatically when a new commit is pushed. Defaults to `false` / `dismissal_users` (Optional) The list of user logins with dismissal access / `dismissal_teams` (Optional) The list of team slugs with dismissal access. Always use slug of the team, not its name. Each team already has to have access to the repository. /  / `require_code_owner_reviews` (Optional) Require an approved review in pull requests including files with a designated code owner. Defaults to `false` / `required_approving_review_count` (Optional) Require x number of approvals to satisfy branch protection requirements. If this is specified it must be a number between `1-6`"
  default     = null
}

variable "restrictions" {
  type = object({
    users = list(string)
    teams = list(string)
    apps  = list(string)
  })
  description = "supports the following arguments: `users` (Optional) The list of user logins with push access. / `teams` (Optional) The list of team slugs with push access. Always use slug of the team, not its name. Each team already has to have access to the repository. / `apps` (Optional) The list of app slugs with push access."
  default     = null
}

variable "enforce_admins" {
  type        = bool
  description = "(Optional) Boolean, setting this to `true` enforces status checks for repository"
  default     = true
}

# Branch protection
variable "pattern" {
  description = " (Required) Identifies the protection rule pattern."
  type        = string
  default     = "main"
}

variable "require_signed_commits" {
  description = "(Optional) Boolean, setting this to true requires all commits to be signed with GPG."
  type        = bool
  default     = false
}

variable "required_linear_history" {
  description = "(Optional) Boolean, setting this to true enforces a linear commit Git history, which prevents anyone from pushing merge commits to a branch"
  type        = bool
  default     = true
}

variable "require_conversation_resolution" {
  description = "(Optional) Boolean, setting this to true requires all conversations on code must be resolved before a pull request can be merged."
  type        = bool
  default     = true
}

variable "push_restrictions" {
  description = "(Optional) The list of actor IDs that may push to the branch."
  type        = list(string)
  default     = []
}

variable "allows_deletions" {
  description = "(Optional) Boolean, setting this to true to allow the branch to be deleted."
  type        = bool
  default     = true
}

variable "allows_force_pushes" {
  description = "(Optional) Boolean, setting this to true to allow force pushes on the branch."
  type        = bool
  default     = false
}

variable "required_pull_request_reviews" {
  description = "(Optional) Enforce restrictions for pull request reviews."
  type = object({
    dismiss_stale_reviews           = bool
    restrict_dismissals             = bool
    dismissal_restrictions          = list(string)
    pull_request_bypassers          = list(string)
    require_code_owner_reviews      = bool
    required_approving_review_count = number
  })
  default = null
}

variable "branch_protection_version" {
  description = "Provide the branch protection options.Either `branch_protection_v3` or `branch_protection` Only one option can be `true`."
  type = object({
    use_branch_protection    = bool
    use_branch_protection_v3 = bool
  })
  default = {
    use_branch_protection    = false
    use_branch_protection_v3 = true
  }
  validation {
    condition     = (var.branch_protection_version.use_branch_protection == true && var.branch_protection_version.use_branch_protection_v3 == false) || (var.branch_protection_version.use_branch_protection == false && var.branch_protection_version.use_branch_protection_v3 == true) || (var.branch_protection_version.use_branch_protection == false && var.branch_protection_version.use_branch_protection_v3 == false)
    error_message = "Only set one of the following to true; either `branch_protection` or `branch_protection_v3`."
  }
}

# Issue labels
variable "issue_label" {
  description = "A map of labels to add to the repository"
  type        = map(any)
  default     = {}
}
