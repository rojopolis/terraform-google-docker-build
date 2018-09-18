#!/bin/bash -e
NAME=${1}
TAG=${2}
PROJECT=${3}

tag_info=$(gcloud container images list-tags gcr.io/${PROJECT}/${NAME} --filter tags=${TAG} --format=json)
digest=$(echo ${tag_info}|jq '.[0].digest')
timestamp=$(echo ${tag_info}|jq '.[0].timestamp.datetime')

jq -n -r --arg digest "${digest}" --arg timestamp "${timestamp}" \
  '{"digest":$digest,"timestamp":$timestamp}' 