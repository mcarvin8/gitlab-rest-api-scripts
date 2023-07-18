#!/bin/bash
source_branch="$1"
target_branch="$2"
mr_title="$3"
# Reference - https://docs.gitlab.com/ee/api/merge_requests.html#create-mr
curl --request POST \
     --data "source_branch=${source_branch}&target_branch=${target_branch}&title=${mr_title}" \
     --header "PRIVATE-TOKEN: ${PROJECT_TOKEN}" \
     "https://${CI_SERVER_HOST}/api/v4/projects/${CI_PROJECT_ID}/merge_requests"
