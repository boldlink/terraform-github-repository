locals {
  admin     = github_team.admin.id
  maintain  = github_team.maintain.id
  bypassers = github_team.admin.node_id
}
