module "minimum" {
  #checkov:skip=CKV_GIT_6:"Ensure all commits GPG signed"
  #checkov:skip=CKV_GIT_5:"Ensure at least two approving reviews for PRs"
  source      = "./../../"
  name        = "example-minimum"
  description = "Terraform sample github repository "
}
