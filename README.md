## GitLab REST API Scripts

These bash scripts use the GitLab REST API v4 (https://docs.gitlab.com/ee/api/rest/).

The scripts use several predefined CI/CD variables (https://docs.gitlab.com/ee/ci/variables/predefined_variables.html) and 1 repository-specific variable (`PERSONAL_TOKEN`).

To use the scripts in any GitLab repository, a Maintainer should create a Personal Access Token with `api` scope and store the token in the `PERSONAL_TOKEN` variable for that repository.
