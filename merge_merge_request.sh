#!/bin/bash
mr_id="$1"
# Reference - https://docs.gitlab.com/ee/api/merge_requests.html#merge-a-merge-request
curl --request PUT \
     --header "PRIVATE-TOKEN: ${PERSONAL_TOKEN}" \
     "https://${CI_SERVER_HOST}/api/v4/projects/${CI_PROJECT_ID}/merge_requests/${mr_id}/merge"
