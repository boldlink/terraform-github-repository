[![Build Status](https://github.com/boldlink/terraform-github-repositorygit /actions/workflows/pre-commit.yml/badge.svg)](https://github.com/boldlink/terraform-github-repository/actions)

<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>

# Github Repository Terraform module


## Description

This module is a Boldlink opinionated structure adapted to our internal requirements for creating organization repositories.

This template creates your custom Github repository, team repositories allowing to configure access, branches and branches protection

**NOTE** [github_branch_protection_v3.main](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_protection_v3) requires an upgrade to github pro or the repository to be made public.

Examples available [`here`](https://github.com/boldlink/terraform-github-repository/tree/main/examples)

## Usage
*NOTE*: These examples use the latest version of this module

```console
module "minimum" {
  source             = "./../../"
  name               = "sample-terraform-repository"
  description        = "Terraform sample github repository "
  visibility         = "public"
}

```
## Documentation

[Github Documentation](https://docs.github.com/en/get-started/quickstart/create-a-repo)

[Terraform module documentation](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.13.7](https://releases.hashicorp.com/terraform/0.13.7/) For backwards compatibility we are using version 0.13.7 for testing making this the min version tested.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

#### BOLDLink-SIG 2022
