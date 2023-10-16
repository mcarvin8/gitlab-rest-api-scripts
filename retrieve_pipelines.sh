#!/bin/bash
# Install JQ before running this script

page=1
# You can adjust this based on your preference and API limits
per_page=100
# change branch name and updated_before date
ref_name=main
updated_before='2023-07-07'
# GitLab Project ID and Server
project_id=3400
json_file="pipelines.json"
gitlab_server=""
# Create a HTTPS Token in your Personal Account with "api" scope
# Do NOT store this token in version control
TOKEN=update-me

while true; do
    response=$(curl --header "PRIVATE-TOKEN: ${TOKEN}" "https://${gitlab_server}/api/v4/projects/${project_id}/pipelines?ref=${ref_name}&updated_before=${updated_before}T00:00:00Z&page=$page&per_page=$per_page")
    
    # Check if the response is an empty JSON array "[]"
    if [ "$response" == "[]" ]; then
        break
    fi

    # append to json file
    echo "$response" | jq . >> $json_file
    
    # Increment the page counter for the next request
    ((page++))
done

# format file to contain required URL for GitLab REST API
cat "$json_file" | jq -r '.[] | .id' >> pipeline-rest-api-ids.txt
sed -i "s/^/https:\/\/${gitlab_server}\/api\/v4\/projects\/${project_id}\/pipelines\//" pipeline-rest-api-ids.txt

