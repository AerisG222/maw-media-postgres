#!/bin/bash
IID_FILE=image.iid
TAG=$(date +%Y%m%d%H%M%S)

buildah push --creds "${DH_USER}:${DH_PASS}" "${IID}" docker://aerisg222/maw-media-postgres:"${TAG}"
buildah push --creds "${DH_USER}:${DH_PASS}" "${IID}" docker://aerisg222/maw-media-postgres:latest
