#!/bin/bash
IID=$(cat image.iid)
podman run \
    -p 8765:5432 \
    -e POSTGRES_PASSWORD=abc123 \
    "${IID}"
