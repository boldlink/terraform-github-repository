# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- Feature: Add Branch protection options to additional branches.
- Fix: Remove the main branch if default branch changes.
- fix: CKV_GIT_6: "Ensure all commits GPG signed"
- fix: CKV_GIT_5: "Ensure at least two approving reviews for PRs"

## [1.2.0] - 2022-08-30
### Changes
- feat: Resouce to create issues labels

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

[Unreleased]: https://github.com/boldlink/terraform-github-repository/1.2.0...HEAD
[1.1.2]: https://github.com/boldlink/terraform-github-repository/releases/tag/1.2.0
[1.1.0]: https://github.com/boldlink/terraform-github-repository/releases/tag/1.1.0
[1.0.0]: https://github.com/boldlink/terraform-github-repository/releases/tag/1.0.0