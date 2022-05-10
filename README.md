[![Build Status](https://github.com/boldlink/terraform-module-template/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/boldlink/terraform-module-template/actions)

<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>

# Terraform module for Github Repository

This module is a Boldlink opinionated structure adapted to our internal requirements for creating organization repositories. 

## Description

This template creates your custom Github repository allowing to configure access, branches and branches protection (v3)

Example available [here](https://github.com/boldlink/terraform-github-repository/tree/main/examples)

**NOTE** [github_branch_protection_v3.main](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_protection_v3) for any other branch apart from main  branch requires an upgrade to github pro or the repository to be made public.

Examples available [`here`](https://github.com/boldlink/terraform-github-repository/tree/main/examples)

## Usage
*NOTE*: These examples use the latest version of this module

```console
module "random_repository" {
  source             = "boldlink/repository/github"
  version            = "1.0.0"
  name               = "new-repo"
  description        = "Terraform random repository example"
}
```
## Documentation

[<ex. Amazon VPC/Github/Cloudflare> Documentation](https://link)

[Terraform module documentation](https://link)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.13.7](https://releases.hashicorp.com/terraform/0.13.7/) For backwards compability we are using version 0.13.7 for testing making this the min version tested.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

#### BOLDLink-SIG 2022
