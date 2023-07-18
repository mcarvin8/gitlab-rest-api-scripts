#!/bin/bash
# Reference - https://docs.gitlab.com/ee/api/protected_branches.html#protect-repository-branches
# branch can be 1 branch name or multiple branch names with a wildcard
branch="$1"
# Maintainers - 40
# Developers + Maintainers - 30
curl --request POST \
     --header "PRIVATE-TOKEN: ${PERSONAL_TOKEN}" \
     "https://${CI_SERVER_HOST}/api/v4/projects/${CI_PROJECT_ID}/protected_branches?name=${branch}&push_access_level=30&merge_access_level=30&unprotect_access_level=40"
