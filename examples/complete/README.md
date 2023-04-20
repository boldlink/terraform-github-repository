[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-github-repository/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-github-repository.svg)](https://github.com/boldlink/terraform-github-repository/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-github-repository/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-github-repository/actions)
[![Build Status](https://github.com/boldlink/terraform-github-repository/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-github-repository/actions)
[![Build Status](https://github.com/boldlink/terraform-github-repository/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-github-repository/actions)
[![Build Status](https://github.com/boldlink/terraform-github-repository/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-github-repository/actions)
[![Build Status](https://github.com/boldlink/terraform-github-repository/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-github-repository/actions)
[![Build Status](https://github.com/boldlink/terraform-github-repository/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-github-repository/actions)
[![Build Status](https://github.com/boldlink/terraform-github-repository/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-github-repository/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Module complete example (using branch protection v3 as default)


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_github"></a> [github](#requirement\_github) | = 5.8.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 5.8.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_complete"></a> [complete](#module\_complete) | ./../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [github_team.admin](https://registry.terraform.io/providers/integrations/github/5.8.0/docs/resources/team) | resource |
| [github_team.maintain](https://registry.terraform.io/providers/integrations/github/5.8.0/docs/resources/team) | resource |
| [random_pet.admin](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [random_pet.maintain](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
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
