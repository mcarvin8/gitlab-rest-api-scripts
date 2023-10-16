#!/bin/bash
# Create a HTTPS Token in your Personal Account with "api" scope
# Do NOT store this token in version control
TOKEN=update-me
while read b; do
    echo "Attemping to delete pipeline ID $b"
    curl --header "PRIVATE-TOKEN: ${TOKEN}" --request "DELETE" "$b"
    # add minor delay
    echo "Sleeping for 5 seconds before proceeding..."
    sleep 5
done <./pipeline-rest-api-ids.txt
