# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- Feature: Add Branch protection options to additional branches.
- Fix: Remove the main branch if default branch changes.
- fix: CKV_GIT_6: "Ensure all commits GPG signed"
- fix: CKV_GIT_5: "Ensure at least two approving reviews for PRs"

## [1.4.1] - 2024-01-30
- Added a section in the main README about skipped checkov alert.
- Updated README footers

## [1.4.0] - 2023-12-07
- feat: bypass pull request allowances in branch protection v3
- show repository pages example
- fix: pull_request_bypassers in branch protection example

## [1.3.1] - 2023-11-24
- fix: removed deprecated contexts attribute
- showcased the following attributes in complete example visibility, has_issues,has_projects,has_wiki, is_template, allow_merge_commit, delete_branch_on_merge, has_downloads, auto_init, archive_on_destroy, vulnerability_alerts, archived
- added branch protection V3 in complete example
- added a depends on to github labels resource
- fix: required_status_checks in branch protection v3

## [1.3.0] - 2022-11-21
### Changes
- feat: added github actions secret resource to create and manage repository secrets
- fix: source branch for additional branches being created
- fix: required status checks arguments

## [1.2.0] - 2022-08-30
### Changes
- feat: Resource to create issues labels

## [1.1.0] - 2022-05-18
The following  additions, changes and fixes were made in this release.

### Added
- Minimum and complete example
- Branch protection resource
- `CHANGELOG` file added
- `CODEOWNERS` file added
- github action pre-commit file
- PR template
- Add makefile for terraform example test

### Changed
- README header and footer

### Fixed
- `required_pull_request_reviews` team values.

## [1.0.0] - 2022-03-07
Here following resources were added in this release.

### Added
- Default branch resource
- Branch protection resource (V3)
- Github repository resource
- Initial commit

[Unreleased]: https://github.com/boldlink/terraform-github-repository/1.4.1...HEAD

[1.4.1]: https://github.com/boldlink/terraform-github-repository/releases/tag/1.4.1
[1.4.0]: https://github.com/boldlink/terraform-github-repository/releases/tag/1.4.0
[1.3.1]: https://github.com/boldlink/terraform-github-repository/releases/tag/1.3.1
[1.3.0]: https://github.com/boldlink/terraform-github-repository/releases/tag/1.3.0
[1.2.0]: https://github.com/boldlink/terraform-github-repository/releases/tag/1.2.0
[1.1.0]: https://github.com/boldlink/terraform-github-repository/releases/tag/1.1.0
[1.0.0]: https://github.com/boldlink/terraform-github-repository/releases/tag/1.0.0
