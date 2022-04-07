#!/bin/bash -e
TOKEN=${1}
TAG=${2}
PROJECT=${3}
CONTEXT=${4}
PLATFORM=${5}

echo ${TOKEN} | docker login -u oauth2accesstoken --password-stdin https://gcr.io
docker build --platform ${PLATFORM} -t gcr.io/${PROJECT}/${TAG} ${CONTEXT}
docker push gcr.io/${PROJECT}/${TAG}
