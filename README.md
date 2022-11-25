[![Build Status](https://github.com/boldlink/terraform-github-repository/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-github-repository/actions)
[![Build Status](https://github.com/boldlink/terraform-github-repository/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-github-repository/actions)
[![Build Status](https://github.com/boldlink/terraform-github-repository/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-github-repository/actions)
[![Build Status](https://github.com/boldlink/terraform-github-repository/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-github-repository/actions)
[![Build Status](https://github.com/boldlink/terraform-github-repository/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-github-repository/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Github Repository Terraform module

## Description

This module is a Boldlink opinionated structure adapted to our internal requirements for creating organization repositories.
This template creates your custom Github repository, team repositories allowing to configure access, branches and branches protection
### Why choose this module over the standard resources
- Option to create additional branches when creating the repository.
- Option to set a different branch as your default.
- You get to configure branch protection for your default branch using either `github_branch_protection` or `github_branch_protection_v3`.
- Option to create new issue labels for your repository.
- Using this module, you are able to create and manage github action secrets for your repository.
- Default configurations have been validated by Checkov to ensure best practices and security.


**NOTE** Both [github_branch_protection_v3.main](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_protection_v3) and  [github_branch_protection.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) require an upgrade to github team/enterprise, or the repository to be made public.

Examples available [`here`](https://github.com/boldlink/terraform-github-repository/tree/main/examples)

## Github Provider
*NOTE*: Github provider is currently locked to version `5.8.0` in the examples as it is the highest stable version that didn't break when we did tests.

## Usage
*NOTE*: These examples use the latest version of this module

```console
module "minimum" {
  source      = "boldlink/repository/github"
  name        = "example-minimum"
  description = "Terraform sample github repository "
}

```
## Documentation

[Github Documentation](https://docs.github.com/en/get-started/quickstart/create-a-repo)

[Terraform module documentation](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 4.24.1 |
| <a name="requirement_sodium"></a> [sodium](#requirement\_sodium) | 0.0.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 5.9.1 |
| <a name="provider_sodium"></a> [sodium](#provider\_sodium) | 0.0.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_secret.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_branch.branch](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_default.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_branch_protection.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_branch_protection_v3.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection_v3) | resource |
| [github_issue_label.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_repository.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_team_repository.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [github_actions_public_key.public_key](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/actions_public_key) | data source |
| [sodium_encrypted_item.example](https://registry.terraform.io/providers/killmeplz/sodium/0.0.3/docs/data-sources/encrypted_item) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_auto_merge"></a> [allow\_auto\_merge](#input\_allow\_auto\_merge) | (Optional) Set to true to allow auto-merging pull requests on the repository. | `bool` | `true` | no |
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | (Optional) Set to false to disable merge commits on the repository. (Default: true) | `bool` | `true` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | (Optional) Set to true to enable rebase merges on the repository. (Default: false) | `bool` | `false` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | (Optional) Set to true to enable squash merges on the repository. (Default: false) | `bool` | `false` | no |
| <a name="input_allows_deletions"></a> [allows\_deletions](#input\_allows\_deletions) | (Optional) Boolean, setting this to true to allow the branch to be deleted. | `bool` | `true` | no |
| <a name="input_allows_force_pushes"></a> [allows\_force\_pushes](#input\_allows\_force\_pushes) | (Optional) Boolean, setting this to true to allow force pushes on the branch. | `bool` | `false` | no |
| <a name="input_archive_on_destroy"></a> [archive\_on\_destroy](#input\_archive\_on\_destroy) | (Optional) Set to `false` to not archive the repository instead of deleting on destroy. | `bool` | `false` | no |
| <a name="input_archived"></a> [archived](#input\_archived) | (Optional) Specifies if the repository should be archived. (Default: false) | `bool` | `false` | no |
| <a name="input_auto_init"></a> [auto\_init](#input\_auto\_init) | (Optional) Whether or not to produce an initial commit in the repository. (Default: true) | `bool` | `true` | no |
| <a name="input_branch"></a> [branch](#input\_branch) | (Required) The branch (e.g. stage) | `list(string)` | `[]` | no |
| <a name="input_branch_protection_version"></a> [branch\_protection\_version](#input\_branch\_protection\_version) | Provide the branch protection options.Either `branch_protection_v3` or `branch_protection` Only one option can be `true`. | <pre>object({<br>    use_branch_protection    = bool<br>    use_branch_protection_v3 = bool<br>  })</pre> | <pre>{<br>  "use_branch_protection": false,<br>  "use_branch_protection_v3": true<br>}</pre> | no |
| <a name="input_default_branch"></a> [default\_branch](#input\_default\_branch) | The default branch (e.g. develop) | `string` | `"main"` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | (Optional) Whether or not to delete the merged branch after merging a pull request. (Default: false) | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description of the repository. | `string` | `null` | no |
| <a name="input_enforce_admins"></a> [enforce\_admins](#input\_enforce\_admins) | (Optional) Boolean, setting this to `true` enforces status checks for repository | `bool` | `true` | no |
| <a name="input_gitignore_template"></a> [gitignore\_template](#input\_gitignore\_template) | (Optional) Use the name of the template without the extension. For example, Haskell. Available templates: https://github.com/github/gitignore | `string` | `null` | no |
| <a name="input_has_downloads"></a> [has\_downloads](#input\_has\_downloads) | (Optional) Set to true to enable the (deprecated) downloads features on the repository. (Default: false) | `bool` | `false` | no |
| <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues) | (Optional) Set to true to enable the GitHub Issues features on the repository. (Default: false) | `bool` | `false` | no |
| <a name="input_has_projects"></a> [has\_projects](#input\_has\_projects) | (Optional) Set to true to enable the GitHub Projects features on the repository. Per the github documentation when in an organization that has disabled repository projects it will default to false and will otherwise default to true. If you specify true when it has been disabled it will return an error.  (Default: false) | `bool` | `false` | no |
| <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki) | (Optional) Set to true to enable the GitHub Wiki features on the repository. (Default: false) | `bool` | `false` | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | (Optional) The website of the repository. | `string` | `null` | no |
| <a name="input_is_template"></a> [is\_template](#input\_is\_template) | (Optional) Whether or not to tell GitHub that this is a template repository. ( Default: false) | `bool` | `false` | no |
| <a name="input_issue_label"></a> [issue\_label](#input\_issue\_label) | A map of labels to add to the repository | `map(any)` | `{}` | no |
| <a name="input_license_template"></a> [license\_template](#input\_license\_template) | (Optional) Use the name of the template without the extension. For example, 'mit' or 'mpl-2.0'. Available licenses: https://github.com/github/choosealicense.com/tree/gh-pages/_licenses | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the repository. | `string` | n/a | yes |
| <a name="input_pages"></a> [pages](#input\_pages) | The repository's GitHub Pages configuration, see examples for working example and required properties | `any` | `null` | no |
| <a name="input_pattern"></a> [pattern](#input\_pattern) | (Required) Identifies the protection rule pattern. | `string` | `"main"` | no |
| <a name="input_push_restrictions"></a> [push\_restrictions](#input\_push\_restrictions) | (Optional) The list of actor IDs that may push to the branch. | `list(string)` | `[]` | no |
| <a name="input_require_conversation_resolution"></a> [require\_conversation\_resolution](#input\_require\_conversation\_resolution) | (Optional) Boolean, setting this to true requires all conversations on code must be resolved before a pull request can be merged. | `bool` | `true` | no |
| <a name="input_require_signed_commits"></a> [require\_signed\_commits](#input\_require\_signed\_commits) | (Optional) Boolean, setting this to true requires all commits to be signed with GPG. | `bool` | `false` | no |
| <a name="input_required_linear_history"></a> [required\_linear\_history](#input\_required\_linear\_history) | (Optional) Boolean, setting this to true enforces a linear commit Git history, which prevents anyone from pushing merge commits to a branch | `bool` | `true` | no |
| <a name="input_required_pull_request_reviews"></a> [required\_pull\_request\_reviews](#input\_required\_pull\_request\_reviews) | (Optional) Enforce restrictions for pull request reviews. | <pre>object({<br>    dismiss_stale_reviews           = bool<br>    restrict_dismissals             = bool<br>    dismissal_restrictions          = list(string)<br>    pull_request_bypassers          = list(string)<br>    require_code_owner_reviews      = bool<br>    required_approving_review_count = number<br>  })</pre> | `null` | no |
| <a name="input_required_pull_request_reviews_v3"></a> [required\_pull\_request\_reviews\_v3](#input\_required\_pull\_request\_reviews\_v3) | supports the following arguments: `dismiss_stale_reviews` (Optional) Dismiss approved reviews automatically when a new commit is pushed. Defaults to `false` / `dismissal_users` (Optional) The list of user logins with dismissal access / `dismissal_teams` (Optional) The list of team slugs with dismissal access. Always use slug of the team, not its name. Each team already has to have access to the repository. /  / `require_code_owner_reviews` (Optional) Require an approved review in pull requests including files with a designated code owner. Defaults to `false` / `required_approving_review_count` (Optional) Require x number of approvals to satisfy branch protection requirements. If this is specified it must be a number between `1-6` | <pre>object({<br>    dismiss_stale_reviews           = bool<br>    dismissal_users                 = list(string)<br>    dismissal_teams                 = list(string)<br>    require_code_owner_reviews      = bool<br>    required_approving_review_count = number<br>  })</pre> | `null` | no |
| <a name="input_required_status_checks"></a> [required\_status\_checks](#input\_required\_status\_checks) | Enforce restrictions for required status checks, `strict` (Optional) Require branches to be up to date before merging. Defaults to false `contexts` (Optional) The list of status checks to require in order to merge into this branch. No status checks are required by default. | <pre>object({<br>    strict  = bool<br>    context = list(string)<br>  })</pre> | `null` | no |
| <a name="input_restrictions"></a> [restrictions](#input\_restrictions) | supports the following arguments: `users` (Optional) The list of user logins with push access. / `teams` (Optional) The list of team slugs with push access. Always use slug of the team, not its name. Each team already has to have access to the repository. / `apps` (Optional) The list of app slugs with push access. | <pre>object({<br>    users = list(string)<br>    teams = list(string)<br>    apps  = list(string)<br>  })</pre> | `null` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | A map of secrets to be created with your repository | `map(any)` | `{}` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | The teams and respective permissions to the repository, for example `admin = maintainer` | `map(string)` | `{}` | no |
| <a name="input_template"></a> [template](#input\_template) | Template repository to use, specify a `owner` and a `repository` id | <pre>object({<br>    owner      = string<br>    repository = string<br>  })</pre> | `null` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | (Optional) The list of topics of the repository.  (Default: []) | `list(string)` | `[]` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | (Optional) Can be 'public', 'private' or 'internal' .The visibility parameter overrides the private parameter. Defaults to 'private' if neither private nor visibility are set, default to state of private parameter if it is set. | `string` | `"private"` | no |
| <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts) | (Optional) Set to `false` to disable security alerts for vulnerable dependencies. Enabling requires alerts to be enabled on the owner level. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_full_name"></a> [full\_name](#output\_full\_name) | A string of the form 'orgname/reponame'. |
| <a name="output_git_clone_url"></a> [git\_clone\_url](#output\_git\_clone\_url) | URL that can be provided to git clone to clone the repository anonymously via the git protocol. |
| <a name="output_html_url"></a> [html\_url](#output\_html\_url) | URL to the repository on the web. |
| <a name="output_http_clone_url"></a> [http\_clone\_url](#output\_http\_clone\_url) | URL that can be provided to git clone to clone the repository via HTTPS. |
| <a name="output_repository"></a> [repository](#output\_repository) | All attributes and arguments as returned by the github\_repository resource. |
| <a name="output_ssh_clone_url"></a> [ssh\_clone\_url](#output\_ssh\_clone\_url) | URL that can be provided to git clone to clone the repository via SSH. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

#### BOLDLink-SIG 2022
