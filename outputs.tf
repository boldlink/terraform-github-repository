output "repository" {
  value       = github_repository.main
  description = "All attributes and arguments as returned by the github_repository resource."
}

output "full_name" {
  value       = github_repository.main.full_name
  description = "A string of the form 'orgname/reponame'."
}

output "html_url" {
  value       = github_repository.main.html_url
  description = "URL to the repository on the web."
}

output "ssh_clone_url" {
  value       = github_repository.main.ssh_clone_url
  description = "URL that can be provided to git clone to clone the repository via SSH."
}

output "http_clone_url" {
  value       = github_repository.main.http_clone_url
  description = "URL that can be provided to git clone to clone the repository via HTTPS."
}

output "git_clone_url" {
  value       = github_repository.main.git_clone_url
  description = "URL that can be provided to git clone to clone the repository anonymously via the git protocol."
}

