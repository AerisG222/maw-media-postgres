#!/bin/bash
buildah bud \
    -f Containerfile \
    -t maw-media-postgres \
    --iidfile "image.iid"
