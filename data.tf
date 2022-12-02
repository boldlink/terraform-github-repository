
data "github_actions_public_key" "main" {
  repository = var.name
  depends_on = [
    github_repository.main
  ]
}

data "sodium_encrypted_item" "main" {
  for_each          = var.secrets
  public_key_base64 = data.github_actions_public_key.main.key
  content_base64    = base64encode(each.value)
}
