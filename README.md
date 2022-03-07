# Terraform module for Github Repository

This module is a Boldlink opinionated structure adapted to our internal requirements for creating organization repositories. 

## Description

This template creates your custom Github repository allowing to configure access, branches and branches protection (v3)

Example available [here](https://github.com/boldlink/terraform-github-repository/tree/main/examples)

**NOTE** [github_branch_protection_v3.main](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_protection_v3) for any other branch apart from main  branch requires an upgrade to github pro or the repository to be made public.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 4.20.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_branch.branch](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch) | resource |
| [github_branch.default](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch) | resource |
| [github_branch_default.default](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_default) | resource |
| [github_branch_protection_v3.main](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_protection_v3) | resource |
| [github_repository.main](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository) | resource |
| [github_team_repository.main](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/team_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_auto_merge"></a> [allow\_auto\_merge](#input\_allow\_auto\_merge) | (Optional) Set to true to allow auto-merging pull requests on the repository. | `bool` | `true` | no |
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | (Optional) Set to false to disable merge commits on the repository. (Default: true) | `bool` | `true` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | (Optional) Set to true to enable rebase merges on the repository. (Default: false) | `bool` | `false` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | (Optional) Set to true to enable squash merges on the repository. (Default: false) | `bool` | `false` | no |
| <a name="input_archive_on_destroy"></a> [archive\_on\_destroy](#input\_archive\_on\_destroy) | (Optional) Set to `false` to not archive the repository instead of deleting on destroy. | `bool` | n/a | yes |
| <a name="input_archived"></a> [archived](#input\_archived) | (Optional) Specifies if the repository should be archived. (Default: false) | `bool` | `false` | no |
| <a name="input_auto_init"></a> [auto\_init](#input\_auto\_init) | (Optional) Whether or not to produce an initial commit in the repository. (Default: true) | `bool` | `true` | no |
| <a name="input_branch"></a> [branch](#input\_branch) | (Required) The branch (e.g. stage) | `list(string)` | `[]` | no |
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
| <a name="input_license_template"></a> [license\_template](#input\_license\_template) | (Optional) Use the name of the template without the extension. For example, 'mit' or 'mpl-2.0'. Available licenses: https://github.com/github/choosealicense.com/tree/gh-pages/_licenses | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the repository. | `string` | n/a | yes |
| <a name="input_pages"></a> [pages](#input\_pages) | The repository's GitHub Pages configuration, see examples for working example and required properties | `any` | `null` | no |
| <a name="input_required_pull_request_reviews"></a> [required\_pull\_request\_reviews](#input\_required\_pull\_request\_reviews) | supports the following arguments: `dismiss_stale_reviews` (Optional) Dismiss approved reviews automatically when a new commit is pushed. Defaults to `false` / `dismissal_users` (Optional) The list of user logins with dismissal access / `dismissal_teams` (Optional) The list of team slugs with dismissal access. Always use slug of the team, not its name. Each team already has to have access to the repository. /  / `require_code_owner_reviews` (Optional) Require an approved review in pull requests including files with a designated code owner. Defaults to `false` / `required_approving_review_count` (Optional) Require x number of approvals to satisfy branch protection requirements. If this is specified it must be a number between `1-6` | <pre>object({<br>    dismiss_stale_reviews           = bool<br>    dismissal_users                 = list(string)<br>    dismissal_teams                 = list(string)<br>    require_code_owner_reviews      = bool<br>    required_approving_review_count = number<br>  })</pre> | `null` | no |
| <a name="input_required_status_checks"></a> [required\_status\_checks](#input\_required\_status\_checks) | Enforce restrictions for required status checks, `strict` (Optional) Require branches to be up to date before merging. Defaults to false `contexts` (Optional) The list of status checks to require in order to merge into this branch. No status checks are required by default. | <pre>object({<br>    strict  = bool<br>    context = list(string)<br>  })</pre> | `null` | no |
| <a name="input_restrictions"></a> [restrictions](#input\_restrictions) | supports the following arguments: `users` (Optional) The list of user logins with push access. / `teams` (Optional) The list of team slugs with push access. Always use slug of the team, not its name. Each team already has to have access to the repository. / `apps` (Optional) The list of app slugs with push access. | <pre>object({<br>    users = list(string)<br>    teams = list(string)<br>    apps  = list(string)<br>  })</pre> | `null` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | The teams and respective permissions to the repository, for example `admin = maintainer` | `map(string)` | `{}` | no |
| <a name="input_template"></a> [template](#input\_template) | Template repository to use, specify a `owner` and a `repository` id | <pre>object({<br>    owner      = string<br>    repository = string<br>  })</pre> | `null` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | (Optional) The list of topics of the repository.  (Default: []) | `list(string)` | `[]` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | (Optional) Can be 'public', 'private' or 'internal' .The visibility parameter overrides the private parameter. Defaults to 'private' if neither private nor visibility are set, default to state of private parameter if it is set. | `string` | `"private"` | no |
| <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts) | (Optional) Set to `false` to disable security alerts for vulnerable dependencies. Enabling requires alerts to be enabled on the owner level. | `bool` | `null` | no |

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
