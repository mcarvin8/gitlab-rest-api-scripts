#!/bin/bash
# Reference - https://docs.gitlab.com/ee/api/commits.html#create-a-commit-with-multiple-files-and-actions
source_branch="$1"
new_branch="$2"
commit_message="$3"
input_files=("${@:4}")  # Store all remaining arguments as an array of input files

actions=()

# Generate actions for each input file
for file in "${input_files[@]}"; do
  actions+=("--form")
  actions+=("actions[][action]=update")
  actions+=("--form")
  actions+=("actions[][file_path]=${file}")
  actions+=("--form")
  actions+=("actions[][content]=<${file}")
  actions+=("--form")
  actions+=("actions[][action]=chmod")
  actions+=("--form")
  actions+=("actions[][file_path]=${file}")
  actions+=("--form")
  actions+=("actions[][execute_filemode]=true")
done

curl --request POST \
     --form "branch=${new_branch}" \
     --form "start_branch=${source_branch}" \
     --form "commit_message=${commit_message}" \
     --header "PRIVATE-TOKEN: ${PERSONAL_TOKEN}" \
     "${actions[@]}" \
     "https://${CI_SERVER_HOST}/api/v4/projects/${CI_PROJECT_ID}/repository/commits"
