
data "github_actions_public_key" "public_key" {
  repository = var.name
  depends_on = [
    github_repository.main
  ]
}

data "sodium_encrypted_item" "example" {
  for_each          = var.secrets
  public_key_base64 = data.github_actions_public_key.public_key.key
  content_base64    = base64encode(each.value)
}
