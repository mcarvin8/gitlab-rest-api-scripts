#!/bin/bash
# https://docs.gitlab.com/ee/api/tags.html#create-a-new-tag
tag_name="$1"
ref_name="$2"
curl --request POST \
     --header "PRIVATE-TOKEN: ${PERSONAL_TOKEN}" \
     "https://${CI_SERVER_HOST}/api/v4/projects/${CI_PROJECT_ID}/repository/tags?tag_name=${tag_name}&ref=${ref_name}"
