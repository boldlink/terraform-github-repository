# branch-protection-v3

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 4.24.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_branch_protection_v3"></a> [branch\_protection\_v3](#module\_branch\_protection\_v3) | ./../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.repository](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [github_team.admin](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/team) | data source |
| [github_team.contributer](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/team) | data source |
| [github_team.maintain](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/team) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_outputs"></a> [outputs](#output\_outputs) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
